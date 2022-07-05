import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/core/errors/failure.dart';
import 'package:home_decor/app/core/network/network_info.dart';
import 'package:home_decor/app/core/usecases/usecase.dart';
import 'package:home_decor/app/data/datasources/local/address_local_datasource.dart';
import 'package:home_decor/app/data/model/address.dart';
import 'package:home_decor/app/domain/usecases/address/get_local_address.dart';
import 'package:home_decor/injector.dart';
import 'package:home_decor/main.dart';

class AddressController extends GetxController {
  final network = Injector.resolve<NetworkInfoI>();
  final connectvityResult = ConnectivityResult.none.obs;

  final getLocalAddress = Injector.resolve<GetLocalAddress>();
  final focusNode = FocusNode();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final fullnameController = TextEditingController();
  final phoneController = TextEditingController();
  final provinceController = TextEditingController();
  final homeController = TextEditingController();
  final otherController = TextEditingController();

  final viewState = ViewState.initial.obs;
  RxList<AddressModel> address = <AddressModel>[].obs;
  List<AddressModel> get getaddress => List.from(address);
  late Position position;
  late List<Placemark> placemarks;

  @override
  void onInit() async {
    await Injector.resolve<AddressDataSource>().initDb();
    localFetchAddress();

    connectvityResult.value = await network.connectivityResult;
    if (connectvityResult.value != ConnectivityResult.none) {
      determinePosition().then((value) async {
        position = value;
        Future.delayed(const Duration(milliseconds: 300), () async {
          placemarks = await placemarkFromCoordinates(
              position.latitude, position.longitude);
          print('Provinsi ${placemarks[1].administrativeArea}');
          print('Kabupaten ${placemarks[1].subAdministrativeArea}');
          print('Kecamatan ${placemarks[1].locality}');
          print('Desa/kel ${placemarks[1].subLocality}');
          print('Kode Pos ${placemarks[1].postalCode}');
        });
      });
    }
    super.onInit();
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  // feth data from local database
  Future<void> localFetchAddress() async {
    if (viewState.value == ViewState.busy) return;
    _setState(ViewState.busy);
    final result = await getLocalAddress.call(NoParams());
    _handleFetchResult(result);
  }

  void _handleFetchResult(Either<Failure, List<AddressModel>> result) {
    result.fold((feilure) {
      print(feilure);
      _setState(ViewState.error);
    }, (data) {
      print(data);
      address.value = data;
      _setState(ViewState.data);
    });
  }

  // set viewstate
  void _setState(ViewState state) {
    viewState.value = state;
  }
}

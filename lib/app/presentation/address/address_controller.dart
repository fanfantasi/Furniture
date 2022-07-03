import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/core/errors/failure.dart';
import 'package:home_decor/app/core/usecases/usecase.dart';
import 'package:home_decor/app/data/datasources/local/address_local_datasource.dart';
import 'package:home_decor/app/data/model/address.dart';
import 'package:home_decor/app/domain/usecases/address/get_local_address.dart';
import 'package:home_decor/injector.dart';
import 'package:home_decor/main.dart';

class AddressController extends GetxController {
  final getLocalAddress = Injector.resolve<GetLocalAddress>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final fullnameController = TextEditingController();
  final phoneController = TextEditingController();

  final viewState = ViewState.initial.obs;
  RxList<AddressModel> address = <AddressModel>[].obs;
  List<AddressModel> get getaddress => List.from(address);

  @override
  void onInit() async {
    await Injector.resolve<AddressDataSource>().initDb();
    localFetchAddress();
    super.onInit();
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

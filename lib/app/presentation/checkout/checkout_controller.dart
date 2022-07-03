import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/core/errors/failure.dart';
import 'package:home_decor/app/core/usecases/usecase.dart';
import 'package:home_decor/app/data/model/address.dart';
import 'package:home_decor/app/domain/usecases/address/get_local_single_address_utama.dart';
import 'package:home_decor/app/routes/app_pages.dart';
import 'package:home_decor/injector.dart';
import 'package:home_decor/main.dart';

import '../../data/datasources/local/address_local_datasource.dart';

class CheckoutController extends GetxController {
  final getSingleLocalAddressUtama =
      Injector.resolve<GetSingleLocalAddressUtama>();

  final addressState = ViewState.initial.obs;
  late AddressModel resultAddress;
  @override
  void onInit() async {
    await Injector.resolve<AddressDataSource>().initDb();
    localFetchAddress();
    super.onInit();
  }

  // feth data from local database
  Future<void> localFetchAddress() async {
    if (addressState.value == ViewState.busy) return;
    _addressState(ViewState.busy);
    final result = await getSingleLocalAddressUtama.call(NoParams());
    _handleFetchResult(result);
  }

  void _handleFetchResult(Either<Failure, AddressModel> result) {
    result.fold((feilure) {
      _addressState(ViewState.error);
      Get.toNamed(Routes.address);
    }, (data) {
      resultAddress = data;
      print(data);
      _addressState(ViewState.data);
    });
  }

  // set addressstate
  void _addressState(ViewState state) {
    addressState.value = state;
  }
}

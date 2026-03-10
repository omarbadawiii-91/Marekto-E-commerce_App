import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:market_app/core/models/rates_model/rate/rate.dart';
import 'package:market_app/core/services/api_services/api_services.dart';
import 'package:meta/meta.dart';

part 'product_cubit_state.dart';

class ProductDetails extends Cubit<ProductDetailsState> {
  ProductDetails() : super(ProductDetailsInitial());
  final ApiServices _apiServices = ApiServices();
  List<Rate> rates = [];
  int avaragerate = 0;

  Future <void> getproductdetails(String productid) async {
    emit(ProductDetailsLoading());
    try {
      var response = await _apiServices.getData('rates_table?select=*&product_id=eq.$productid');
      log(response.data.toString());
      for (var rate in response.data) {
        rates.add(Rate.fromJson(rate));
      }
      for (var allrates in rates) {
          avaragerate += allrates.rates!;
          log(avaragerate.toString());
      }
      avaragerate = avaragerate ~/ rates.length;
      emit(ProductDetailsSuccess());
    } catch (e) {
      emit(ProductDetailsFailed(e.toString()));
    }
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:market_app/core/models/product_model/models.dart';
import 'package:market_app/core/services/api_services/api_services.dart';
import 'package:meta/meta.dart';

part 'getproductdata_state.dart';

class GetproductdataCubit extends Cubit<GetproductdataState> {
  GetproductdataCubit() : super(GetproductdataInitial());
  final ApiServices _apiServices = ApiServices();
  List<ProductModel> products = [];
  Future<void> getproductdata() async {
    emit(GetproductdataLoading());
    try {
      var response = await _apiServices.getData(
        'product_table?select=*,favorite_table(*),purches_table(*)',
      );
      for (var product in response.data) {
        products.add(ProductModel.fromJson(product));
      }
      emit(GetproductdataSuccess());
      log(products.toString());
    } catch (e) {
      emit(GetproductdataFailed(message: e.toString()));
    }
  }
}

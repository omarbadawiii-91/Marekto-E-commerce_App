import 'package:dio/dio.dart';
import 'package:market_app/core/keys/sensitive_data.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: SensitiveData.baseurl,
      headers: {"apikey": SensitiveData.apikey},
    ),
  );

  Future<Response> getData(String url) async {
    return await _dio.get(url);
  }

  Future<Response> postdata(String url, Map<String, dynamic> data) async {
    return await _dio.post(url, data: data);
  }

  Future<Response> patchdata(String url, Map<String, dynamic> data) async {
    return await _dio.patch(url, data: data);
  }

  Future<Response> deletedata(String url) async {
    return await _dio.delete(url);
  }
}

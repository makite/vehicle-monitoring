import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiClient {
  var token;
  var baseUrl;

  ApiClient() {
    token = dotenv.get('API_TOKEN');
    baseUrl = dotenv.get('API_BASE_URL');
  }

  final Dio dio = Dio(BaseOptions(
    connectTimeout: const Duration(minutes: 7),
    receiveTimeout: const Duration(minutes: 7),
    sendTimeout: const Duration(minutes: 7),
    responseType: ResponseType.json,
    followRedirects: false,
    headers: {
      'Authorization': 'Bearer ${dotenv.get('API_TOKEN')}',
      'Content-Type': 'application/json',
    },
    validateStatus: (status) {
      return true;
    },
  ));

  Future<Response> get(String url, Map<String, dynamic>? params,
      Map<String, dynamic> urlParams) async {
    try {
      var response = await dio.get("$baseUrl$url", queryParameters: params);
      _handleResponseErrors(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
      String url, dynamic data, Map<String, dynamic>? params) async {
    try {
      var response =
          await dio.post("$baseUrl$url", data: data, queryParameters: params);
      _handleResponseErrors(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
      String url, dynamic data, Map<String, dynamic>? params) async {
    try {
      var response =
          await dio.put("$baseUrl$url", data: data, queryParameters: params);
      _handleResponseErrors(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(String url, Map<String, dynamic>? params) async {
    try {
      var response = await dio.delete("$baseUrl$url", queryParameters: params);
      _handleResponseErrors(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getCity(String url, Map<String, dynamic>? params,
      Map<String, dynamic> urlParams) async {
    try {
      var response = await dio.get(url, queryParameters: params);
      _handleResponseErrors(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  void _handleResponseErrors(Response response) {
    if (response.data.toString().contains("502 Bad Gateway") ||
        response.data.toString().contains("504 Gateway Time-out")) {
      throw Exception("Server error");
    }
    if (response.statusCode == 401) {
      throw Exception("Not Found");
    }
  }
}

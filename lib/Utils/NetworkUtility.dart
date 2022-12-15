import 'dart:async';
import 'package:dio/dio.dart';

class NetworkUtil {
  static final NetworkUtil _instance = NetworkUtil.internal();
  factory NetworkUtil() {
    return _instance;
  }
  NetworkUtil.internal();

  final _dio = Dio();

  Future<dynamic> get(String url) async {
    var client = await getApiClient();
    print(url);
    try {
      var response = await client.get(url);
      return [response.data, response.statusCode];
    } on DioError catch (e) {
      return [e.response?.data, e.response?.statusCode];
    }
  }

  Future<dynamic> post(
    String url, {
    Map? headers,
    body,
    encoding,
  }) async {
    var client = await getApiClient();
    print(url);
    print(body);

    try {
      var response = await client.post(url,
          data: FormData.fromMap(body as Map<String, dynamic>));
      print(response);
      return [response.data, response.statusCode];
    } on DioError catch (e) {
      return [e.response?.data, e.response?.statusCode];
    }
  }

  Map<String, String> getHeader() {
    Map<String, String> header = <String, String>{};
    header["Accept"] = "application/json";

    return header;
  }

  Future<Dio> getApiClient() async {
    _dio.options.headers = getHeader();
    return _dio;
  }
}

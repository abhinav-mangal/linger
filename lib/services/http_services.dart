import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../utils/logger_utils.dart';
import 'base_api.dart';
import 'package:path/path.dart' as p;

class ApiProvider {
  ApiProvider.instance();

  Future<dynamic> get(String url, {String? token}) async {
    dynamic responseJson;
    final header = {"Accept": "application/json"};
    if (token != null) {
      header.addAll({"Authorization": "Bearer $token"});
    }
    try {
      reqLogger(BaseApi.baseUrl + url, 'GET');
      final response = await http.get(
        Uri.parse(BaseApi.baseUrl + url),
        headers: header,
      );
      responseJson = _response(response, BaseApi.baseUrl + url, 'GET');
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response, String uri, String reqType) {
    final cdt = DateTime.now();
    try {
      final cdt = DateTime.now();
      switch (response.statusCode) {
        case 200:
          AppLogger.i('Parsed $uri $reqType at $cdt  \n res -> ${response.body}');
          dynamic responseJson;
          try {
            responseJson = json.decode(response.body.toString());
          } catch (e) {
            responseJson = response.body;
          }
          AppLogger.i('Parsed $uri $reqType at $cdt  \n data res -> $responseJson');
          return responseJson;

        case 400:
          AppLogger.e(
              'Error Code 400 for $uri ${reqType.toUpperCase()} at $cdt  \n error res -> ${response.body.toString()}');
          throw BadRequestException(response.body.toString());
        case 401:
          AppLogger.e('Error Code 401 for $uri ${reqType.toUpperCase()} at $cdt and res ${response.body}');
          return json.decode(response.body);
        case 403:
          AppLogger.e(
              'Error Code 403 for $uri ${reqType.toUpperCase()} at $cdt  \n error res -> ${response.body.toString()}');
          throw UnauthorisedException(response.body.toString());
        case 500:
          AppLogger.i('Parsed $uri $reqType at $cdt  \n res -> ${response.body}');
          dynamic responseJson;
          try {
            responseJson = json.decode(response.body.toString());
          } catch (e) {
            responseJson = response.body;
          }
          AppLogger.i('Parsed $uri $reqType at $cdt  \n data res -> $responseJson');
          return responseJson;
        default:
          AppLogger.e(
              'Error occurred while Communication with Server with StatusCode : ${response.statusCode} for request $uri ${reqType.toUpperCase()} at $cdt  \n error res -> ${response.body.toString()}');
          return json.decode(response.body);
      }
    } catch (e) {
      AppLogger.e('Error Code 400 for $uri ${reqType.toUpperCase()} at $cdt  \n error res -> ${e.toString()}');
      throw BadRequestException(response.body.toString());
    }
  }

  Future<Dio> getApiClient(String? token) async {
    Dio().options.headers = getHeader(token);
    return Dio();
  }

  Map<String, String> getHeader(String? token) {
    final header = {"Accept": "application/json"};
    if (token != null) {
      header.addAll({"Authorization": "Bearer $token"});
    }
    return header;
  }

  Future<dynamic> post({required String url, String? token, dynamic data}) async {
    final header = {"Accept": "application/json"};
    if (token != null) {
      header.addAll({"Authorization": "Bearer $token"});
    }

    dynamic responseJson;
    try {
      reqLogger(
        '${BaseApi.baseUrl}$url, data -> $data',
        'POST',
      );
      final response = await http.post(
        Uri.parse(
          BaseApi.baseUrl + url,
        ),
        body: data,
        headers: header,
      );
      responseJson = _response(response, BaseApi.baseUrl + url, 'POST');
    } catch (e) {
      AppLogger.e('Failed to Post Data at -> ${BaseApi.baseUrl + url} exception - $e, token - $token');
      throw FetchDataException('Failed to Post Data at -> ${BaseApi.baseUrl + url} $e');
    }
    return responseJson;
  }

  Future<dynamic> uploadFile({required String url, String? token, String? filePaths, String? fileKey}) async {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        filePaths!,
        filename: p.basename(filePaths),
      ),
    });

    var client = await getApiClient(token);
    dynamic responseJson;
    try {
      reqLogger(
        '${BaseApi.baseUrl}$url, data -> ${formData.files.toList()}',
        'POST',
      );
      final response = await client.post(
        BaseApi.baseUrl + url,
        data: formData,
      );
      responseJson = _response(response as http.Response, BaseApi.baseUrl + url, 'POST');
    } on DioError catch (e) {
      AppLogger.e('Failed to Post Data at -> ${BaseApi.baseUrl + url} $e');
      throw FetchDataException('Failed to Post Data at -> ${BaseApi.baseUrl + url} $e');
    }
    return responseJson;
  }

  void reqLogger(String uri, String reqType, {String? data}) {
    final cdt = DateTime.now();
    AppLogger.i('New ${reqType.toUpperCase()} for $uri at $cdt ${data != null ? 'with req body -> $data' : ''} ');
  }
}

class CustomException implements Exception {
  final String message;
  final String? prefix;

  CustomException({required this.message, this.prefix});

  @override
  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException(String message) : super(message: message, prefix: "Error During Communication:");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message: message, prefix: "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message: message, prefix: "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException(String message) : super(message: message, prefix: "Invalid Input: ");
}

class CustomResponse {
  final String message;
  final bool isSuccess;
  final dynamic data;

  CustomResponse({required this.isSuccess, required this.data, required this.message});
}

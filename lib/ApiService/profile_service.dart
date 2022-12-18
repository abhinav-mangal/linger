// import 'dart:convert';

// import '../Utils/logger_utils.dart';
// import '../services/base_api.dart';
// import 'package:http/http.dart' as http;

// import '../services/http_services.dart';

// class UpdateProfile {
//   Future<dynamic> post(
//       {required String url, String? token, dynamic data}) async {
//     final header = {"Accept": "application/json"};
//     if (token != null) {
//       header.addAll({"Authorization": "Bearer $token"});
//     }

//     dynamic responseJson;
//     try {
//       reqLogger(
//         '${BaseApi.baseUrl}$url, data -> $data',
//         'POST',
//       );
//       final response = await http.post(
//         Uri.parse(
//           BaseApi.baseUrl + url,
//         ),
//         body: data,
//         headers: header,
//       );
//       responseJson = _response(response, BaseApi.baseUrl + url, 'POST');
//     } catch (e) {
//       AppLogger.e(
//           'Failed to Post Data at -> ${BaseApi.baseUrl + url} exception - $e, token - $token');
//       throw FetchDataException(
//           'Failed to Post Data at -> ${BaseApi.baseUrl + url} $e');
//     }
//     return responseJson;
//   }
// }

// void reqLogger(String uri, String reqType, {String? data}) {
//   final cdt = DateTime.now();
//   AppLogger.i(
//       'New ${reqType.toUpperCase()} for $uri at $cdt ${data != null ? 'with req body -> $data' : ''} ');
// }
//   dynamic _response(http.Response response, String uri, String reqType) {
//     final cdt = DateTime.now();
//     try {
//       final cdt = DateTime.now();
//       switch (response.statusCode) {
//         case 200:
//           AppLogger.i('Parsed $uri $reqType at $cdt  \n res -> ${response.body}');
//           dynamic responseJson;
//           try {
//             responseJson = json.decode(response.body.toString());
//           } catch (e) {
//             responseJson = response.body;
//           }
//           AppLogger.i('Parsed $uri $reqType at $cdt  \n data res -> $responseJson');
//           return responseJson;

//         case 400:
//           AppLogger.e(
//               'Error Code 400 for $uri ${reqType.toUpperCase()} at $cdt  \n error res -> ${response.body.toString()}');
//           throw BadRequestException(response.body.toString());
//         case 401:
//           AppLogger.e('Error Code 401 for $uri ${reqType.toUpperCase()} at $cdt and res ${response.body}');
//           return json.decode(response.body);
//         case 403:
//           AppLogger.e(
//               'Error Code 403 for $uri ${reqType.toUpperCase()} at $cdt  \n error res -> ${response.body.toString()}');
//           throw UnauthorisedException(response.body.toString());
//         case 500:
//           AppLogger.i('Parsed $uri $reqType at $cdt  \n res -> ${response.body}');
//           dynamic responseJson;
//           try {
//             responseJson = json.decode(response.body.toString());
//           } catch (e) {
//             responseJson = response.body;
//           }
//           AppLogger.i('Parsed $uri $reqType at $cdt  \n data res -> $responseJson');
//           return responseJson;
//         default:
//           AppLogger.e(
//               'Error occurred while Communication with Server with StatusCode : ${response.statusCode} for request $uri ${reqType.toUpperCase()} at $cdt  \n error res -> ${response.body.toString()}');
//           return json.decode(response.body);
//       }
//     } catch (e) {
//       AppLogger.e('Error Code 400 for $uri ${reqType.toUpperCase()} at $cdt  \n error res -> ${e.toString()}');
//       throw BadRequestException(response.body.toString());
//     }
//   }
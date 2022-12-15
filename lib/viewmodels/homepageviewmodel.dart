import 'dart:convert';

import 'package:linger/constants/apiendpoints.dart';
import 'package:http/http.dart' as http;
import '../models/homepage/TimingResponse.dart';

Future<Timings> getNamazTiming(String date, String address) async {
  final url =
      "${APIEndPoints.BASE_URL}${APIEndPoints.timing}$date?address=$address";
  final response = await http.get(Uri.parse(url));

  print(response.body);
  // String jsonData = jsonDecode(response.body);
  //
  // print(jsonData);
  final Map<String, dynamic> data = json.decode(response.body);

  TimingResponse timingResponse = TimingResponse.fromJson(data);

  print(timingResponse.timingResponseBody!.timings!.asr);
  return timingResponse.timingResponseBody!.timings!;
}

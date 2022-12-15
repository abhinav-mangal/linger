import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class DownloadManager {
  static var httpClient = HttpClient();
  var byte;
  String dir = "";

  Future<File> downloadFileTest(String url, String filename) async {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    if (Platform.isAndroid) {
      dir = (await getApplicationDocumentsDirectory()).path;
    } else {
      dir = (await getTemporaryDirectory()).path;
    }
    File file = File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }
}

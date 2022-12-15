import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'app/app_provider.dart';
import 'locator.dart';

Future<void> main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Firebase.initializeApp();
  }
  // MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.shortestSide<600? runApp(const AppProvider()):
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const AppProvider());
  });
  // runApp(const AppProvider());
}

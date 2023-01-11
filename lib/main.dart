import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio_background/just_audio_background.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'app/app_provider.dart';
import 'locator.dart';

Future<void> main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.shortestSide<600? runApp(const AppProvider()):
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await GetStorage.init();
    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    );
    runApp(const AppProvider());
  });
  // runApp(const AppProvider());
}

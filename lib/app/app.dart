import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:linger/router/app_routes.gr.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../locator.dart';
import '../services/local_database.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final db = SqliteDB();
    final router = getItInjector<AppRouter>();
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        title: 'Linger',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerDelegate: AutoRouterDelegate(
          router,
          navigatorObservers: () => [],
        ),
        routeInformationParser: router.defaultRouteParser(),
      );
    });
  }
}

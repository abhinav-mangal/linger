import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/cubits/home_cubit/home_cubit.dart';
import 'package:linger/cubits/library/library_cubit.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:linger/ui/shope/cubit/article_detail_view_cubit.dart';

import '../cubits/chapter/chapter_cubit.dart';
import '../cubits/profile_cubit/profile_cubit.dart';
import '../cubits/sign_in_cubit/signin_cubit.dart';
import '../cubits/signup_cubit/signup_controller_cubit.dart';
import '../cubits/wallet/wallet_cubit.dart';
import '../data/model/shop_dashboard_model/shop_product.dart';
import '../ui/shope/cubit/product_detail_view_cubit.dart';
import 'app.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top,SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpCubit>(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider<SignInCubit>(
          create: (context) => SignInCubit(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider<LibraryCubit>(
          create: (context) => LibraryCubit()..init(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit()
            ..init()
            ..startAnimation(),
        ),
        BlocProvider<WalletCubit>(
          create: (context) => WalletCubit()..init(),
        ),
        BlocProvider(
          create: (_) => ShopCubit(),
        ),
        BlocProvider<ChapterCubit>(
          create: (context) => ChapterCubit()..init(),
        ),
        BlocProvider(
          create: (_) => ArticleViewCubit(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

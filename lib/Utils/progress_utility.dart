import 'package:flutter/material.dart';
import 'package:linger/locator.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../router/app_routes.gr.dart';

class ProgressUtil {
  static OverlayEntry? loader;

  static void showProgress({required BuildContext context}) async {
    final currentContext =
        getItInjector<AppRouter>().navigatorKey.currentContext!;
    //currentContext.read<LoaderCubit>().showLoader();
    await showProgressLoading(context);
  }

  static void hideProgress() async {
    final currentContext =
        getItInjector<AppRouter>().navigatorKey.currentState!.context;
    //currentContext.read<LoaderCubit>().hideLoader();
    hideProgressLoading();
  }

  static void hideProgressLoading() {
    if (loader != null && loader!.mounted) {
      loader?.remove();
      loader = null;
    }
  }

  static Future<void> showProgressLoading(BuildContext context) async {
    if (loader != null) {
      // Loader is already running
      hideProgressLoading();
    }
    OverlayState? overlayState = Overlay.of(context);
    loader = OverlayEntry(
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0.0, 4.00), //(x,y)
                    blurRadius: 5.00,
                    color: Theme.of(context).primaryColor.withOpacity(0.25),
                    //ColorConstant.fromHex('#848795').withOpacity(0.75),
                    spreadRadius: 1.00,
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    LoadingAnimationWidget.fourRotatingDots(
                      color: Colors.white,
                      size: 40,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    overlayState?.insert(loader!);
  }
}

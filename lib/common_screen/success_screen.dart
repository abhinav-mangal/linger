import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/common_screen/successParam.dart';
import 'package:linger/locator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/customText.dart';
import '../router/app_routes.gr.dart';
import '../ui/widgets/my_outline_button.dart';
import '../ui/widgets/primary_button.dart';

class SuccessScreen extends StatelessWidget with baseclass {
  const SuccessScreen({Key? key, this.params}) : super(key: key);
  final SuccessScreenParams? params;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Future.delayed(const Duration(milliseconds: 4000), () {
      final router = getItInjector<AppRouter>();
      AppRouter.getParameters(oid: params!.oid!);
      router.push(
        const OrderStatusScreen(),
      );
      router.removeWhere((route) => route.name == "OrderSummary");
    });

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 40.00,
                right: 40.00,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.00,
                      right: 10.00,
                    ),
                    child: SizedBox(
                      height: getW(52),
                      width: getW(52),
                      child: SvgPicture.asset(
                        'assets/icons/success_icon.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.00,
                      top: 29.00,
                      right: 10.00,
                    ),
                    child: Text(params!.title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: 20.sp,
                        )),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 18.00,
                      ),
                      child: params!.subTitleView ??
                          Text(params!.subTitle,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize: 16,
                              )),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Padding(
                  //       padding: const EdgeInsets.only(
                  //         top: 120.00,
                  //       ),
                  //       child: PrimaryButton(
                  //         title: params.buttonLabel,
                  //         onTap: params.onTap,
                  //       )),
                  // ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: params!.onTap,
                    child: Container(
                        width: getW(160),
                        // height: getH(54),
                        decoration: BoxDecoration(
                          color: getColorFromHex(ColorConstants.green)
                              .withOpacity(0.16),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          // border: Border.all(color: getColorFromHex(ColorConstants.green)),
                        ),
                        child: Center(
                          child: CustomText(
                            marginvalue: EdgeInsets.only(
                                top: getH(16),
                                bottom: getH(16),
                                left: getW(40),
                                right: getW(40)),
                            textalign: TextAlign.center,
                            text: params!.buttonLabel,
                            familytype: 2,
                            textsize: 15.sp,
                            textcolor: getColorFromHex(ColorConstants.green),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

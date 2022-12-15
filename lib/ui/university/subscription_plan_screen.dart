import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/ui/university/view/custom_page_indicator_view.dart';
import 'package:linger/ui/university/view/subsription_plan_view.dart';
import 'package:linger/ui/widgets/screen_conatiner.dart';

import '../widgets/primary_button.dart';

class SubscriptionPlanModel {
  final String? onBoardingImage;
  final String? title;
  final String? subTitle;
  final String? planType;
  final String? planPrice;
  SubscriptionPlanModel({
    this.onBoardingImage,
    this.title,
    this.subTitle,
    this.planType,
    this.planPrice,
  });
}

final plans = [
  SubscriptionPlanModel(
    planPrice: '\$50.00',
    planType: 'Gold Package',
    title: 'Weekly Premium',
    subTitle: 'Let’s start to saving money\nIt’s helpful for budget',
  ),
  SubscriptionPlanModel(
    planPrice: '\$50.00',
    planType: 'Gold Package',
    title: 'Weekly Premium',
    subTitle: 'Let’s start to saving money\nIt’s helpful for budget',
  ),
  SubscriptionPlanModel(
    planPrice: '\$50.00',
    planType: 'Gold Package',
    title: 'Weekly Premium',
    subTitle: 'Let’s start to saving money\nIt’s helpful for budget',
  ),
];

class SubscriptionPlanScreen extends StatefulWidget {
  const SubscriptionPlanScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen>
    with baseclass {
  final pageController = PageController(initialPage: 0, viewportFraction: 0.7);
  final _pageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      return ValueListenableBuilder(
          valueListenable: _pageNotifier,
          builder: (context, pageIndex, child) {
            return ScreenContainer(
              appBarElevation: 0,
              title: 'Subscription Plan',
              child: Column(
                children: [
                  Container(
                    constraints:
                        BoxConstraints(maxHeight: constraints.maxHeight * 0.72),
                    child: PageView.builder(
                      controller: pageController,
                      onPageChanged: (int index) {
                        _pageNotifier.value = index;
                      },
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        final item = plans[index];
                        return SubscriptionPlanView(
                          title: item.title,
                          subTitle: item.subTitle,
                          onBoardingImage: item.onBoardingImage,
                        );
                      },
                      itemCount: plans.length,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getH(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        PageIndicatorView(
                          selected: pageIndex == 0,
                        ),
                        PageIndicatorView(
                          selected: pageIndex == 1,
                        ),
                        PageIndicatorView(
                          selected: pageIndex == 2,
                        ),
                        // PageIndicatorView(
                        //   selected: pageIndex == 3,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              bottomSheet: Container(
                padding: EdgeInsets.only(
                  left: 55,
                  right: 55,
                  bottom: 30,
                ),
                child: PrimaryButton(
                  onTap: () {},
                  radius: 26,
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  customChild: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Get it now',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF Arabic',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}

import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';

class SubscriptionPlanView extends StatelessWidget with baseclass {
  const SubscriptionPlanView({
    Key? key,
    this.title,
    this.onBoardingImage,
    this.subTitle,
    this.planType,
    this.planPrice,
  }) : super(key: key);

  final String? onBoardingImage;
  final String? title;
  final String? subTitle;
  final String? planType;
  final String? planPrice;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      return Container(
        constraints: BoxConstraints(
          maxWidth: constraints.maxWidth * 0.6,
        ),
        child: Card(
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 30,
            bottom: 30,
          ),
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(planType ?? 'Gold Package',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 26,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'SF Arabic',
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        )),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getW(
                    30.00,
                  ),
                  right: getW(
                    30.00,
                  ),
                  top: getW(
                    30.00,
                  ),
                  bottom: getW(
                    30.00,
                  ),
                ),
                child: Image.asset(
                  onBoardingImage ?? 'assets/images/plan_view.png',
                  height: getH(
                    constraints.maxHeight * 0.3,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(planPrice ?? '\$50.00',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 26,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'SF Arabic',
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                height: 3,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getH(
                    30.00,
                  ),
                ),
                child: Text(title ?? 'Weekly Premium',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 26,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'SF Arabic',
                          fontWeight: FontWeight.w600,
                        )),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: getH(
                    16.00,
                  ),
                ),
                child: Text(
                  subTitle ??
                      'Let’s start to saving money\n It’s helpful for budget',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: 'SF Arabic',
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

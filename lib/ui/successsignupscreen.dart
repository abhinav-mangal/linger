import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/Dimension.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/Utils/customText.dart';
import 'package:linger/Utils/roundbutton.dart';

class SuccessSignupScreen extends StatefulWidget {
  const SuccessSignupScreen({Key? key}) : super(key: key);

  @override
  State<SuccessSignupScreen> createState() => _SuccessSignupScreenState();
}

class _SuccessSignupScreenState extends State<SuccessSignupScreen>
    with baseclass, SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Animation? sizeAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    sizeAnimation = Tween(begin: 00.0, end: 300.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.0, 0.5)));
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(),
                ),
              ),
              Expanded(
                flex: 9,
                child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: Dimension.margin_extra_extra_very_large),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: getHeight(context) * 0.45,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  double innerHeight = constraints.maxHeight;
                                  double innerWidth = constraints.maxWidth;
                                  return Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        right: 0,
                                        child: Center(
                                          child: Container(
                                            height: sizeAnimation!.value,
                                            width: sizeAnimation!.value,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: ClipRRect(
                                              child: Image.asset(
                                                'assets/images/Decorations.png',
                                                height: sizeAnimation!.value,
                                                width: sizeAnimation!.value,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: innerWidth * 0.2,
                                        left: 0,
                                        right: 0,
                                        child: Center(
                                          child: Container(
                                            height: innerWidth * 0.35,
                                            width: innerWidth * 0.35,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: ClipRRect(
                                              child: Image.asset(
                                                'assets/images/Arabic.png',
                                                height: innerWidth * 0.35,
                                                width: innerWidth * 0.35,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                CustomText(
                                    text: "Success!",
                                    familytype: 1,
                                    marginvalue: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    textsize: Dimension.text_very_mega,
                                    textcolor:
                                        getColorFromHex(ColorConstants.black),
                                    textalign: TextAlign.start),
                                CustomText(
                                    text:
                                        "You have successfully loggeed into your account!",
                                    familytype: 1,
                                    textsize: Dimension.text_medium,
                                    textcolor: getColorFromHex(
                                        ColorConstants.darkcolor),
                                    textalign: TextAlign.start),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 15,
                                        left: Dimension
                                            .margin_extra_extra_very_large,
                                        right: Dimension
                                            .margin_extra_extra_very_large),
                                    child: RoundButton(
                                      onItemtabed: () {},
                                      height: 50,
                                      roundradius: 12,
                                      blurRadius: 20,
                                      startcolor: ColorConstants.darkgreencolor,
                                      endcolor: ColorConstants.darkgreencolor,
                                      textchild: CustomText(
                                        text: "Continue",
                                        familytype: 6,
                                        textsize: Dimension.text_medium,
                                        textcolor: getColorFromHex(
                                            ColorConstants.white),
                                        textalign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

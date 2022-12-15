import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/Utils/CustomEdits.dart';
import 'package:linger/ui/PasswordScreen.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/Utils/common_logics.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toast/toast.dart';

// import '../models/apiresponse.dart';
import '../Utils/customText.dart';
import '../cubits/sign_in_cubit/signin_cubit.dart';
import '../locator.dart';
import '../router/app_routes.gr.dart';
import '../router/route_names.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with baseclass {
  bool _isPasswordVisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late final SignInCubit signInCubit;
  Decoration dec = const BoxDecoration();
  @override
  void initState() {
    // TODO: implement initState
    signInCubit = context.read<SignInCubit>();
    dec = BoxDecoration(
      color: Colors.white,
      border: Border.all(
          width: 1,
          color: getColorFromHex(ColorConstants.greycolor).withOpacity(0.3)),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      // boxShadow: [
      //   BoxShadow(
      //     color: getColorFromHex(ColorConstants.greycolor).withOpacity(0.3),
      //     spreadRadius: 2,
      //     blurRadius: 3,
      //     offset: const Offset(0, 1), // changes position of shadow
      //   ),
      // ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.fromLTRB(4.w, 8.4.h, 0, 0),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      height: 16.w,
                      width: 16.w,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(4.w, 0.h, 4.w, 0),
                      height: 6.4.h,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 1.0,
                              color:
                                  getColorFromHex(ColorConstants.greencolor)),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: CustomEditText(
                        textcontroller: emailController,
                        prefixiconwidget: Container(
                          padding: const EdgeInsets.all(12.5),
                          child: Image.asset(
                            'assets/images/user.png',
                            height: 3.84.w,
                            width: 3.84.w,
                          ),
                        ),
                        hint: 'Enter your email',
                        hinttextcolor: getColorFromHex(ColorConstants.grey),
                        hinttextsize: 17.sp,
                        familytype: 1,
                        textcolor: getColorFromHex(ColorConstants.black),
                        textsize: 17.sp,
                        textalign: TextAlign.left,
                        onchangetext: signInCubit.onEmailInputChanged,
                        bordercolor: Colors.transparent,
                        borderradius: 0,
                        borderwidth: 0,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(4.w, 0.h, 4.w, 0),
                      height: 6.4.h,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 1.0,
                              color:
                                  getColorFromHex(ColorConstants.greencolor)),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: CustomEditText(
                        obscureText: _isPasswordVisible,
                        textcontroller: passwordController,
                        sufixiconwidget: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: getColorFromHex(ColorConstants.green),
                            size: 17.sp,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        prefixiconwidget: Container(
                          padding: const EdgeInsets.all(12.5),
                          child: Image.asset(
                            'assets/images/lock.png',
                            height: 3.84.w,
                            width: 3.84.w,
                          ),
                        ),
                        hint: 'Enter your password',
                        hinttextcolor: getColorFromHex(ColorConstants.grey),
                        hinttextsize: 17.sp,
                        familytype: 1,
                        textcolor: getColorFromHex(ColorConstants.black),
                        textsize: 17.sp,
                        textalign: TextAlign.left,
                        onchangetext: signInCubit.onPasswordInputChanged,
                        bordercolor: Colors.transparent,
                        borderradius: 0,
                        borderwidth: 0,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PasswordScreen()));
                      },
                      child: Container(
                        width: size.width,
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.fromLTRB(4.w, 0.h, 4.w, 0),
                        child: CustomText(
                          text: 'Forgot Password?',
                          familytype: 1,
                          linecount: 1,
                          textcolor: getColorFromHex(ColorConstants.greencolor),
                          textsize: 17.sp,
                          align: Alignment.centerRight,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(4.w, 0.h, 4.w, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          if (validateEmail(emailController.text) &&
                              validatePassword(passwordController.text)) {
                            signInCubit.loginFunc();
                            // Map<String, String> request = Map<String, String>();
                            //
                            // request["email"] = emailController.text;
                            // request["password"] = passwordController.text;
                            //
                            // // ApiResponse response = await LoginService().login(request);
                            // // if(response.success) {
                            //   Navigator.of(context).pushAndRemoveUntil(
                            //       MaterialPageRoute(builder: (context) =>
                            //       const HomePage()), (route) => false);
                            //  // }

                          }
                        },
                        child: Container(
                          width: size.width,
                          height: 6.4.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: getColorFromHex(ColorConstants.green),
                            borderRadius: BorderRadius.circular(15.sp),
                          ),
                          child: CustomText(
                            text: 'Login',
                            familytype: 2,
                            linecount: 1,
                            textcolor: Colors.white,
                            textsize: 17.sp,
                            align: Alignment.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.8.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 8,
                              child: Divider(
                                color: getColorFromHex(ColorConstants.greycolor)
                                    .withOpacity(0.36),
                                thickness: 1.0,
                              )),
                          Expanded(
                            flex: 3,
                            child: CustomText(
                              text: 'Or',
                              familytype: 1,
                              linecount: 1,
                              textcolor: Colors.black,
                              marginvalue: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
                              textsize: 17.sp,
                              align: Alignment.center,
                            ),
                          ),
                          Expanded(
                              flex: 8,
                              child: Divider(
                                color: getColorFromHex(ColorConstants.greycolor)
                                    .withOpacity(0.36),
                                thickness: 1.0,
                              )),
                        ],
                      ),
                      // Text('---------- Or ----------', style: TextStyle(fontSize: 17.sp),),
                      SizedBox(
                        height: 3.8.h,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2.h, 0, 1.h),
                        decoration: dec,
                        child: socialmediabutton('Glogo.png', "Google", () {},
                            getColorFromHex(ColorConstants.greycolor), false),
                      ),

                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2.h, 0, 1.h),
                        decoration: dec,
                        child: socialmediabutton(
                            'Fblogo.png',
                            "Facebook",
                            () {},
                            getColorFromHex(ColorConstants.greycolor),
                            false),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          final router = getItInjector<AppRouter>();
          router.pushNamed(RouteNames.signUpScreen);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 5.6.h),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Don’t have an account? ',
              style: TextStyle(color: Colors.black, fontSize: 17.sp),
              children: <TextSpan>[
                TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                        fontSize: 17.sp)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class socialmediabutton extends StatelessWidget with baseclass {
  socialmediabutton(this.moreimage, this.morename, this.morefunction,
      this.color, this.arrowshow);
  final Color color;
  final String moreimage;
  final String morename;
  final Function() morefunction;
  final bool arrowshow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.9.h,
      child: Center(
        child: InkWell(
          onTap: morefunction,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: 3.w,
                ),
                Image.asset(
                  "assets/images/$moreimage",
                  // height: 5.64.w,
                  // width: 5.64.w,
                  height: 2.6.h,
                  width: 2.6.h,
                ),
                SizedBox(
                  width: 77.w,
                  height: 2.6.h,
                  child: Center(
                    child: Text(
                      morename,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ]),
              const Spacer(),
              Visibility(
                  visible: arrowshow,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: color,
                    size: 18.sp,
                  )),
              SizedBox(
                width: 4.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

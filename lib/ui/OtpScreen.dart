import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/cubits/profile_cubit/profile_cubit.dart';
import 'package:linger/Utils/colors.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with baseclass {
  int resendOtp = 60;
  late Timer resendTimer;
  late final TextEditingController otpController;
  late final ProfileCubit profileCubit;
  final otpNotifier = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    profileCubit = context.read<ProfileCubit>();
    otpController =
        TextEditingController(text: profileCubit.state.user?.user?.otp);
    // resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
    //   if (resendOtp > 0) {
    //     setState(() {
    //       resendOtp--;
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    resendTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return LoaderOverlay(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              title: const Text(
                'Create Account',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Container(
              padding: EdgeInsets.only(
                  top: getH(20), left: getW(16), right: getW(16)),
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Enter 6-digit code',
                      textAlign: TextAlign.left,
                    ),
                  ),
                  PinFieldAutoFill(
                    decoration: UnderlineDecoration(
                      textStyle:
                          const TextStyle(fontSize: 20, color: Colors.black),
                      colorBuilder:
                          FixedColorBuilder(Colors.black.withOpacity(0.3)),
                    ),
                    currentCode: '',
                    onCodeSubmitted: (code) {
                      profileCubit.verifyOTP(
                        context,
                        state.user?.user?.otp ?? '',
                      );
                    },
                    onCodeChanged: (code) {},
                    controller: otpController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //
                  //   },
                  //   child: Container(
                  //     width: size.width,
                  //     alignment: Alignment.bottomRight,
                  //     child: Text(
                  //       'Resend OTP in $resendOtp',
                  //       textAlign: TextAlign.right,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Text('Resend OTP in $resendOtp', style: TextStyle(),),
                  InkWell(
                      onTap: () {
                        profileCubit.verifyOTP(
                          context,
                          state.user?.user?.otp ?? '',
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(
                          right: 20,
                          left: 20,
                          top: 10,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                            color: getColorFromHex(ColorConstants.green),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                color: getColorFromHex(ColorConstants.green),
                                width: 1)),
                        child: const Text(
                          "Continue",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

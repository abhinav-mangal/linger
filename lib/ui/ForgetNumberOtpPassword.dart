import 'dart:async';

import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/ui/ForgetNumberResetPassword.dart';
import 'package:linger/Utils/colors.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpPassword extends StatefulWidget {
  const OtpPassword({Key? key}) : super(key: key);

  @override
  State<OtpPassword> createState() => _OtpPasswordState();
}

class _OtpPasswordState extends State<OtpPassword> with baseclass {
  int resendOtp = 60;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendOtp > 0) {
        setState(() {
          resendOtp--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
          'Forgot Password',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
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
                textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
              ),
              currentCode: '',
              onCodeSubmitted: (code) {},
              onCodeChanged: (code) {},
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const ResetPassword()));
              },
              child: Container(
                width: size.width,
                alignment: Alignment.bottomRight,
                child: Text(
                  'Resend OTP in $resendOtp',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Text('Resend OTP in $resendOtp', style: TextStyle(),),
            InkWell(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => const ResetPassword()));
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
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
    );
  }
}

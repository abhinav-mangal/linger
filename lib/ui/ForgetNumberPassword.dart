import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/ui/ForgetNumberOtpPassword.dart';
import 'package:linger/Utils/colors.dart';
import 'package:flutter/services.dart';

class NumberPassword extends StatefulWidget {
  const NumberPassword({Key? key}) : super(key: key);

  @override
  State<NumberPassword> createState() => _NumberPasswordState();
}

class _NumberPasswordState extends State<NumberPassword> with baseclass {
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
                'Phone Number',
                textAlign: TextAlign.left,
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: "Enter your Mobile Number",
                counterText: '',
              ),
              maxLength: 10,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const OtpPassword()));
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
                    "Send Code",
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

import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/ui/ForgetEmailPassword.dart';
import 'package:linger/ui/ForgetNumberPassword.dart';
import 'package:linger/Utils/colors.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> with baseclass {
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
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                alignment: Alignment.topLeft,
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20.5),
                padding: const EdgeInsets.all(10.5),
                // height: 50,

                child: const Text(
                  "Reset password with:",
                  style: TextStyle(fontSize: 17.0, color: Colors.grey),
                ),
              ),
            ]),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
              padding: const EdgeInsets.all(7.5),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: getColorFromHex(ColorConstants.green), width: 1)),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NumberPassword()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/phone.png',
                      height: 20.0,
                      width: 20.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: size.width - 87,
                      padding: const EdgeInsets.only(right: 25),
                      child: const Text(
                        "Phone Number",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
              padding: const EdgeInsets.all(7.5),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: getColorFromHex(ColorConstants.green), width: 1)),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EmailPassword()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/envol.png',
                      height: 20.0,
                      width: 20.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: size.width - 87,
                      padding: const EdgeInsets.only(right: 25),
                      child: const Text(
                        "Email ",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

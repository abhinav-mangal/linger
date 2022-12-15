import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> with baseclass {
  bool _isPasswordVisible = true;

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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: size.width,
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Phone Number',
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: _isPasswordVisible,
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        hintText: 'Enter your password',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width,
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Password must be at least 8 characters and contains an upper case and lowercase character with numbers and special characters.',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                InkWell(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateAccount()));
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
                        "Done",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                    )),
                Wrap()
              ]),
        ),
      ),
    );
  }
}

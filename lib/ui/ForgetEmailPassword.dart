import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Controller/controller_update_password.dart';
import 'package:linger/Utils/colors.dart';

import '../cubits/profile_cubit/profile_cubit.dart';

class EmailPassword extends StatefulWidget {
  const EmailPassword({Key? key}) : super(key: key);

  @override
  State<EmailPassword> createState() => _EmailPasswordState();
}

class _EmailPasswordState extends State<EmailPassword> with baseclass {
  // TextEditingController emailController = TextEditingController();
  UpdatePasswordController controller = Get.put(UpdatePasswordController());
  late final ProfileCubit profileCubit;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    profileCubit = context.read<ProfileCubit>();
    super.initState();
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
                'Email',
                textAlign: TextAlign.left,
              ),
            ),
            Form(
              key: _formKey,
              child: TextFormField(
                decoration: const InputDecoration(hintText: "Enter your Email"),
                controller: controller.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email id";
                  } else if (!value.isEmail) {
                    return "Please enter a valid email id";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    profileCubit.isForgot = true;
                    controller.updatePasswordEmail(context);
                  }
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

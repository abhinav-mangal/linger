import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:toast/toast.dart';

import '../Utils/common_logics.dart';
import '../cubits/signup_cubit/signup_controller_cubit.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> with baseclass {
  bool _isPasswordVisible = true;

  late final SignUpCubit signupCubit;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState

    signupCubit = context.read<SignUpCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ToastContext().init(context);

    return BlocBuilder<SignUpCubit, SignUpState>(
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
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(40.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        width: size.width,
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'First Name',
                          textAlign: TextAlign.left,
                        ),
                      ),
                      TextFormField(
                        validator: signupCubit.validateName,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2),
                          ),
                          hintText: 'Enter your first name',
                        ),
                        onChanged: signupCubit.onfNameChange,
                        initialValue: state.fname,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: size.width,
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Last Name',
                          textAlign: TextAlign.left,
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2),
                          ),
                          hintText: 'Enter your last name',
                        ),
                        onChanged: signupCubit.onlNameChange,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: size.width,
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Email',
                          textAlign: TextAlign.left,
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2),
                          ),
                          hintText: 'Enter your email',
                        ),
                        onChanged: signupCubit.onEmailChange,
                        initialValue: state.email,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: size.width,
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Password',
                          textAlign: TextAlign.left,
                        ),
                      ),
                      TextField(
                        obscureText: _isPasswordVisible,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2),
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
                        onChanged: signupCubit.onPasswordChange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                          'Password must be at least 8 characters and contains an upper case and lowercase character with numbers and special characters.'),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                          onTap: () {
                            if (validateEmail(state.email) &&
                                validatePassword(state.password)) {
                              signupCubit.createAccount(context);
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
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        getColorFromHex(ColorConstants.green),
                                    width: 1)),
                            child: const Text(
                              "Create Account",
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
            ),
          ),
        );
      },
    );
  }
}

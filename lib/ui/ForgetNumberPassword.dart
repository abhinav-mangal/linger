import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/cubits/profile_cubit/profile_cubit.dart';
import 'package:linger/Utils/colors.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';

class NumberPassword extends StatefulWidget {
  const NumberPassword({Key? key}) : super(key: key);

  @override
  State<NumberPassword> createState() => _NumberPasswordState();
}

class _NumberPasswordState extends State<NumberPassword> with baseclass {
  late final ProfileCubit profileCubit;
  final mnoNotifier = ValueNotifier<String?>(null);

  @override
  void initState() {
    // TODO: implement initState

    profileCubit = context.read<ProfileCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoaderOverlay(
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
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
              padding: EdgeInsets.only(
                  top: getH(20), left: getW(16), right: getW(16)),
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
                    onChanged: (String? value) {
                      mnoNotifier.value = value;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 10, // Only numbers can be entered
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: mnoNotifier,
                    builder: (context, value, child) {
                      return InkWell(
                          onTap: () {
                            if (value != null && value.isNotEmpty) {
                              profileCubit.isForgot = true;
                              profileCubit.sendOTP(context, value);
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
                                color: getColorFromHex(ColorConstants.green)
                                    .withOpacity(
                                        value != null && value.isNotEmpty
                                            ? 0.9
                                            : 0.4),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        getColorFromHex(ColorConstants.green),
                                    width: 1)),
                            child: const Text(
                              "Send Code",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            ),
                          ));
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

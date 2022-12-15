import 'package:flutter/material.dart';
import 'package:linger/ui/widgets/screen_conatiner.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}

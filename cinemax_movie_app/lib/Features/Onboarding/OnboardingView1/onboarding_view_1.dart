import 'package:flutter/material.dart';

import '../../../Core/Constants/images_const.dart';

class OnboardingView1 extends StatelessWidget {
  const OnboardingView1({super.key});
  static const String routeName = "OnboardingView1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        ConstImages.onboarding1Backgraound,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}

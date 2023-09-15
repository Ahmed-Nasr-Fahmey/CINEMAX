import 'package:flutter/material.dart';
<<<<<<< HEAD
=======

import '../../../Core/Constants/images_const.dart';

>>>>>>> 92742c38d450ed5b82a0381f5d60c20470b6a530
class OnboardingView1 extends StatelessWidget {
  const OnboardingView1({super.key});
  static const String routeName = "OnboardingView1";
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return const Scaffold();
}
=======
    return Scaffold(
      body: Image.asset(
        ConstImages.onboarding1Backgraound,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
>>>>>>> 92742c38d450ed5b82a0381f5d60c20470b6a530
}

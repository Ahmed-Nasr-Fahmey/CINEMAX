import 'package:cinemax_movie_app/Features/Onboarding/LoginSignUp/login_signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Core/Shared/Customs/Custom_BottomSheet.dart';

class OnboardingView3 extends StatelessWidget {
  const OnboardingView3({super.key});
  static const String routeName = "OnboardingView3";
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(top: 45,left: 24,right: 24),
        child: Column(
          children: [
     
                Padding(
                  padding: const EdgeInsets.only(bottom:24),
                  child: SvgPicture.asset(
                    'Assets/images/OnBoarding3.svg',
                    width: double.infinity,
                    height: 300,
                    
                  ),
                ),
            
 CustomBottomSheet(
  title: 'Offers ad-free viewing of high quality',
  subTitle: 'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient.',
  image: 'Assets/images/NextOnBoarding3.svg',
  index: 3,
 onTap: () =>  Navigator.pushNamed(context, LoginSignUpView.routeName),
 
)
      
           ],
        ),
      ),
    );
  }
}
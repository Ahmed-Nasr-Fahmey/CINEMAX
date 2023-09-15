import 'package:cinemax_movie_app/Core/Shared/Customs/Custom_BottomSheet.dart';
import 'package:cinemax_movie_app/Features/Onboarding/OnboardingView3/onboarding_view_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class OnboardingView2 extends StatelessWidget {
  const OnboardingView2({super.key});
  static const String routeName = "OnboardingView2";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(top: 45,left: 24,right: 24),
        child: Column(
          children: [
     
                Padding(
                  padding: const EdgeInsets.only(bottom:24),
                  child: SvgPicture.asset(
                    'Assets/images/OnBoarding2.svg',
                    width: double.infinity,
                    height: 300,
                    
                  ),
                ),
            
 CustomBottomSheet(
  title: 'Offers ad-free viewing of high quality',
  subTitle: 'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient.',
  image: 'Assets/images/NextOnBoarding2.svg',
  index: 2,
 onTap: () =>  Navigator.pushNamed(context, OnboardingView3.routeName),
 
)
      
           ],
        ),
      ),
    );
  }
}
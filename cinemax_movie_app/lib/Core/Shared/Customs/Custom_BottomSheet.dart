import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/ProgressNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({required this.onTap,super.key, required this.index, required this.image, required this.title, required this.subTitle});
final String title;
final String subTitle;
final int index;
final String image;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return    Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Container(
                width: 327,
                height: 320,
                decoration: BoxDecoration(
                  color: ConstColors.blackcolor,
                  borderRadius: BorderRadius.circular(32),
                  
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Text(title,
                        style:  GoogleFonts.montserrat(
                            textStyle: const TextStyle(fontSize: 16,color: ConstColors.whitecolor,fontWeight: FontWeight.w600))
                        ),
                      ),
                
                      Text(subTitle,
                        style:  GoogleFonts.montserrat(
                            textStyle: const TextStyle(fontSize: 14,color: Color(0xFF92929D),fontWeight: FontWeight.w500))
                        ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                 ProgressNavigation(index: index),
                 
                     const   Spacer(),
                      GestureDetector(
                        onTap: onTap,
                        child: Stack(
                          children: [
                            
                            SvgPicture.asset(image,width: 80,height: 80,),
                       const  Positioned(
                          left: 30,
                          top: 30,
                          width: 24,
                          height: 24,
                          child: Icon(
                          
                            Icons.navigate_next_outlined,size: 24,color: Color(0xFF1F1D2B),))
                         
                          ],
                        ),
                      )
                    ],
                  ),
                )
                    ],
                  ),
                ),
                
              ),
            )
     ;
  }
}
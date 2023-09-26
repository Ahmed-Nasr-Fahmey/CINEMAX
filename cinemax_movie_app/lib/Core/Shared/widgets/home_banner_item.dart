
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors_const.dart';

class HomeBannerItem extends StatelessWidget {
  const HomeBannerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: NetworkImage(
              'https://insomniac.games/wp-content/uploads/2018/09/Spider-Man_PS4_E3_2017_Hero.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 0, 0, 0.3),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(
            left: 24,
            bottom: 8,
            child: SizedBox(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Black Panther: Wakanda Forever',
                    style: GoogleFonts.montserrat(
                      color: ConstColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.12,
                    ),
                  ),
                  Text(
                    'On March 2, 2022 ',
                    style: GoogleFonts.montserrat(
                      color: ConstColors.whiteColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.12,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

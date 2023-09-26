import 'dart:ui';

import 'package:cinemax_movie_app/Features/MovieDetails/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors_const.dart';

class HomeMovieCard extends StatelessWidget {
  const HomeMovieCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MovieDetails.routeName);
      },
      child: SizedBox(
        width: 135,
        height: 231,
        child: Stack(
          children: [
            Container(
              width: 135,
              height: 231,
              decoration: ShapeDecoration(
                color: ConstColors.grayColor.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Container(
              width: 135,
              height: 178,
              decoration: const ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/en/2/21/Web_of_Spider-Man_Vol_1_129-1.png'),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8,
              top: 190,
              child: SizedBox(
                width: 119,
                child: Text(
                  'Spider-Man No ..',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    color: ConstColors.whiteColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.12,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8,
              top: 211,
              child: Text(
                'Action',
                style: GoogleFonts.montserrat(
                  color: ConstColors.grayColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            Positioned(
              left: 72,
              top: 8,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: ShapeDecoration(
                      color: ConstColors.backgroundColor.withOpacity(0.7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: ConstColors.premiumColor,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '4.5',
                          style: GoogleFonts.montserrat(
                            color: ConstColors.premiumColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetailsStoryline extends StatelessWidget {
  const MovieDetailsStoryline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Story Line",
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                color: ConstColors.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Originally a story from Archie Comics which started in 1941, Riverdale centres around a group of high school students who are shocked by the death of classmate, Jason Blossom. Together theyunravel the secrets of Riverdale and who ",
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                color: ConstColors.grayColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

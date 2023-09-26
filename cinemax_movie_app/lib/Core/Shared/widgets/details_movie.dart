import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsMovie extends StatelessWidget {
  const DetailsMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.calendar_month_sharp,
          color: ConstColors.grayColor,
          size: 16,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          "2021",
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                color: ConstColors.grayColor,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            width: 1,
            height: 16,
            color: ConstColors.grayColor,
          ),
        ),
        const Icon(
          FontAwesomeIcons.solidClock,
          color: ConstColors.grayColor,
          size: 16,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          "148 Minutes",
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                color: ConstColors.grayColor,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            width: 1,
            height: 16,
            color: ConstColors.grayColor,
          ),
        ),
        const Icon(
          Icons.local_movies_rounded,
          color: ConstColors.grayColor,
          size: 16,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          "Action",
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                color: ConstColors.grayColor,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyDownloadList extends StatelessWidget {
  const EmptyDownloadList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'Assets/images/magic-box 1.png',
            width: 76,
            height: 76,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 75, right: 75, top: 16, bottom: 22),
            child: Text(
              "There is no movie yet!",
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    color: ConstColors.grayColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            width: 180,
            child: Center(
              child: Text(
                "Find your movie by Type title, categories, years, etc ",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: ConstColors.grayColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

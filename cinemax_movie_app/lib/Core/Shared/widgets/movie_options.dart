import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/share_blur.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/trailer_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieOptions extends StatelessWidget {
  const MovieOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 115,
          height: 48,
          decoration: BoxDecoration(
              color: ConstColors.primaryColor,
              borderRadius: BorderRadius.circular(32)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  FontAwesomeIcons.play,
                  size: 14,
                  color: ConstColors.whiteColor,
                ),
              ),
              Text(
                "Trailer",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: ConstColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        const TrailerButton(
          icon: Icons.file_download_outlined,
          backgroundColor: Color(0xFF252836),
          iconColor: ConstColors.primaryColor,
        ),
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return const ShareBlurAlert();
              },
            );
          },
          child: const TrailerButton(
            icon: Icons.share_outlined,
            backgroundColor: Color(0xFF252836),
            iconColor: ConstColors.primaryColor,
          ),
        ),
      ],
    );
  }
}

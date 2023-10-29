import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Core/Models/MovieModel/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieRate extends StatelessWidget {
  const MovieRate({
    super.key,
    required this.movieModel,
  });
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      child: Container(
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ConstColors.backgroundColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              const Icon(
                Icons.star_rate_rounded,
                color: Color.fromRGBO(255, 152, 0, 1),
              ),
              Text(
                '${movieModel.movieRate}'.length > 3
                    ? '${movieModel.movieRate}'.substring(0, 3)
                    : '${movieModel.movieRate}',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Colors.orange,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

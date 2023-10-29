import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Core/Models/MovieModel/movie_model.dart';
import 'package:cinemax_movie_app/Core/Shared/Builders/Home/movie_full_card_builder.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieTrailersView extends StatefulWidget {
  const MovieTrailersView({super.key});
  static const String routeName = "MovieTrailersView";

  @override
  State<MovieTrailersView> createState() => _MovieTrailersViewState();
}

class _MovieTrailersViewState extends State<MovieTrailersView> {
  @override
  Widget build(BuildContext context) {
    final List<MovieModel> moviesVideosList =
        ModalRoute.of(context)!.settings.arguments as List<MovieModel>;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          hasLoveIcon: false,
          text: moviesVideosList.isEmpty ? null : moviesVideosList[0].movieName,
        ),
      ),
      body: SingleChildScrollView(
        child: moviesVideosList.isNotEmpty
            ? MovieFullCardBuilder(moviesVideosList: moviesVideosList)
            : Center(
                child: Text(
                  'No Trailers Found',
                  style: GoogleFonts.roboto(
                    color: ConstColors.grayColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
      ),
    );
  }
}

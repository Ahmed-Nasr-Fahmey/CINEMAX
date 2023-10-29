import 'package:cinemax_movie_app/Core/Models/MovieModel/movie_model.dart';
import 'package:cinemax_movie_app/Core/Shared/Builders/movie_card_builder.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MostPopularView extends StatelessWidget {
  const MostPopularView({super.key});
  static const String routeName = 'MostPopularView';
  @override
  Widget build(BuildContext context) {
    final List<MovieModel> moviesList =
        ModalRoute.of(context)!.settings.arguments as List<MovieModel>;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(
              hasLoveIcon: false,
              text: 'Most Popular Movies',
            ),
            MovieCardBuilder(moviesList: moviesList),
          ],
        ),
      ),
    );
  }
}

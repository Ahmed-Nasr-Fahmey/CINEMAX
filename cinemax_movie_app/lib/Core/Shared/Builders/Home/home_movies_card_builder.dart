import 'package:cinemax_movie_app/Core/Models/MovieModel/movie_model.dart';
import 'package:flutter/material.dart';

import '../../widgets/home_movie_card.dart';

class HomeMoviesCardBuilder extends StatelessWidget {
  const HomeMoviesCardBuilder({
    super.key, required this.moviesList,
  });
  final List<MovieModel> moviesList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: moviesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
              left: 16,
            ),
            child: HomeMovieCard(movieModel: moviesList[index]),
          );
        },
      ),
    );
  }
}

import 'package:cinemax_movie_app/Core/Models/MovieModel/movie_model.dart';
import 'package:flutter/material.dart';

import '../Customs/custom_movie_card.dart';

class MovieCardBuilder extends StatelessWidget {
  const MovieCardBuilder({
    super.key,
    required this.moviesList,
  });
  final List<MovieModel> moviesList;
  @override
  Widget build(BuildContext context) {
    bool isFree = false;
    return SizedBox(
      height: MediaQuery.of(context).size.height - 160,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView.builder(
          itemCount: moviesList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            isFree = !isFree;
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CustomMovieCard(
                  isFree: isFree, movieModel: moviesList[index]),
            );
          },
        ),
      ),
    );
  }
}

import 'package:cinemax_movie_app/Core/Models/MovieModel/movie_model.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/upcoming_movie_card.dart';
import 'package:flutter/material.dart';

class MovieFullCardBuilder extends StatelessWidget {
  const MovieFullCardBuilder({
    super.key,
    required this.moviesVideosList,
  });

  final List<MovieModel> moviesVideosList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 160,
      child: ListView.builder(
        itemCount: moviesVideosList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: MovieFullCard(movieModel: moviesVideosList[index]),
          );
        },
      ),
    );
  }
}

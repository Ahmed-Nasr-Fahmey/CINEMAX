import 'package:cinemax_movie_app/Core/Shared/widgets/movie_item.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/upcoming_movie_description.dart';
import 'package:flutter/material.dart';

class MovieFullCard extends StatelessWidget {
  const MovieFullCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MovieItem(),
        MovieDescription(),
      ],
    );
  }
}

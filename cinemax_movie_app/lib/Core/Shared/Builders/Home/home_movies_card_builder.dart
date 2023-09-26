
import 'package:flutter/material.dart';

import '../../widgets/home_movie_card.dart';

class HomeMoviesCardBuilder extends StatelessWidget {
  const HomeMoviesCardBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(
              bottom: 16,
              left: 16,
            ),
            child: HomeMovieCard(),
          );
        },
      ),
    );
  }
}

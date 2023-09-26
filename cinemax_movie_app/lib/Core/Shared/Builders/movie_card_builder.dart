import 'package:flutter/material.dart';

import '../Customs/custom_movie_card.dart';

class MovieCardBuilder extends StatelessWidget {
  const MovieCardBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool toggel = false;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView.builder(
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              toggel = !toggel;
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomMovieCard(isFree: toggel),
              );
            }),
      ),
    );
  }
}

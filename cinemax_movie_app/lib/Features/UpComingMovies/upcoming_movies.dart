import 'package:cinemax_movie_app/Core/Models/MovieModel/movie_model.dart';
import 'package:cinemax_movie_app/Core/Shared/Builders/Home/movie_full_card_builder.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_app_bar.dart';
import 'package:flutter/material.dart';

class UpcomingMoviesView extends StatefulWidget {
  const UpcomingMoviesView({super.key});
  static const String routeName = "UpcomingMovies";

  @override
  State<UpcomingMoviesView> createState() => _UpcomingMoviesViewState();
}

class _UpcomingMoviesViewState extends State<UpcomingMoviesView> {
  @override
  Widget build(BuildContext context) {
    final List<MovieModel> moviesVideosList =
        ModalRoute.of(context)!.settings.arguments as List<MovieModel>;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child:
                    CustomAppBar(hasLoveIcon: false, text: "Upcoming Movies"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: MovieFullCardBuilder(moviesVideosList: moviesVideosList),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

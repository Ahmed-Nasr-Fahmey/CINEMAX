import 'package:cinemax_movie_app/Core/Models/MovieModel/movie_model.dart';
import 'package:cinemax_movie_app/Core/Services/API/GetServices/get_services.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_sarch_text_field.dart';
import 'package:cinemax_movie_app/Core/Shared/Functions/functions.dart';
import 'package:flutter/material.dart';

import '../../../Core/Shared/Builders/movie_card_builder.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});
  static const routeName = 'SearchView';

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<MovieModel> moviesList = [];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GlobalFunctions.unFocusTextFieldsWhenClickOutSide(context),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              CustomSearchTextField(
                onChanged: (value) async {
                  moviesList =
                      await GetServices.getMoviesByName(movieName: value);
                  setState(() {});
                },
              ),
              MovieCardBuilder(moviesList: moviesList),
            ],
          ),
        ),
      ),
    );
  }
}

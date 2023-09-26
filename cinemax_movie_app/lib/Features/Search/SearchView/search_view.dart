import 'package:cinemax_movie_app/Core/Shared/Customs/custom_sarch_text_field.dart';
import 'package:cinemax_movie_app/Core/Shared/Functions/functions.dart';
import 'package:flutter/material.dart';

import '../../../Core/Shared/Builders/movie_card_builder.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const routeName = 'SearchView';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GlobalFunctions.unFocusTextFieldsWhenClickOutSide(context),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(
                height: 40,
              ),
              CustomSearchTextField(),
              MovieCardBuilder(),
            ],
          ),
        ),
        
      ),
    );
  }
}

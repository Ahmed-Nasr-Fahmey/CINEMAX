import 'package:cinemax_movie_app/Core/Shared/Functions/functions.dart';
import 'package:cinemax_movie_app/Features/MostPopular/most_popular_view.dart';
import 'package:cinemax_movie_app/Features/UpComingMovies/upcoming_movies.dart';
import 'package:flutter/material.dart';

import '../../Core/Shared/Builders/Home/home_banner_items_builder.dart';
import '../../Core/Shared/Builders/Home/home_movies_card_builder.dart';
import '../../Core/Shared/Customs/custom_sarch_text_field.dart';
import '../../Core/Shared/Customs/custom_see_all_row.dart';
import '../../Core/Shared/widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = "HomeView";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GlobalFunctions.unFocusTextFieldsWhenClickOutSide(context),
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: HomeAppBar()),
            const SliverToBoxAdapter(child: CustomSearchTextField()),
            const SliverToBoxAdapter(child: HomeBunnerItemsBuilder()),
            SliverToBoxAdapter(
                child: CustomSeeAllRow(
              text: 'Most popular',
              onPressed: () {
                Navigator.pushNamed(context, MostPopularView.routeName);
              },
            )),
            const SliverToBoxAdapter(child: HomeMoviesCardBuilder()),
            SliverToBoxAdapter(
                child: CustomSeeAllRow(
              text: 'Upcoming',
              onPressed: () {
                Navigator.pushNamed(context, UpcomingMoviesView.routeName);
              },
            )),
            const SliverToBoxAdapter(child: HomeMoviesCardBuilder()),
          ],
        ),
      ),
    );
  }
}

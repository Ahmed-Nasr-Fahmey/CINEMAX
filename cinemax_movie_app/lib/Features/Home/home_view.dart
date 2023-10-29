import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Core/Shared/Functions/functions.dart';
import 'package:cinemax_movie_app/Features/MostPopular/most_popular_view.dart';
import 'package:cinemax_movie_app/Features/TopRated/top_rated_view.dart';
import 'package:cinemax_movie_app/Features/UpComingMovies/upcoming_movies.dart';
import 'package:cinemax_movie_app/StateManagement/Cubits/MovieCubit/movie_cubit.dart';
import 'package:cinemax_movie_app/StateManagement/Cubits/MovieCubit/movie_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../Core/Shared/Builders/Home/home_banner_items_builder.dart';
import '../../Core/Shared/Builders/Home/home_movies_card_builder.dart';
import '../../Core/Shared/Customs/custom_see_all_row.dart';
import '../../Core/Shared/widgets/home_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String routeName = "HomeView";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GlobalFunctions.unFocusTextFieldsWhenClickOutSide(context),
      child: Scaffold(
        body: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            if (state is MovieSuccessState) {
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const SliverToBoxAdapter(child: HomeAppBar()),
                  SliverToBoxAdapter(
                    child: HomeBunnerItemsBuilder(
                      moviesList: BlocProvider.of<MovieCubit>(context)
                          .trendingMoviesList,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomSeeAllRow(
                      text: 'Most Popular',
                      onPressed: () {
                        PersistentNavBarNavigator
                            .pushNewScreenWithRouteSettings(
                          context,
                          settings: RouteSettings(
                              name: MostPopularView.routeName,
                              arguments: BlocProvider.of<MovieCubit>(context)
                                  .mostPopularMoviesList),
                          screen: const MostPopularView(),
                          withNavBar: true,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: HomeMoviesCardBuilder(
                        moviesList: BlocProvider.of<MovieCubit>(context)
                            .mostPopularMoviesList),
                  ),
                  SliverToBoxAdapter(
                    child: CustomSeeAllRow(
                      text: 'Top Rated',
                      onPressed: () {
                        PersistentNavBarNavigator
                            .pushNewScreenWithRouteSettings(
                          context,
                          settings: RouteSettings(
                              name: TopRatedView.routeName,
                              arguments: BlocProvider.of<MovieCubit>(context)
                                  .topRatedMoviesList),
                          screen: const TopRatedView(),
                          withNavBar: true,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: HomeMoviesCardBuilder(
                        moviesList: BlocProvider.of<MovieCubit>(context)
                            .topRatedMoviesList),
                  ),
                  SliverToBoxAdapter(
                    child: CustomSeeAllRow(
                      text: 'Upcoming',
                      onPressed: () {
                        PersistentNavBarNavigator
                            .pushNewScreenWithRouteSettings(
                          context,
                          settings: RouteSettings(
                              name: UpcomingMoviesView.routeName,
                              arguments:
                                  BlocProvider.of<MovieCubit>(context).videos),
                          screen: const UpcomingMoviesView(),
                          withNavBar: true,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: HomeMoviesCardBuilder(
                        moviesList: BlocProvider.of<MovieCubit>(context)
                            .upcomingMoviesList),
                  ),
                ],
              );
            } else if (state is MovieLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Text(
                  'Something went wrong, try again',
                  style: GoogleFonts.roboto(
                    color: ConstColors.grayColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

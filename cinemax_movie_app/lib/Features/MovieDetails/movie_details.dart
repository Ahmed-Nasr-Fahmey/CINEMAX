import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Core/Models/MovieModel/movie_model.dart';
import 'package:cinemax_movie_app/Core/Services/API/cinemax_api.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_app_bar.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/crew_item.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/details_movie.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/drop_downlist.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/movie_details_card.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/movie_details_story.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/movie_options.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/movie_rate.dart';
import 'package:cinemax_movie_app/Features/MovieDetails/movie_trailers_view.dart';
import 'package:cinemax_movie_app/StateManagement/Cubits/MovieCubit/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});
  static const String routeName = "MovieDetails";

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  List<CrewItem> crewMembers = const [
    CrewItem(),
    CrewItem(),
    CrewItem(),
    CrewItem()
  ];

  @override
  Widget build(BuildContext context) {
    final MovieModel movieModel =
        ModalRoute.of(context)!.settings.arguments as MovieModel;
    BlocProvider.of<MovieCubit>(context)
        .getMovieTrailers(movieID: movieModel.movieID.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  '${API.imageBaseUrl}${movieModel.movieImageUrl}',
                  height: 550,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 550,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFF1F1D2B).withOpacity(0.57),
                        const Color(0xFF1F1D2B)
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      CustomAppBar(
                        hasLoveIcon: true,
                        text: movieModel.movieName,
                        movieModel: movieModel,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 16),
                        child: Image.network(
                          '${API.imageBaseUrl}${movieModel.movieImageUrl}',
                          width: 205,
                          height: 280,
                        ),
                      ),
                      const DetailsMovie(),
                      MovieRate(movieModel: movieModel),
                      MovieOptions(
                        movieModel: movieModel,
                        onTap: () {
                          PersistentNavBarNavigator
                              .pushNewScreenWithRouteSettings(
                            context,
                            settings: RouteSettings(
                              name: MovieTrailersView.routeName,
                              arguments: BlocProvider.of<MovieCubit>(context)
                                  .movieTrailersList,
                            ),
                            screen: const MovieTrailersView(),
                            withNavBar: true,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieDetailsStoryline(movieModel: movieModel),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Cast and Crew",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: ConstColors.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: crewMembers.length,
                      itemBuilder: (context, index) {
                        return const CrewItem();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Episode",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: ConstColors.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const DropDownList(),
                  const SizedBox(
                    height: 16,
                  ),
                  MovieDetailsCard(movieModel: movieModel),
                  const SizedBox(
                    height: 54,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

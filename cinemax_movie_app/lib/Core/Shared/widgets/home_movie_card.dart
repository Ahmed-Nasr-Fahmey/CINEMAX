import 'dart:ui';

import 'package:cinemax_movie_app/Core/Models/MovieModel/movie_model.dart';
import 'package:cinemax_movie_app/Core/Services/API/cinemax_api.dart';
import 'package:cinemax_movie_app/Features/MovieDetails/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../Constants/colors_const.dart';

class HomeMovieCard extends StatelessWidget {
  const HomeMovieCard({
    super.key,
    required this.movieModel,
  });
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
          context,
          settings: RouteSettings(
              name: MovieDetails.routeName, arguments: movieModel),
          screen: const MovieDetails(),
          withNavBar: true,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: SizedBox(
        width: 135,
        height: 231,
        child: Stack(
          children: [
            Container(
              width: 135,
              height: 231,
              decoration: ShapeDecoration(
                color: ConstColors.grayColor.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Container(
              width: 135,
              height: 178,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    '${API.imageBaseUrl}${movieModel.movieImageUrl}',
                  ),
                  fit: BoxFit.fill,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8,
              top: 190,
              child: SizedBox(
                width: 119,
                child: Text(
                  movieModel.movieName,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    color: ConstColors.whiteColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.12,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8,
              top: 211,
              child: Text(
                'Action',
                style: GoogleFonts.montserrat(
                  color: ConstColors.grayColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            Positioned(
              left: 72,
              top: 8,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: ShapeDecoration(
                      color: ConstColors.backgroundColor.withOpacity(0.7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: ConstColors.premiumColor,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${movieModel.movieRate}'.length > 3
                              ? '${movieModel.movieRate}'.substring(0, 3)
                              : '${movieModel.movieRate}',
                          style: GoogleFonts.montserrat(
                            color: ConstColors.premiumColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

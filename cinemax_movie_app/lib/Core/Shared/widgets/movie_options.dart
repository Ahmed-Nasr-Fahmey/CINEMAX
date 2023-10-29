import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Core/Models/MovieModel/movie_model.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/share_blur.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/trailer_button.dart';
import 'package:cinemax_movie_app/StateManagement/Cubits/UserCubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieOptions extends StatelessWidget {
  const MovieOptions({
    super.key,
    required this.onTap,
    required this.movieModel,
  });
  final void Function()? onTap;
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 115,
            height: 48,
            decoration: BoxDecoration(
                color: ConstColors.primaryColor,
                borderRadius: BorderRadius.circular(32)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    FontAwesomeIcons.play,
                    size: 14,
                    color: ConstColors.whiteColor,
                  ),
                ),
                Text(
                  "Trailer",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: ConstColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        TrailerButton(
          icon: Icons.file_download_outlined,
          backgroundColor: const Color(0xFF252836),
          iconColor: ConstColors.primaryColor,
          onTap: () {
            if (!movieModel.isDownloaded) {
              movieModel.isDownloaded = true;
              BlocProvider.of<UserCubit>(context)
                  .userModel
                  .downloadedMoviesList
                  .add(movieModel);
            }
          },
        ),
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return const ShareBlurAlert();
              },
            );
          },
          child: const TrailerButton(
            icon: Icons.share_outlined,
            backgroundColor: Color(0xFF252836),
            iconColor: ConstColors.primaryColor,
            onTap: null,
          ),
        ),
      ],
    );
  }
}

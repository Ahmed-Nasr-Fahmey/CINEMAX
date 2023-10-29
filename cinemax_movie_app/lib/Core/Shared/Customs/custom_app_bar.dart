import 'package:cinemax_movie_app/Core/Models/MovieModel/movie_model.dart';
import 'package:cinemax_movie_app/StateManagement/Cubits/UserCubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors_const.dart';
import '../../Constants/icon_const.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
    this.text,
    required this.hasLoveIcon,
    this.movieModel,
  });
  final String? text;
  final bool hasLoveIcon;
  final MovieModel? movieModel;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        widget.text == null ? '' : widget.text!,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.montserrat(
          color: ConstColors.whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.12,
        ),
      ),
      leading: Center(
        child: Container(
          width: 32,
          height: 32,
          decoration: ShapeDecoration(
            color: ConstColors.grayColor.withOpacity(0.05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            icon: ConstIcons.solidBakeIcon,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      actions: !widget.hasLoveIcon
          ? []
          : [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: ShapeDecoration(
                      color: ConstColors.grayColor.withOpacity(0.05),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: (widget.hasLoveIcon && widget.movieModel!.isLiked)
                          ? ConstIcons.solidLoveIcon
                          : ConstIcons.shieldLoveIcon,
                      onPressed: () {
                        if (widget.movieModel != null) {
                          setState(() {
                            widget.movieModel!.isLiked =
                                !widget.movieModel!.isLiked;
                          });
                          if (widget.movieModel!.isLiked) {
                            BlocProvider.of<UserCubit>(context)
                                .userModel
                                .likedMoviesList
                                .add(widget.movieModel!);
                          } else {
                            BlocProvider.of<UserCubit>(context)
                                .userModel
                                .likedMoviesList
                                .removeWhere(
                                  (movie) =>
                                      movie.movieID ==
                                      widget.movieModel!.movieID,
                                );
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
            ],
    );
  }
}

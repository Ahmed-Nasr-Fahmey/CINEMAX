import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Core/Models/MovieModel/movie_model.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_play_video.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomWishListCard extends StatefulWidget {
  const CustomWishListCard({
    super.key,
    required this.movieModel,
    required this.onPressed,
  });
  final MovieModel movieModel;
  final void Function()? onPressed;
  @override
  State<CustomWishListCard> createState() => _CustomWishListCardState();
}

class _CustomWishListCardState extends State<CustomWishListCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF252836).withOpacity(0.32)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CustomPlayVideo(imageUrl: widget.movieModel.movieImageUrl),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Action',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: ConstColors.grayColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      widget.movieModel.movieName,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: ConstColors.whiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Movie",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: ConstColors.grayColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8, right: 4),
                        child: Icon(
                          Icons.star_purple500_outlined,
                          color: Color(0xFFFF8700),
                          size: 20,
                        ),
                      ),
                      Text(
                        '${widget.movieModel.movieRate}'.length > 3
                            ? '${widget.movieModel.movieRate}'.substring(0, 3)
                            : '${widget.movieModel.movieRate}',
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: Color(0xFFFF8700),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.08,
                      ),
                      IconButton(
                        onPressed: widget.onPressed,
                        icon: const Icon(
                          Icons.delete,
                          size: 24,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Core/Models/MovieModel/movie_model.dart';
import 'package:cinemax_movie_app/Core/Services/API/cinemax_api.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieItem extends StatefulWidget {
  const MovieItem({
    Key? key,
    required this.movieModel,
  }) : super(key: key);
  final MovieModel movieModel;

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(
        '${API.youTubeVideoBaseUrl}${widget.movieModel.movieVideoKey}');
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: ConstColors.premiumColor,
        progressColors: const ProgressBarColors(
          backgroundColor: Colors.blueGrey,
          playedColor: Colors.red,
        ),
      ),
    );
  }
}

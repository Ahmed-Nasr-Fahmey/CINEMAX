class MovieModel {
  bool isLiked;
  bool isDownloaded;
  String? movieVideoKey;
  final String movieName;
  final String movieImageUrl;
  final dynamic movieRate;
  final dynamic movieID;
  final dynamic movieOverview;
  final dynamic movieDate;

  MovieModel({
    this.isLiked = false,
    this.isDownloaded = false,
    this.movieVideoKey,
    this.movieID,
    this.movieName = "",
    this.movieOverview = "",
    this.movieImageUrl = "",
    this.movieRate = 0.0,
    this.movieDate,
  });
}

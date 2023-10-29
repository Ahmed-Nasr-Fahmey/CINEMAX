import 'package:cinemax_movie_app/Core/Models/MovieModel/movie_model.dart';
import 'package:cinemax_movie_app/Core/Services/API/cinemax_api.dart';

class GetServices {
  static Future<List<MovieModel>> getTrendingMovies() async {
    List<dynamic> movies = await API.get(
        url:
            '${API.baseUrl}trending/movie/day?language=en-US&api_key=${API.apiKey}');
    List<MovieModel> moviesList = [];
    for (var movie in movies) {
      moviesList.add(MovieModel(
        movieID: movie["id"],
        movieName: movie["title"],
        movieOverview: movie["overview"],
        movieImageUrl: movie["poster_path"],
        movieRate: movie["vote_average"],
        movieDate: movie["release_date"],
      ));
    }
    return moviesList;
  }

  static Future<List<MovieModel>> getMostPopular() async {
    List<dynamic> movies = await API.get(
        url:
            '${API.baseUrl}discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&api_key=${API.apiKey}');
    List<MovieModel> moviesList = [];
    for (var movie in movies) {
      moviesList.add(MovieModel(
        movieID: movie["id"],
        movieName: movie["title"],
        movieOverview: movie["overview"],
        movieImageUrl: movie["poster_path"],
        movieRate: movie["vote_average"],
        movieDate: movie["release_date"],
      ));
    }
    return moviesList;
  }

  static Future<List<MovieModel>> getTopRated() async {
    List<dynamic> movies =
        await API.get(url: '${API.baseUrl}tv/top_rated?api_key=${API.apiKey}');
    List<MovieModel> moviesList = [];
    for (var movie in movies) {
      moviesList.add(MovieModel(
        movieID: movie["id"],
        movieName: movie["name"],
        movieOverview: movie["overview"],
        movieImageUrl: movie["poster_path"],
        movieRate: movie["vote_average"],
        movieDate: movie["first_air_date"],
      ));
    }
    return moviesList;
  }

  static Future<List<MovieModel>> getUpComing() async {
    List<dynamic> movies = await API.get(
        url:
            '${API.baseUrl}trending/movie/day?language=en-US&api_key=${API.apiKey}');
    List<MovieModel> moviesList = [];
    for (var movie in movies) {
      moviesList.add(MovieModel(
        movieID: movie["id"],
        movieName: movie["title"],
        movieOverview: movie["overview"],
        movieImageUrl: movie["poster_path"],
        movieRate: movie["vote_average"],
        movieDate: movie["release_date"],
      ));
    }
    return moviesList;
  }

  static Future<List<MovieModel>> getMoviesByName(
      {required String movieName}) async {
    List<dynamic> movies = await API.get(
        url:
            '${API.baseUrl}search/movie?api_key=${API.apiKey}&query=$movieName');
    List<MovieModel> moviesList = [];
    for (var movie in movies) {
      moviesList.add(MovieModel(
        movieID: movie["id"],
        movieName: movie["title"],
        movieOverview: movie["overview"],
        movieImageUrl: movie["poster_path"] ??
            '${API.imageBaseUrl}/azD31DjpV3PJfjF3h72LVw2WCSD.jpg',
        movieRate: movie["vote_average"],
        movieDate: movie["release_date"],
      ));
    }
    return moviesList;
  }

  static Future<List<MovieModel>> getMovieTrailers(
      {required String movieId}) async {
    List<dynamic> moviesTrailers = await API.get(
        url: '${API.baseUrl}movie/$movieId/videos?api_key=${API.apiKey}');
    List<MovieModel> moviesTrailersList = [];
    for (var movieTrail in moviesTrailers) {
      moviesTrailersList.add(MovieModel(
        movieVideoKey: movieTrail["key"],
        movieName: movieTrail["name"],
      ));
    }
    return moviesTrailersList;
  }
}

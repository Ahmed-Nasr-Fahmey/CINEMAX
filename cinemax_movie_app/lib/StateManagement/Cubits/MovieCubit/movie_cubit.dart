import 'package:cinemax_movie_app/Core/Models/MovieModel/movie_model.dart';
import 'package:cinemax_movie_app/Core/Services/API/GetServices/get_services.dart';
import 'package:cinemax_movie_app/StateManagement/Cubits/MovieCubit/movie_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitialState());
  List<MovieModel> trendingMoviesList = [];
  List<MovieModel> mostPopularMoviesList = [];
  List<MovieModel> topRatedMoviesList = [];
  List<MovieModel> upcomingMoviesList = [];
  List<MovieModel> videos = [];
  List<MovieModel> movieTrailersList = [];

  Future<void> getMovies() async {
    emit(MovieLoadingState());
    try {
      trendingMoviesList = await GetServices.getTrendingMovies();
      mostPopularMoviesList = await GetServices.getMostPopular();
      topRatedMoviesList = await GetServices.getTopRated();
      upcomingMoviesList = await GetServices.getUpComing();
      for (var movie in upcomingMoviesList) {
        List<MovieModel> tempVideos = await GetServices.getMovieTrailers(
            movieId: movie.movieID.toString());
        videos.add(tempVideos[0]);
      }
      emit(MovieSuccessState());
    } on Exception {
      emit(MovieFaluerState());
    }
  }

  Future<void> getMovieTrailers({required String movieID}) async {
    emit(MovieLoadingState());
    try {
      movieTrailersList = await GetServices.getMovieTrailers(movieId: movieID);
      emit(MovieSuccessState());
    } on Exception {
      MovieFaluerState();
    }
  }
}

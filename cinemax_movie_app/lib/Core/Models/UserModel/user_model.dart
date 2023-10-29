import 'package:cinemax_movie_app/Core/Models/MovieModel/movie_model.dart';
import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String? userName;
  @HiveField(1)
  String? userEmail;
  @HiveField(2)
  String? userPassword;
  @HiveField(3)
  String? userImageUrl;
  @HiveField(4)
  List<MovieModel> likedMoviesList;
  @HiveField(5)
  List<MovieModel> downloadedMoviesList;
  UserModel({
    this.userName,
    this.userEmail,
    this.userPassword,
    this.userImageUrl =
        'https://scontent.fcai22-1.fna.fbcdn.net/v/t39.30808-1/351356037_1121650665225980_8313024570362431221_n.jpg?stp=dst-jpg_p240x240&_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_ohc=DbvJRucsstkAX8JOzXT&_nc_ht=scontent.fcai22-1.fna&oh=00_AfBiG11wi5fDfAqLZadEKesdeRx_g1jEB1NXLv6MBqj26Q&oe=653EBB2C',
    required this.likedMoviesList,
    required this.downloadedMoviesList,
  });
}

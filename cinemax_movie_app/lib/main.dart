import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Features/MostPopular/most_popular_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Core/Routes/routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CINEMAXMovieApp());
}

class CINEMAXMovieApp extends StatelessWidget {
  const CINEMAXMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MostPopularView.routeName,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: ConstColors.backgroundColor,
      ),
    );
  }
}

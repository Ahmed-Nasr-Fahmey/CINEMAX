import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Features/OnBoarding/Splash/splash_view.dart';
import 'package:flutter/material.dart';

import 'Core/Routes/routes.dart';

void main() {
  runApp(const CINEMAXMovieApp());
}

class CINEMAXMovieApp extends StatelessWidget {
  const CINEMAXMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(scaffoldBackgroundColor: ConstColors.backgroundColor),
    );
  }
}

import 'package:cinemax_movie_app/Core/Constants/collection_const.dart';
import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Core/Models/UserModel/user_model.dart';
import 'package:cinemax_movie_app/Features/Onboarding/Splash/splash_view.dart';
import 'package:cinemax_movie_app/StateManagement/Cubits/MovieCubit/movie_cubit.dart';
import 'package:cinemax_movie_app/StateManagement/Cubits/UserCubit/user_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Core/Routes/routes.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>(ConstCollections.userBox);
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => MovieCubit(),
      ),
      BlocProvider(
        create: (context) => UserCubit(),
      ),
    ],
    child: const CINEMAXMovieApp(),
  ));
}

class CINEMAXMovieApp extends StatefulWidget {
  const CINEMAXMovieApp({super.key});

  @override
  State<CINEMAXMovieApp> createState() => _CINEMAXMovieAppState();
}

class _CINEMAXMovieAppState extends State<CINEMAXMovieApp> {
  @override
  void initState() {
    BlocProvider.of<MovieCubit>(context).getMovies();
    BlocProvider.of<UserCubit>(context).getUserModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserCubit>(context).getUserModel();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: ConstColors.backgroundColor,
      ),
    );
  }

  @override
  void dispose() {
    BlocProvider.of<UserCubit>(context).storeUserModel();
    FirebaseAuth.instance.signOut();
    super.dispose();
  }
}

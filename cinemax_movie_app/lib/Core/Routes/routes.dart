import 'package:cinemax_movie_app/Features/Home/home_view.dart';
import 'package:cinemax_movie_app/Features/MovieDetails/movie_details.dart';
import 'package:cinemax_movie_app/Features/OnBoarding/Splash/splash_view.dart';
import 'package:cinemax_movie_app/Features/Onboarding/CreateNewPassword/create_new_password_view.dart';
import 'package:cinemax_movie_app/Features/Onboarding/LogIn/login_view.dart';
import 'package:cinemax_movie_app/Features/Onboarding/LoginSignUp/login_signup_view.dart';
import 'package:cinemax_movie_app/Features/Onboarding/OnboardingView1/onboarding_view_1.dart';
import 'package:cinemax_movie_app/Features/Onboarding/OnboardingView2/onboarding_view_2.dart';
import 'package:cinemax_movie_app/Features/Onboarding/OnboardingView3/onboarding_view_3.dart';
import 'package:cinemax_movie_app/Features/Onboarding/SignUp/sign_up_view.dart';
import 'package:cinemax_movie_app/Features/Onboarding/Verification/verification_view.dart';
import 'package:cinemax_movie_app/Features/PaymentMethod/payment_method.dart';
import 'package:cinemax_movie_app/Features/Profile/EditProfile/edit_profile.dart';
import 'package:cinemax_movie_app/Features/Profile/Notification/notifactions.dart';
import 'package:cinemax_movie_app/Features/Profile/Privacy/privacy_policy.dart';
import 'package:cinemax_movie_app/Features/UpComingMovies/upcoming_movies.dart';
import 'package:cinemax_movie_app/Features/WishList/wish_list.dart';
import 'package:flutter/material.dart';

import '../../Features/OnBoarding/ResetPassword/reset_password_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings);
      case OnboardingView1.routeName:
        return MaterialPageRoute(
            builder: (context) => const OnboardingView1(), settings: settings);
      case OnboardingView2.routeName:
        return MaterialPageRoute(
            builder: (context) => const OnboardingView2(), settings: settings);
      case OnboardingView3.routeName:
        return MaterialPageRoute(
            builder: (context) => const OnboardingView3(), settings: settings);
      case LoginSignUpView.routeName:
        return MaterialPageRoute(
            builder: (context) => const LoginSignUpView(), settings: settings);
      case LogInView.routeName:
        return MaterialPageRoute(
            builder: (context) => const LogInView(), settings: settings);
      case SignUpView.routeName:
        return MaterialPageRoute(
            builder: (context) => const SignUpView(), settings: settings);
      case ResetPasswordView.routeName:
        return MaterialPageRoute(
            builder: (context) => const ResetPasswordView(),
            settings: settings);
      case VerificationView.routeName:
        return MaterialPageRoute(
            builder: (context) => const VerificationView(), settings: settings);
      case CreateNewPasswordView.routeName:
        return MaterialPageRoute(
            builder: (context) => const CreateNewPasswordView(),
            settings: settings);
      case HomeView.routeName:
        return MaterialPageRoute(
            builder: (context) => const HomeView(), settings: settings);
      case PrivacyPolicy.routeName:
        return MaterialPageRoute(
            builder: (context) => const PrivacyPolicy(), settings: settings);
      case EditProfile.routeName:
        return MaterialPageRoute(
            builder: (context) => const EditProfile(), settings: settings);

      case PaymentMethod.routeName:
        return MaterialPageRoute(
            builder: (context) => const PaymentMethod(), settings: settings);
      case MovieDetails.routeName:
        return MaterialPageRoute(
            builder: (context) => const MovieDetails(), settings: settings);
case UpcomingMovies.routeName:
        return MaterialPageRoute(
            builder: (context) => const UpcomingMovies(), settings: settings);
      case Notifactions.routeName:
        return MaterialPageRoute(
            builder: (context) => const Notifactions(), settings: settings);
      case WishList.routeName:
        return MaterialPageRoute(
            builder: (context) => const WishList(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings);
    }
  }
}

import 'package:cinemax_movie_app/Core/Constants/collection_const.dart';
import 'package:cinemax_movie_app/Core/Helper/show_snack_bar.dart';
import 'package:cinemax_movie_app/Core/Models/UserModel/user_model.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/bottom_navigation_bar.dart';
import 'package:cinemax_movie_app/Features/Profile/ProfileView/profile_view.dart';
import 'package:cinemax_movie_app/StateManagement/Cubits/UserCubit/user_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());
  UserModel userModel = UserModel(
    downloadedMoviesList: [],
    likedMoviesList: [],
  );
  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    emit(UserLoadingState());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userModel.userEmail!,
        password: userModel.userPassword!,
      );

      // ignore: use_build_context_synchronously
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings:
            const RouteSettings(name: CustomBottomNavigationBar.routeName),
        screen: const CustomBottomNavigationBar(),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
      emit(UserSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'Wrong password provided for that user.');
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, 'ther was an erorr');
    }
    emit(UserFaluerState());
  }

  Future<void> createUserWithEmailAndPassword(BuildContext context) async {
    emit(UserLoadingState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.userEmail!,
        password: userModel.userPassword!,
      );

      // ignore: use_build_context_synchronously
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings:
            const RouteSettings(name: CustomBottomNavigationBar.routeName),
        screen: const CustomBottomNavigationBar(),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
      emit(UserSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'The account already exists for that email.');
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, 'ther was an erorr');
    }
    emit(UserFaluerState());
  }

  Future<void> updateUserProfile({
    required BuildContext context,
    required String? userEmail,
    required String? userPassword,
  }) async {
    if (userEmail != null) {
      try {
        await FirebaseAuth.instance.currentUser?.updateEmail(userEmail);
      } on Exception catch (e) {
        debugPrint(e.toString());
      }
      // ignore: use_build_context_synchronously
      BlocProvider.of<UserCubit>(context).userModel.userEmail = userEmail;
    }
    if (userPassword != null) {
      try {
        await FirebaseAuth.instance.currentUser?.updatePassword(userPassword);
      } on Exception catch (e) {
        debugPrint(e.toString());
      }
      // ignore: use_build_context_synchronously
      BlocProvider.of<UserCubit>(context).userModel.userPassword = userPassword;
    }
    // ignore: use_build_context_synchronously
    showSnackBar(context, 'Your account updated successfully');
    // ignore: use_build_context_synchronously
    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
      context,
      settings: const RouteSettings(name: ProfileView.routeName),
      screen: const ProfileView(),
      withNavBar: true,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  Future<void> storeUserModel() async {
    await Hive.box<UserModel>(ConstCollections.userBox).add(userModel);
  }

  void getUserModel() {
    if (Hive.box<UserModel>(ConstCollections.userBox).values.toList().isEmpty) {
      userModel = UserModel(likedMoviesList: [], downloadedMoviesList: []);
    } else {
      userModel =
          Hive.box<UserModel>(ConstCollections.userBox).values.toList()[0];
    }
  }
}

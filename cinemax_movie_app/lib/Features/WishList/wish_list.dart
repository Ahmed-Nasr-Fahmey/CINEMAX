import 'package:cinemax_movie_app/Core/Shared/Builders/custom_wish_list_card_builder.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_app_bar.dart';
import 'package:cinemax_movie_app/Features/Downloads/empty_downloads.dart';
import 'package:cinemax_movie_app/StateManagement/Cubits/UserCubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});
  static const String routeName = "WishList";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          BlocProvider.of<UserCubit>(context).userModel.likedMoviesList.isEmpty
              ? const PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: CustomAppBar(
                      text: "Wishlist",
                      hasLoveIcon: false,
                    ),
                  ),
                )
              : null,
      body: BlocProvider.of<UserCubit>(context)
              .userModel
              .likedMoviesList
              .isNotEmpty
          ? const SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: CustomAppBar(
                      text: "Wishlist",
                      hasLoveIcon: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: CustomWishListCardBuilder(),
                  ),
                ],
              ),
            )
          : const EmptyDownloadList(),
    );
  }
}

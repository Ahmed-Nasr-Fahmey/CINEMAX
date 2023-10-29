import 'package:cinemax_movie_app/Core/Shared/Customs/custom_app_bar.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_downloads_card_builder.dart';
import 'package:cinemax_movie_app/Features/Downloads/empty_downloads.dart';
import 'package:cinemax_movie_app/StateManagement/Cubits/UserCubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadsView extends StatelessWidget {
  const DownloadsView({super.key});
  static const String routeName = 'DownloadsView';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:
          BlocProvider.of<UserCubit>(context).userModel.downloadedMoviesList.isEmpty
              ? const PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: CustomAppBar(
                      text: "Downloads",
                      hasLoveIcon: false,
                    ),
                  ),
                )
              : null,
      body:BlocProvider.of<UserCubit>(context)
              .userModel
              .downloadedMoviesList
              .isNotEmpty
          ?  const SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              hasLoveIcon: false,
              text: 'Downloads',
            ),
            CustomDownloadsCardBuilder(),
          ],
        ),
      ):const EmptyDownloadList(),
    );
  }
}

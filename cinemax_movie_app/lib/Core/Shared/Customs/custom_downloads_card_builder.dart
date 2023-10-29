
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_wish_list_card.dart';
import 'package:cinemax_movie_app/StateManagement/Cubits/UserCubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDownloadsCardBuilder extends StatefulWidget {
  const CustomDownloadsCardBuilder({
    super.key,
  });

  @override
  State<CustomDownloadsCardBuilder> createState() => _CustomDownloadsCardBuilderState();
}

class _CustomDownloadsCardBuilderState extends State<CustomDownloadsCardBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 160,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: BlocProvider.of<UserCubit>(context)
      .userModel
      .downloadedMoviesList
      .length,
        itemBuilder: (context, index) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
        left: 16,
        right: 16,
      ),
      child: CustomWishListCard(
        movieModel: BlocProvider.of<UserCubit>(context)
            .userModel
            .downloadedMoviesList[index],
        onPressed: () {
          BlocProvider.of<UserCubit>(context)
              .userModel
              .downloadedMoviesList
              .removeWhere(
                (movie) =>
                    movie.movieID ==
                    BlocProvider.of<UserCubit>(context)
                        .userModel
                        .downloadedMoviesList[index]
                        .movieID,
              );
          setState(() {});
        },
      ),
    );
        },
      ),
    );
  }
}

import 'package:cinemax_movie_app/Core/Shared/Customs/custom_app_bar.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_wish_list_card.dart';
import 'package:flutter/material.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});
  static const String routeName = "WishList";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CustomAppBar(
              text: "Wishlist",
              hasLoveIcon: false,
            ),
          ),
          CustomWishListCard(
            image: 'Assets/images/wishListMovie.png',
            name: "Spider-Man",
            rate: "4.5",
            category: "Action",
          ),
        ],
      ),
    );
  }
}

import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Features/Home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GNav(
          color: ConstColors.grayColor,
          activeColor: ConstColors.primaryColor,
          gap: 6,
          backgroundColor: ConstColors.backgroundColor,
          tabBackgroundColor: const Color(0xFF252836),
          padding: const EdgeInsets.all(16),
          tabBorderRadius: 16,
          textSize: 10,
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
              onPressed: () {
                Navigator.pushNamed(context, HomeView.routeName);
              },
            ),
            const GButton(
              icon: Icons.search,
              text: "Search",
            ),
            const GButton(
              icon: Icons.file_download_outlined,
              text: "Downloads",
            ),
            const GButton(
              icon: Icons.person,
              text: "Profile",
            )
          ]),
    );
  }
}

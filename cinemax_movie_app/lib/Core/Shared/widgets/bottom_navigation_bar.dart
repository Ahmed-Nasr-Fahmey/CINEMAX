// import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
// import 'package:cinemax_movie_app/Features/Downloads/downloads_view.dart';
// import 'package:cinemax_movie_app/Features/Home/home_view.dart';
// import 'package:cinemax_movie_app/Features/Profile/ProfileView/profile_view.dart';
// import 'package:cinemax_movie_app/Features/Search/SearchView/search_view.dart';
// import 'package:cinemax_movie_app/Features/WishList/wish_list.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// class CustomBottomNavigationBar extends StatefulWidget {
//   const CustomBottomNavigationBar({super.key});
//   static const routeName = 'CustomBottomNavigationBar';
//   @override
//   State<CustomBottomNavigationBar> createState() =>
//       _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   int _selectedIndex = 0;

//   static const List<Widget> _widgetOptions = <Widget>[
//     HomeView(),
//     SearchView(),
//     DownloadsView(),
//     WishListView(),
//     ProfileView(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _widgetOptions.elementAt(_selectedIndex),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(8),
//         child: GNav(
//           color: ConstColors.grayColor,
//           activeColor: ConstColors.primaryColor,
//           gap: 1,
//           backgroundColor: ConstColors.backgroundColor,
//           tabBackgroundColor: const Color(0xFF252836),
//           padding: const EdgeInsets.all(16),
//           tabBorderRadius: 16,
//           tabs: const [
//             GButton(
//               icon: Icons.home,
//               text: "Home",
//             ),
//             GButton(
//               icon: Icons.search,
//               text: "Search",
//             ),
//             GButton(
//               icon: Icons.file_download_outlined,
//               text: "Downloads",
//             ),
//             GButton(
//               icon: Icons.favorite,
//               text: "Liked",
//             ),
//             GButton(
//               icon: Icons.person,
//               text: "Profile",
//             ),
//           ],
//           selectedIndex: _selectedIndex,
//           onTabChange: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Features/Downloads/downloads_view.dart';
import 'package:cinemax_movie_app/Features/Home/home_view.dart';
import 'package:cinemax_movie_app/Features/Profile/ProfileView/profile_view.dart';
import 'package:cinemax_movie_app/Features/Search/SearchView/search_view.dart';
import 'package:cinemax_movie_app/Features/WishList/wish_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});
  static const routeName = 'CustomBottomNavigationBar';
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  PersistentTabController? _controller;

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const SearchView(),
      const DownloadsView(),
      const WishListView(),
      const ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: ConstColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: "Search",
        activeColorPrimary: ConstColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.file_download_outlined),
        title: "Downloads",
        activeColorPrimary: ConstColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: "Liked",
        activeColorPrimary: ConstColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "Profile",
        activeColorPrimary: ConstColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,

      padding: const NavBarPadding.all(0),
      navBarHeight: 60,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: ConstColors.backgroundColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        colorBehindNavBar: Colors.transparent,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }
}

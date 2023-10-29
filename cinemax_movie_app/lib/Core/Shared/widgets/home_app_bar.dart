import 'package:cinemax_movie_app/Features/WishList/wish_list.dart';
import 'package:cinemax_movie_app/StateManagement/Cubits/UserCubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../Constants/colors_const.dart';
import '../../Constants/icon_const.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 24, right: 24, bottom: 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              BlocProvider.of<UserCubit>(context).userModel.userImageUrl!,
              scale: 34,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Ahmed',
                style: GoogleFonts.montserrat(
                  color: ConstColors.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Let’s stream your favorite movie',
                style: GoogleFonts.montserrat(
                  color: ConstColors.grayColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const Spacer(),
          Container(
            width: 32,
            height: 32,
            decoration: ShapeDecoration(
              color: ConstColors.grayColor.withOpacity(0.05),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: ConstIcons.solidLoveIcon,
              onPressed: () {
                PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  settings: const RouteSettings(name: WishListView.routeName),
                  screen: const WishListView(),
                  withNavBar: true,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

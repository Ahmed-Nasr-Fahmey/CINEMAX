import 'package:cinemax_movie_app/Features/Profile/EditProfile/edit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../Constants/colors_const.dart';
import '../../Constants/icon_const.dart';

class ProfileWithEditProfileCard extends StatelessWidget {
  const ProfileWithEditProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width - 2 * 24,
      decoration: BoxDecoration(
        border: Border.all(
          color: ConstColors.grayColor.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: CircleAvatar(
              radius: 27,
              backgroundImage: NetworkImage(
                  'https://scontent.fcai22-1.fna.fbcdn.net/v/t39.30808-1/351356037_1121650665225980_8313024570362431221_n.jpg?stp=dst-jpg_p240x240&_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_ohc=DbvJRucsstkAX8JOzXT&_nc_ht=scontent.fcai22-1.fna&oh=00_AfBiG11wi5fDfAqLZadEKesdeRx_g1jEB1NXLv6MBqj26Q&oe=653EBB2C'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahmed Nasr',
                style: GoogleFonts.montserrat(
                  color: ConstColors.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.12,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.52,
                child: Text(
                  '${FirebaseAuth.instance.currentUser?.email}',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    color: ConstColors.grayColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.28,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () async {
              PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                context,
                settings: const RouteSettings(name: EditProfileView.routeName),
                screen: const EditProfileView(),
                withNavBar: true,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            icon: ConstIcons.editIcon,
          ),
        ],
      ),
    );
  }
}

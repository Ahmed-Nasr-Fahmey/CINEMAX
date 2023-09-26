import 'package:cinemax_movie_app/Features/Profile/EditProfile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  'https://scontent.fcai22-1.fna.fbcdn.net/v/t39.30808-6/351356037_1121650665225980_8313024570362431221_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=a2f6c7&_nc_ohc=I5qlFaGkM7wAX9rOc-u&_nc_ht=scontent.fcai22-1.fna&oh=00_AfAfCtWwymprX0jnASWuU7iCMwDrFZ5PYjwYaXW2q25ckQ&oe=65170EAA'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tiffany',
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
              Text(
                'Tiffanyjearsey@gmail.com',
                style: GoogleFonts.montserrat(
                  color: ConstColors.grayColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.28,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, EditProfileView.routeName);
              },
              icon: ConstIcons.editIcon),
        ],
      ),
    );
  }
}

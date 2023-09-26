import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors_const.dart';
import '../../Constants/icon_const.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });
  final Widget icon;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            width: 32,
            height: 32,
            decoration: ShapeDecoration(
              color: ConstColors.grayColor.withOpacity(0.05),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Center(child: icon),
          ),
          Text(
            text,
            style: GoogleFonts.montserrat(
              color: ConstColors.whiteColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.12,
            ),
          ),
          const Spacer(),
          IconButton(onPressed: onPressed, icon: ConstIcons.arrowIcon)
        ],
      ),
    );
  }
}

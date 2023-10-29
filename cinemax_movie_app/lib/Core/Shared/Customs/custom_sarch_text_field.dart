import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors_const.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.onChanged,
  });
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        onChanged: onChanged,
        style: GoogleFonts.montserrat(
          color: ConstColors.grayColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.12,
        ),
        cursorColor: ConstColors.grayColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: ConstColors.grayColor.withOpacity(0.05),
          hintText: 'Search a title..',
          hintStyle: GoogleFonts.montserrat(
            color: ConstColors.grayColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.12,
          ),
          prefixIcon: const Icon(Icons.search, color: ConstColors.grayColor),
          suffixIcon: const Icon(
            Icons.filter_list,
            color: ConstColors.whiteColor,
          ),
          contentPadding: const EdgeInsets.all(0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

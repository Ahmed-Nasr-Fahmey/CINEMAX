
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors_const.dart';
import '../Customs/custom_divider.dart';
import 'language_options.dart';

class SuggestedLanguages extends StatelessWidget {
  const SuggestedLanguages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 2 * 24,
      decoration: BoxDecoration(
        border: Border.all(
          color: ConstColors.grayColor.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Suggested Languages',
                style: GoogleFonts.montserrat(
                  color: ConstColors.grayColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.12,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const LanguageOptions(
              text: 'English (UK)',
            ),
            const CustomDivider(),
            const LanguageOptions(
              text: 'Arabic',
            ),
            const CustomDivider(),
            const LanguageOptions(
              text: 'Spanish',
            ),
          ],
        ),
      ),
    );
  }
}

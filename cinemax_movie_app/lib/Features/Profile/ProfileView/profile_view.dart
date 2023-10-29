import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Core/Constants/icon_const.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_app_bar.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_secound_button.dart';
import 'package:cinemax_movie_app/Core/Shared/Functions/functions.dart';
import 'package:cinemax_movie_app/Features/Profile/LanguageView/language_view.dart';
import 'package:cinemax_movie_app/Features/Profile/Notification/notifactions.dart';
import 'package:cinemax_movie_app/Features/Profile/Privacy/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../Core/Shared/Customs/custom_divider.dart';
import '../../../Core/Shared/widgets/profile_alert_dialog.dart';
import '../../../Core/Shared/widgets/profile_options.dart';
import '../../../Core/Shared/widgets/profile_with_edit_profile_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routeName = 'ProfileView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => GlobalFunctions.unFocusTextFieldsWhenClickOutSide(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(
                hasLoveIcon: false,
                text: 'Profile',
              ),
              const ProfileWithEditProfileCard(),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 2 * 24,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ConstColors.grayColor.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    ProfileOptions(
                      icon: ConstIcons.notificationIcon,
                      text: 'Notifications',
                      onPressed: () {
                        PersistentNavBarNavigator
                            .pushNewScreenWithRouteSettings(
                          context,
                          settings:
                              const RouteSettings(name: Notifactions.routeName),
                          screen: const Notifactions(),
                          withNavBar: true,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                    ),
                    const CustomDivider(),
                    ProfileOptions(
                      icon: ConstIcons.languageIcon,
                      text: 'Language',
                      onPressed: () {
                        PersistentNavBarNavigator
                            .pushNewScreenWithRouteSettings(
                          context,
                          settings:
                              const RouteSettings(name: LanguageView.routeName),
                          screen: const LanguageView(),
                          withNavBar: true,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                    ),
                    const CustomDivider(),
                    ProfileOptions(
                      icon: ConstIcons.securityIcon,
                      text: 'Legal and Policies',
                      onPressed: () {
                        PersistentNavBarNavigator
                            .pushNewScreenWithRouteSettings(
                          context,
                          settings: const RouteSettings(
                              name: PrivacyPolicy.routeName),
                          screen: const PrivacyPolicy(),
                          withNavBar: true,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                    ),
                    const CustomDivider(),
                    ProfileOptions(
                      icon: ConstIcons.questionIcon,
                      text: 'Help & Feedback',
                      onPressed: () {},
                    ),
                    const CustomDivider(),
                    ProfileOptions(
                      icon: ConstIcons.infoIcon,
                      text: 'About Us',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomSecoundButton(
                text: 'Log Out',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ProfileAlertDialog();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

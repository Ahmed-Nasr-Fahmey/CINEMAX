import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Core/Constants/icon_const.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_app_bar.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_main_button.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_text_form_field.dart';
import 'package:cinemax_movie_app/Core/Shared/Functions/functions.dart';
import 'package:cinemax_movie_app/Core/Shared/Validation/validation.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/bottom_navigation_bar.dart';
import 'package:cinemax_movie_app/Features/Onboarding/Verification/verification_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  static const String routeName = "EditProfile";
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GlobalFunctions.unFocusTextFieldsWhenClickOutSide(context),
      child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: EditProfile._formKey,
              autovalidateMode: autovalidateMode,
              child: Column(children: [
                const CustomAppBar(text: "Edit Profile", hasLoveIcon: false),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          "Assets/images/EditProfile.png",
                          width: 100,
                          height: 100,
                        ),
                        Positioned(
                          right: 10,
                          bottom: 10,
                          child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF252836),
                                  borderRadius: BorderRadius.circular(360))),
                        ),
                        const Positioned(
                            bottom: 20,
                            right: 20,
                            child: Icon(
                              Icons.edit,
                              size: 12,
                              color: ConstColors.primaryColor,
                            ))
                      ],
                    ),
                    Text(
                      "Tiffany",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: ConstColors.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Tiffanyjearsey@gmail.com",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Color(0xFFB1B1B1),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: CustomTextFormField(
                        suffixIcon: null,
                        validator: null,
                        obscureText: false,
                        isPassword: false,
                        lable: 'Full Name',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: CustomTextFormField(
                        suffixIcon: null,
                        validator: (value) {
                          return Validation.emailValidation(value);
                        },
                        obscureText: false,
                        isPassword: false,
                        lable: 'Email Address',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: CustomTextFormField(
                        suffixIcon: ConstIcons.solidEyeSlashIcon,
                        validator: (value) {
                          return Validation.passwordValidation(value);
                        },
                        obscureText: true,
                        isPassword: true,
                        lable: 'Password',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: CustomTextFormField(
                        suffixIcon: null,
                        validator: null,
                        obscureText: false,
                        isPassword: false,
                        lable: 'Phone Number',
                      ),
                    ),
                    CustomMainButton(
                      text: 'Next',
                      onTap: () {
                        if (EditProfile._formKey.currentState!.validate()) {
                          Navigator.pushNamed(
                              context, VerificationView.routeName);
                        } else {
                          setState(
                            () {
                              autovalidateMode = AutovalidateMode.always;
                            },
                          );
                        }
                      },
                    )
                  ],
                )
              ]),
            ),
          ),
          bottomNavigationBar: const CustomBottomNavigationBar()),
    );
  }
}

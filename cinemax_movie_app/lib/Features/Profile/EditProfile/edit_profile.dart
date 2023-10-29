import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Core/Constants/icon_const.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_app_bar.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_main_button.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_text_form_field.dart';
import 'package:cinemax_movie_app/Core/Shared/Functions/functions.dart';
import 'package:cinemax_movie_app/Core/Shared/Validation/validation.dart';
import 'package:cinemax_movie_app/StateManagement/Cubits/UserCubit/user_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});
  static const String routeName = "EditProfileView";
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? userEmail;
  String? userPassword;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GlobalFunctions.unFocusTextFieldsWhenClickOutSide(context),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: EditProfileView._formKey,
            autovalidateMode: autovalidateMode,
            child: Column(children: [
              const CustomAppBar(text: "Edit Profile", hasLoveIcon: false),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(
                          'https://scontent.fcai22-1.fna.fbcdn.net/v/t39.30808-1/351356037_1121650665225980_8313024570362431221_n.jpg?stp=dst-jpg_p240x240&_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_ohc=DbvJRucsstkAX8JOzXT&_nc_ht=scontent.fcai22-1.fna&oh=00_AfBiG11wi5fDfAqLZadEKesdeRx_g1jEB1NXLv6MBqj26Q&oe=653EBB2C',
                        ),
                      ),
                      Positioned(
                        right: 2,
                        bottom: 2,
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: const Color(0xFF252836),
                                borderRadius: BorderRadius.circular(360))),
                      ),
                      const Positioned(
                          bottom: 10,
                          right: 10,
                          child: Icon(
                            Icons.edit,
                            size: 24,
                            color: ConstColors.primaryColor,
                          ))
                    ],
                  ),
                  Text(
                    "Ahmed Nasr",
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
                    "${FirebaseAuth.instance.currentUser!.email}",
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
                      onChanged: (value) {
                        userEmail = value;
                      },
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
                      onChanged: (value) {
                        userPassword = value;
                      },
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
                    onTap: () async {
                      if (EditProfileView._formKey.currentState!.validate()) {
                        await BlocProvider.of<UserCubit>(context)
                            .updateUserProfile(
                          context: context,
                          userEmail: userEmail,
                          userPassword: userPassword,
                        );
                        setState(() {});
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
      ),
    );
  }
}

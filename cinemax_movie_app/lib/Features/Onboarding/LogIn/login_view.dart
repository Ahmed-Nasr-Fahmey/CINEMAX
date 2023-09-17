import 'package:cinemax_movie_app/Core/Constants/colors_const.dart';
import 'package:cinemax_movie_app/Core/Constants/icon_const.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_app_bar.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_main_button.dart';
import 'package:cinemax_movie_app/Core/Shared/Customs/custom_text_form_field.dart';
import 'package:cinemax_movie_app/Core/Shared/Functions/functions.dart';
import 'package:cinemax_movie_app/Core/Shared/Validation/validation.dart';
import 'package:cinemax_movie_app/Features/Home/home_view.dart';
import 'package:cinemax_movie_app/Features/Onboarding/ResetPassword/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});
  static const String routeName = "LogInView";
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GlobalFunctions.unFocusTextFieldsWhenClickOutSide(context),
      child: Scaffold(
          body: SingleChildScrollView(
        child: Form(
          key: LogInView._formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const CustomAppBar(hasLoveIcon: false, text: 'Login'),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 8),
                child: Text(
                  "Hi, Tiffany",
                  style: GoogleFonts.montserrat(
                      color: ConstColors.whiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                "Welcome back! Please enter ",
                style: GoogleFonts.montserrat(
                    color: ConstColors.grayColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "your details.",
                style: GoogleFonts.montserrat(
                    color: ConstColors.grayColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 72, left: 24, right: 24, bottom: 32),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 24, bottom: 40, right: 24),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ResetPasswordView.routeName);
                        },
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.montserrat(
                              color: ConstColors.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ],
              ),
              CustomMainButton(
                text: "Login",
                onTap: () {
                  if (LogInView._formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, HomeView.routeName);
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
          ),
        ),
      )),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/color_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/image_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/size_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/string_config.dart';
import 'package:prime_ai_flutter_ui_kit/controller/sign_in_controller.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';

import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  SignInController signInController = Get.put(SignInController());

  void _togglePasswordVisibility() {
    setState(() {
      signInController.obscureText = !signInController.obscureText;
    });
  }

  @override
  void dispose() {
    signInController.emailController.dispose();
    signInController.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundWhiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SizeConfig.padding20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: SizeConfig.height95,
              ),
              const Text(
                StringConfig.signInWithAccount,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: FontFamilyConfig.outfitSemiBold,
                  fontSize: FontSizeConfig.heading1Text,
                  color: ColorConfig.textColor,
                ),
              ),
              const SizedBox(
                height: SizeConfig.height12,
              ),
              const Text(
                StringConfig.signInWithDescription,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamilyConfig.outfitRegular,
                  fontSize: FontSizeConfig.heading4Text,
                  color: ColorConfig.textMediumColor,
                ),
              ),
              const SizedBox(
                height: SizeConfig.height40,
              ),
              Form(
                key: signInController.formKey,
                child: Column(
                  children: [
                    Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          signInController.isFocusedTextField1 = hasFocus;
                        });
                      },
                      child: SizedBox(
                        height: SizeConfig.height52,
                        child: TextFormField(
                          controller: signInController.emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontSize: FontSizeConfig.heading4Text,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamilyConfig.outfitMedium,
                            color: ColorConfig.textColor,
                          ),
                          onChanged: (value) {
                            setState(() {
                              signInController.isEmail = signInController.emailController.text.isNotEmpty;
                              signInController.showError = false;
                            });
                          },
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            isDense: true,
                            hintText: StringConfig.enterEmail,
                            hintStyle: const TextStyle(
                              fontSize: FontSizeConfig.heading4Text,
                              fontWeight: FontWeight.w300,
                              fontFamily: FontFamilyConfig.outfitLight,
                              color: ColorConfig.textLightColor,
                            ),
                            labelText: signInController.isFocusedTextField1 || signInController.emailController.text.isNotEmpty ? StringConfig.email : null,
                            labelStyle: const TextStyle(
                              fontSize: FontSizeConfig.heading4Text,
                              fontWeight: FontWeight.w300,
                              fontFamily: FontFamilyConfig.outfitLight,
                              color: ColorConfig.textColor,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorConfig.textFieldBorderColor.withOpacity(.3),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: signInController.showError ? Colors.red : ColorConfig.textFieldBorderColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: signInController.showError ? Colors.red : ColorConfig.primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: signInController.showError,
                      child: const Padding(
                        padding: EdgeInsets.only(top: SizeConfig.padding08, left: SizeConfig.padding08),
                        child: Row(
                          children: [
                            Icon(
                              Icons.error,
                              size: 13,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 05,
                            ),
                            Text(
                              StringConfig.emailRequired,
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: FontFamilyConfig.outfitRegular,
                                fontSize: FontSizeConfig.body2Text,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: SizeConfig.height16,
                    ),
                    Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          signInController.isFocusedTextField2 = hasFocus;
                        });
                      },
                      child: SizedBox(
                        height: SizeConfig.height52,
                        child: TextFormField(
                          controller: signInController.passwordController,
                          obscureText: signInController.obscureText,
                          style: const TextStyle(
                            fontSize: FontSizeConfig.heading4Text,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamilyConfig.outfitMedium,
                            color: ColorConfig.textColor,
                          ),
                          onChanged: (value) {
                            setState(() {
                              signInController.isPassword = signInController.passwordController.text.isNotEmpty;
                              signInController.showError2 = false;
                            });
                          },
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            isDense: true,
                            hintText: StringConfig.enterPassword,
                            hintStyle: const TextStyle(
                              fontSize: FontSizeConfig.heading4Text,
                              fontWeight: FontWeight.w300,
                              fontFamily: FontFamilyConfig.outfitLight,
                              color: ColorConfig.textLightColor,
                            ),
                            labelText: signInController.isFocusedTextField2 || signInController.passwordController.text.isNotEmpty ? StringConfig.password : null,
                            labelStyle: const TextStyle(
                              fontSize: FontSizeConfig.heading4Text,
                              fontWeight: FontWeight.w300,
                              fontFamily: FontFamilyConfig.outfitLight,
                              color: ColorConfig.textColor,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorConfig.textFieldBorderColor.withOpacity(.3),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: signInController.showError2 ? Colors.red : ColorConfig.textFieldBorderColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: signInController.showError2 ? Colors.red : ColorConfig.primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(SizeConfig.padding15),
                              child: GestureDetector(
                                onTap: _togglePasswordVisibility,
                                child: Image(
                                  image: AssetImage(signInController.obscureText ? ImageConfig.passwordVisible : ImageConfig.passwordShow),
                                  width: SizeConfig.width18,
                                  color: signInController.isFocusedTextField2 ? ColorConfig.primaryColor : ColorConfig.textColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: signInController.showError2,
                      child: const Padding(
                        padding: EdgeInsets.only(top: SizeConfig.padding08, left: SizeConfig.padding08),
                        child: Row(
                          children: [
                            Icon(
                              Icons.error,
                              size: 13,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 05,
                            ),
                            Text(
                              StringConfig.passwordRequired,
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: FontFamilyConfig.outfitRegular,
                                fontSize: FontSizeConfig.body2Text,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: SizeConfig.height15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: signInController.rememberMe ?? false,
                    onChanged: (bool? newValue) {
                      setState(() {
                        signInController.rememberMe = newValue;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(06),
                    ),
                    activeColor: ColorConfig.primaryColor,
                    checkColor: ColorConfig.backgroundColor,
                    side: const BorderSide(
                      color: ColorConfig.primaryColor,
                      width: 1,
                    ),
                  ),
                  const Text(
                    StringConfig.rememberMe,
                    style: TextStyle(
                      fontFamily: FontFamilyConfig.outfitRegular,
                      fontSize: FontSizeConfig.body1Text,
                      fontWeight: FontWeight.w400,
                      color: ColorConfig.textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: SizeConfig.height15,
              ),
              SizedBox(
                height: SizeConfig.height52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      signInController.showError = !signInController.isEmail || signInController.emailController.text.isEmpty;
                      signInController.showError2 = !signInController.isPassword || signInController.passwordController.text.isEmpty;
                    });
                    if (signInController.formKey.currentState!.validate() && !signInController.showError && !signInController.showError2) {
                      if (signInController.emailController.text.isNotEmpty) {
                        if(signInController.passwordController.text.isNotEmpty) {
                          Get.toNamed(AppRoutes.bottomBarView);
                        }
                      } else {
                        signInController.showError = true;
                        signInController.showError2 = true;
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: ColorConfig.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius52),
                    ),
                  ),
                  child: const Text(
                    StringConfig.buttonSignIn,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: FontFamilyConfig.outfitSemiBold,
                      fontSize: FontSizeConfig.heading3Text,
                      color: ColorConfig.textWhiteColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height28,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.forgotPasswordView);
                  },
                  child: const Text(
                    StringConfig.forgotPassword,
                    style: TextStyle(
                      fontFamily: FontFamilyConfig.outfitRegular,
                      fontSize: FontSizeConfig.fontSize15,
                      fontWeight: FontWeight.w400,
                      color: ColorConfig.primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height36,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      endIndent: SizeConfig.dividerIndent08,
                      color: ColorConfig.textFieldBorderColor,
                    ),
                  ),
                  Text(
                    StringConfig.orContinueWith,
                    style: TextStyle(
                      fontFamily: FontFamilyConfig.outfitLight,
                      fontSize: FontSizeConfig.body2Text,
                      fontWeight: FontWeight.w300,
                      color: ColorConfig.textMediumColor,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: SizeConfig.dividerIndent08,
                      color: ColorConfig.textFieldBorderColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: SizeConfig.height36,
              ),
              Padding(
                padding: const EdgeInsets.only(left: SizeConfig.padding16, right: SizeConfig.padding16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: SizeConfig.width85,
                      height: SizeConfig.height54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(SizeConfig.borderRadius15),
                        border: Border.all(
                          color: ColorConfig.textFieldBorderColor,
                        ),
                      ),
                      child: const Center(
                        child: Image(
                          image: AssetImage(ImageConfig.googleLogo),
                          width: SizeConfig.width26,
                          height: SizeConfig.height26,
                        ),
                      ),
                    ),
                    Container(
                      width: SizeConfig.width85,
                      height: SizeConfig.height54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(SizeConfig.borderRadius15),
                        border: Border.all(
                          color: ColorConfig.textFieldBorderColor,
                        ),
                      ),
                      child: const Center(
                        child: Image(
                          image: AssetImage(ImageConfig.facebookLogo),
                          width: SizeConfig.width26,
                          height: SizeConfig.height26,
                        ),
                      ),
                    ),
                    Container(
                      width: SizeConfig.width85,
                      height: SizeConfig.height54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(SizeConfig.borderRadius15),
                        border: Border.all(
                          color: ColorConfig.textFieldBorderColor,
                        ),
                      ),
                      child: const Center(
                        child: Image(
                          image: AssetImage(ImageConfig.appleLogo),
                          width: SizeConfig.width26,
                          height: SizeConfig.height26,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: SizeConfig.padding50, left: SizeConfig.padding20, right: SizeConfig.padding20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              StringConfig.doYouHaveNoAccount,
              style: TextStyle(
                fontFamily: FontFamilyConfig.outfitLight,
                fontSize: FontSizeConfig.heading4Text,
                fontWeight: FontWeight.w300,
                color: ColorConfig.textMediumColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.signUpView);
              },
              child: const Text(
                StringConfig.buttonSignUp,
                style: TextStyle(
                  fontFamily: FontFamilyConfig.outfitSemiBold,
                  fontSize: FontSizeConfig.heading4Text,
                  fontWeight: FontWeight.w600,
                  color: ColorConfig.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

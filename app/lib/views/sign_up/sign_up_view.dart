import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/controller/sign_up_controller.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';
import 'package:prime_ai_flutter_ui_kit/utils/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/color_config.dart';
import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';
import '../../config/image_config.dart';
import '../../config/size_config.dart';
import '../../config/string_config.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignUpController signUpController = Get.put(SignUpController());

  void _togglePasswordVisibility() {
    setState(() {
      signUpController.obscureText = !signUpController.obscureText;
    });
  }

  @override
  void dispose() {
    signUpController.emailController.dispose();
    signUpController.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundWhiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        elevation: 0,
        backgroundColor: ColorConfig.backgroundWhiteColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: SizeConfig.iconSize20,
            color: ColorConfig.textColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SizeConfig.padding20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: SizeConfig.height20,
              ),
              const Text(
                StringConfig.createNewAccount,
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
                StringConfig.createNewAccountDescription,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamilyConfig.outfitRegular,
                  fontSize: FontSizeConfig.heading4Text,
                  color: ColorConfig.textMediumColor,
                ),
              ),
              const SizedBox(
                height: SizeConfig.height45,
              ),
              Form(
                key: signUpController.formSignUpKey,
                child: Column(
                  children: [
                    Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          signUpController.isFocusedTextField1 = hasFocus;
                        });
                      },
                      child: SizedBox(
                        height: SizeConfig.height52,
                        child: TextFormField(
                          controller: signUpController.emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontSize: FontSizeConfig.heading4Text,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamilyConfig.outfitMedium,
                            color: ColorConfig.textColor,
                          ),
                          onChanged: (value) {
                            setState(() {
                              signUpController.isEmail = signUpController.emailController.text.isNotEmpty;
                              signUpController.showError = false;
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
                            labelText: signUpController.isFocusedTextField1 || signUpController.emailController.text.isNotEmpty ? StringConfig.email : null,
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
                                color: signUpController.showError ? Colors.red : ColorConfig.textFieldBorderColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: signUpController.showError ? Colors.red : ColorConfig.primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: signUpController.showError,
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
                          signUpController.isFocusedTextField2 = hasFocus;
                        });
                      },
                      child: SizedBox(
                        height: SizeConfig.height52,
                        child: TextFormField(
                          controller: signUpController.passwordController,
                          obscureText: signUpController.obscureText,
                          style: const TextStyle(
                            fontSize: FontSizeConfig.heading4Text,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamilyConfig.outfitMedium,
                            color: ColorConfig.textColor,
                          ),
                          onChanged: (value) {
                            setState(() {
                              signUpController.isPassword = signUpController.passwordController.text.isNotEmpty;
                              signUpController.showError2 = false;
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
                            labelText: signUpController.isFocusedTextField2 || signUpController.passwordController.text.isNotEmpty ? StringConfig.password : null,
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
                                color: signUpController.showError2 ? Colors.red : ColorConfig.textFieldBorderColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: signUpController.showError2 ? Colors.red : ColorConfig.primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(SizeConfig.padding15),
                              child: GestureDetector(
                                onTap: _togglePasswordVisibility,
                                child: Image(
                                  image: AssetImage(signUpController.obscureText ? ImageConfig.passwordVisible : ImageConfig.passwordShow),
                                  width: SizeConfig.width18,
                                  color: signUpController.isFocusedTextField2 ? ColorConfig.primaryColor : ColorConfig.textColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: signUpController.showError2,
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
                height: SizeConfig.height40,
              ),
              SizedBox(
                height: SizeConfig.height52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      signUpController.showError = !signUpController.isEmail || signUpController.emailController.text.isEmpty;
                      signUpController.showError2 = !signUpController.isPassword || signUpController.passwordController.text.isEmpty;
                    });
                    if (signUpController.formSignUpKey.currentState!.validate() && !signUpController.showError && !signUpController.showError2) {
                      if (signUpController.emailController.text.isNotEmpty) {
                        if (signUpController.passwordController.text.isNotEmpty) {
                          Globals.client.register(signUpController.emailController.text, signUpController.passwordController.text).then((value) async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString("email", signUpController.emailController.text);
                            prefs.setBool("remember", true);
                            Get.toNamed(AppRoutes.otpView, parameters: {"code": value, "email": signUpController.emailController.text});
                          });
                        }
                      } else {
                        signUpController.showError = true;
                        signUpController.showError2 = true;
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
                    StringConfig.buttonSignUp,
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
                height: SizeConfig.height30,
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
                height: SizeConfig.height34,
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
              const SizedBox(
                height: SizeConfig.height100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    StringConfig.alreadyHaveAnAccount,
                    style: TextStyle(
                      fontFamily: FontFamilyConfig.outfitLight,
                      fontSize: FontSizeConfig.heading4Text,
                      fontWeight: FontWeight.w300,
                      color: ColorConfig.textMediumColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.signInView);
                    },
                    child: const Text(
                      StringConfig.buttonSignIn,
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
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/controller/forgot_password_controller.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';

import '../../../config/color_config.dart';
import '../../../config/font_family_config.dart';
import '../../../config/font_size_config.dart';
import '../../../config/size_config.dart';
import '../../../config/string_config.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {

  ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundWhiteColor,
      appBar: AppBar(
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
                StringConfig.resetYourPassword,
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
                StringConfig.resetYourPasswordDescription,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamilyConfig.outfitRegular,
                  fontSize: FontSizeConfig.heading4Text,
                  color: ColorConfig.textMediumColor,
                ),
              ),
              const SizedBox(
                height: SizeConfig.height34,
              ),
              Focus(
                onFocusChange: (hasFocus) {
                  setState(() {
                    forgotPasswordController.isFocusedTextField1 = hasFocus;
                  });
                },
                child: SizedBox(
                  height: SizeConfig.height52,
                  child: TextFormField(
                    controller: forgotPasswordController.emailController,
                    cursorColor: ColorConfig.primaryColor,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(
                      fontSize: FontSizeConfig.heading4Text,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamilyConfig.outfitMedium,
                      color: ColorConfig.textColor,
                    ),
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
                      labelText: forgotPasswordController.isFocusedTextField1 || forgotPasswordController.emailController.text.isNotEmpty ? StringConfig.email : null,
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
                        borderSide: const BorderSide(
                          color: ColorConfig.textFieldBorderColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorConfig.primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                      ),
                    ),
                  ),
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
                    Get.toNamed(AppRoutes.forgotPasswordOTPView);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: ColorConfig.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius52),
                    ),
                  ),
                  child: const Text(
                    StringConfig.buttonContinue,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: FontFamilyConfig.outfitSemiBold,
                      fontSize: FontSizeConfig.heading3Text,
                      color: ColorConfig.textWhiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

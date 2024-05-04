// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:prime_ai_flutter_ui_kit/controller/otp_controller.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';
import '../../config/color_config.dart';
import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';
import '../../config/size_config.dart';
import '../../config/string_config.dart';

class OTPView extends StatelessWidget {
  OTPView({Key? key}) : super(key: key);

  OTPController otpController = Get.put(OTPController());

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: SizeConfig.width73,
      height: SizeConfig.height54,
      textStyle: const TextStyle(
        fontSize: FontSizeConfig.fontSize20,
        color: ColorConfig.textColor,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamilyConfig.outfitSemiBold,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConfig.textFieldBorderColor,
        ),
        borderRadius: BorderRadius.circular(SizeConfig.borderRadius15),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: ColorConfig.primaryColor,
      ),
      borderRadius: BorderRadius.circular(SizeConfig.borderRadius15),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(SizeConfig.borderRadius15),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
          // color: ColorConfig.backgroundColor,
      ),
    );

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
          child: Form(
            key: otpController.formOTPKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: SizeConfig.height20,
                ),
                const Text(
                  StringConfig.enterOTPCodeHere,
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
                  StringConfig.enterOTPCodeDescription,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamilyConfig.outfitRegular,
                    fontSize: FontSizeConfig.heading4Text,
                    color: ColorConfig.textColor,
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: SizeConfig.padding04, right: SizeConfig.padding04),
                  child: Pinput(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    keyboardType: TextInputType.number,
                    controller: otpController.pinController,
                    focusNode: otpController.pinFocusNode,
                    showCursor: true,
                    errorPinTheme: errorPinTheme,
                    errorTextStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: FontSizeConfig.body1Text,
                      fontFamily: FontFamilyConfig.outfitRegular,
                      color: Colors.red
                    ),
                    // validator: (pin) {
                    //   if (pin == null || pin.isEmpty) {
                    //     return StringConfig.codeRequired;
                    //   } else if (pin == '2222') {
                    //     return null;
                    //   } else {
                    //     return StringConfig.thisCodeIsIncorrect;
                    //   }
                    // },
                    onCompleted: (pin) {

                    },
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height32,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringConfig.resendCodeText,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontFamily: FontFamilyConfig.outfitLight,
                        fontSize: FontSizeConfig.heading4Text,
                        color: ColorConfig.textColor,
                      ),
                    ),
                    Text(
                      StringConfig.resendCodeTimer,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: FontFamilyConfig.outfitSemiBold,
                        fontSize: FontSizeConfig.heading4Text,
                        color: ColorConfig.primaryColor,
                      ),
                    ),
                    Text(
                      StringConfig.resendCodeTimerSecond,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontFamily: FontFamilyConfig.outfitLight,
                        fontSize: FontSizeConfig.heading4Text,
                        color: ColorConfig.textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: SizeConfig.height40,
                ),
                SizedBox(
                  height: SizeConfig.height52,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.completeYourProfileView);
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
      ),
    );
  }
}

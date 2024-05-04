import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';
import '../../../config/color_config.dart';
import '../../../config/font_family_config.dart';
import '../../../config/font_size_config.dart';
import '../../../config/image_config.dart';
import '../../../config/size_config.dart';
import '../../../config/string_config.dart';
import '../../../controller/create_password_controller.dart';

class CreatePasswordView extends StatefulWidget {
  const CreatePasswordView({Key? key}) : super(key: key);

  @override
  State<CreatePasswordView> createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<CreatePasswordView> {

  CreatePasswordController createPasswordController = Get.put(CreatePasswordController());

  void _togglePasswordVisibility() {
    setState(() {
      createPasswordController.obscureText = !createPasswordController.obscureText;
    });
  }

  void _togglePasswordVisibility2() {
    setState(() {
      createPasswordController.obscureText2 = !createPasswordController.obscureText2;
    });
  }

  @override
  void dispose() {
    createPasswordController.passwordController.dispose();
    createPasswordController.confirmPasswordController.dispose();
    super.dispose();
  }

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
                StringConfig.createNewPassword,
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
                StringConfig.createNewPasswordDescription,
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
              Column(
                children: [
                  Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        createPasswordController.isFocusedTextField1 = hasFocus;
                      });
                    },
                    child: SizedBox(
                      height: SizeConfig.height52,
                      child: TextFormField(
                        controller: createPasswordController.passwordController,
                        obscureText: createPasswordController.obscureText,
                        style: const TextStyle(
                          fontSize: FontSizeConfig.heading4Text,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitMedium,
                          color: ColorConfig.textColor,
                        ),
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
                          labelText: createPasswordController.isFocusedTextField1 || createPasswordController.passwordController.text.isNotEmpty ? StringConfig.password : null,
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
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(SizeConfig.padding15),
                            child: GestureDetector(
                              onTap: _togglePasswordVisibility,
                              child: Image(
                                image: AssetImage(createPasswordController.obscureText ? ImageConfig.passwordVisible : ImageConfig.passwordShow),
                                width: SizeConfig.width18,
                                color: createPasswordController.isFocusedTextField1 ? ColorConfig.primaryColor : ColorConfig.textColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        createPasswordController.isFocusedTextField2 = hasFocus;
                      });
                    },
                    child: SizedBox(
                      height: SizeConfig.height52,
                      child: TextFormField(
                        controller: createPasswordController.confirmPasswordController,
                        obscureText: createPasswordController.obscureText2,
                        style: const TextStyle(
                          fontSize: FontSizeConfig.heading4Text,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitMedium,
                          color: ColorConfig.textColor,
                        ),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          isDense: true,
                          hintText: StringConfig.confirmPassword,
                          hintStyle: const TextStyle(
                            fontSize: FontSizeConfig.heading4Text,
                            fontWeight: FontWeight.w300,
                            fontFamily: FontFamilyConfig.outfitLight,
                            color: ColorConfig.textLightColor,
                          ),
                          labelText: createPasswordController.isFocusedTextField2 || createPasswordController.confirmPasswordController.text.isNotEmpty ? StringConfig.confirmPassword : null,
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
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(SizeConfig.padding15),
                            child: GestureDetector(
                              onTap: _togglePasswordVisibility2,
                              child: Image(
                                image: AssetImage(createPasswordController.obscureText2 ? ImageConfig.passwordVisible : ImageConfig.passwordShow),
                                width: SizeConfig.width18,
                                color: createPasswordController.isFocusedTextField1 ? ColorConfig.primaryColor : ColorConfig.textColor,
                              ),
                            ),
                          ),
                        ),
                      ),
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
                    Get.toNamed(AppRoutes.signInView);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: ColorConfig.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius52),
                    ),
                  ),
                  child: const Text(
                    StringConfig.buttonReset,
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

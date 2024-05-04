// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/font_family_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/font_size_config.dart';
import 'package:prime_ai_flutter_ui_kit/controller/language_controller.dart';
import 'package:prime_ai_flutter_ui_kit/controller/profile_controller.dart';

import '../../../config/color_config.dart';
import '../../../config/image_config.dart';
import '../../../config/size_config.dart';
import '../../../config/string_config.dart';
import '../../widget/common_app_bar.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  ProfileController profileController = Get.put(ProfileController());
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    languageController.loadSelectedLanguage();
    return Scaffold(
      backgroundColor: ColorConfig.backgroundWhiteColor,
      appBar: CommonAppBar(
        backgroundColor: ColorConfig.backgroundWhiteColor,
        centerTitle: true,
        title: StringConfig.languages.tr,
        leading: Center(
          child: Padding(
              padding: const EdgeInsets.only(left: SizeConfig.padding05),
              child: Obx(
                () => RotationTransition(
                  turns: AlwaysStoppedAnimation(languageController.arb.value ? 0.5 : 1),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      ImageConfig.backArrow,
                      width: SizeConfig.width24,
                    ),
                  ),
                ),
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: SizeConfig.padding20, top: SizeConfig.padding10, right: SizeConfig.padding20),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: profileController.languagesList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: SizeConfig.padding24),
                  child: GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   profileController.selectedIndex = index;
                        // });
                        debugPrint("Lang click index $index lng ${profileController.languagesList[index]}");
                        languageController.changeLanguage(language: profileController.languagesList[index]);
                        languageController.languageName.value = profileController.languagesList[index];
                      },
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              profileController.languagesList[index],
                              style: const TextStyle(
                                fontFamily: FontFamilyConfig.outfitRegular,
                                fontWeight: FontWeight.w400,
                                fontSize: FontSizeConfig.heading4Text,
                              ),
                            ),
                            if (languageController.languageName.value == profileController.languagesList[index])
                              Image.asset(
                                ImageConfig.radioButtonFill,
                                width: SizeConfig.width16,
                              ),
                            if (languageController.languageName.value != profileController.languagesList[index])
                              Image.asset(
                                ImageConfig.radioButton,
                                width: SizeConfig.width16,
                              ),
                          ],
                        ),
                      )),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

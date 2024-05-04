import 'dart:io';

import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/image_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/string_config.dart';
import 'package:prime_ai_flutter_ui_kit/controller/language_controller.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';
import 'package:prime_ai_flutter_ui_kit/views/widget/common_app_bar.dart';

import '../../config/color_config.dart';
import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';
import '../../config/size_config.dart';
import '../../controller/bottom_navigation_controller.dart';

BottomNavigationController bottomNavigationController =
    Get.put(BottomNavigationController());

class ChatView extends StatelessWidget {
  ChatView({Key? key}) : super(key: key);
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    languageController.loadSelectedLanguage();
    return ConditionalWillPopScope(
      onWillPop: () async {
        if (bottomNavigationController.pageIndex.value == 0) {
          exit(0);
        }
        return Future(() => true);
      },
      shouldAddCallback: false,
      child: Scaffold(
        backgroundColor: ColorConfig.backgroundWhiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(SizeConfig.height50),
          child: CommonAppBar(
            backgroundColor: ColorConfig.backgroundWhiteColor,
            centerTitle: true,
            title: StringConfig.aiAssistant,
            toolBarHeight: SizeConfig.height70,
            leading: Center(
                child: Obx(
              () => Padding(
                padding: EdgeInsets.only(
                    left:
                        languageController.arb.value ? 0 : SizeConfig.padding20,
                    right: languageController.arb.value
                        ? SizeConfig.padding20
                        : 0),
                child: Image.asset(
                  ImageConfig.appLogo,
                  width: SizeConfig.width30,
                  height: SizeConfig.height24,
                ),
              ),
            )),
            actions: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: SizeConfig.padding20,left: SizeConfig.padding20),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.upgradeToProView);
                    },
                    child: Image.asset(
                      ImageConfig.proMembership,
                      width: SizeConfig.width35,
                      height: SizeConfig.height40,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const Column(
              children: [
                Image(
                  image: AssetImage(ImageConfig.aiAssistant),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  width: SizeConfig.width433,
                  height: 419,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  StringConfig.welcomeTo,
                  style: TextStyle(
                    fontFamily: FontFamilyConfig.outfitMedium,
                    fontSize: FontSizeConfig.heading4Text,
                    fontWeight: FontWeight.w500,
                    color: ColorConfig.textColor,
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height04,
                ),
                const Text(
                  StringConfig.aiAssistant,
                  style: TextStyle(
                    fontFamily: FontFamilyConfig.outfitMedium,
                    fontSize: FontSizeConfig.fontSize34,
                    fontWeight: FontWeight.w500,
                    color: ColorConfig.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height12,
                ),
                const Text(
                  StringConfig.aiAssistantDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FontFamilyConfig.outfitRegular,
                    fontSize: FontSizeConfig.heading4Text,
                    fontWeight: FontWeight.w400,
                    color: ColorConfig.textMediumColor,
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height30,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: SizeConfig.padding20,
                      right: SizeConfig.padding20,
                      bottom: SizeConfig.padding30),
                  child: SizedBox(
                    height: SizeConfig.height52,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.startChatView);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: ColorConfig.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(SizeConfig.borderRadius52),
                        ),
                      ),
                      child: const Text(
                        StringConfig.buttonStartChat,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: FontFamilyConfig.outfitSemiBold,
                          fontSize: FontSizeConfig.heading3Text,
                          color: ColorConfig.textWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

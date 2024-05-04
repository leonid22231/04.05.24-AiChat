// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/size_config.dart';
import 'package:prime_ai_flutter_ui_kit/controller/language_controller.dart';
import 'package:prime_ai_flutter_ui_kit/controller/more_controller.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';
import '../../../config/color_config.dart';
import '../../../config/font_family_config.dart';
import '../../../config/font_size_config.dart';
import '../../../config/string_config.dart';

class AllTabView extends StatelessWidget {
  AllTabView({Key? key}) : super(key: key);

  MoreController moreController = Get.put(MoreController());
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    languageController.loadSelectedLanguage();
    return Padding(
      padding: const EdgeInsets.only(
          left: SizeConfig.padding20,
          right: SizeConfig.padding20,
          top: SizeConfig.padding24),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  StringConfig.writingTab,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamilyConfig.outfitSemiBold,
                    fontSize: FontSizeConfig.heading3Text,
                    color: ColorConfig.textColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.writingSeeAllView);
                  },
                  child: const Text(
                    StringConfig.seeAll,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamilyConfig.outfitMedium,
                      fontSize: FontSizeConfig.body2Text,
                      color: ColorConfig.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: SizeConfig.height16,
            ),
            SizedBox(
              height: SizeConfig.height157,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: moreController.writingSectionImage.length,
                itemBuilder: (context, index) {
                  final isSelectable = index < 2;
                  return Obx(() => Padding(
                        padding: EdgeInsets.only(
                            right: languageController.arb.value
                                ? 0
                                : SizeConfig.padding16,
                            left: languageController.arb.value
                                ? SizeConfig.padding16
                                : 0),
                        child: GestureDetector(
                          onTap: () {
                            if (isSelectable) {
                              if (index == 0) {
                                Get.toNamed(AppRoutes.articlesView);
                              } else if (index == 1) {
                                Get.toNamed(AppRoutes.translateLanguageView);
                              }
                            }
                          },
                          child: Container(
                            width: SizeConfig.width151,
                            height: SizeConfig.height157,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.borderRadius16),
                              color: ColorConfig.backgroundColor,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(SizeConfig.padding16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage(moreController
                                        .writingSectionImage[index]),
                                    width: SizeConfig.width38,
                                  ),
                                  const SizedBox(
                                    height: SizeConfig.height08,
                                  ),
                                  Text(
                                    moreController
                                        .writingSectionMainStrings[index],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: FontFamilyConfig.outfitMedium,
                                      fontSize: FontSizeConfig.heading4Text,
                                      color: ColorConfig.textColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: SizeConfig.height06,
                                  ),
                                  Expanded(
                                    child: Text(
                                      moreController
                                          .writingSectionSubStrings[index],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily:
                                            FontFamilyConfig.outfitRegular,
                                        fontSize: FontSizeConfig.body2Text,
                                        color: ColorConfig.textLightColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ));
                },
              ),
            ),
            const SizedBox(
              height: SizeConfig.height24,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringConfig.creativeTab,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamilyConfig.outfitSemiBold,
                    fontSize: FontSizeConfig.heading3Text,
                    color: ColorConfig.textColor,
                  ),
                ),
                Text(
                  StringConfig.seeAll,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamilyConfig.outfitMedium,
                    fontSize: FontSizeConfig.body2Text,
                    color: ColorConfig.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: SizeConfig.height16,
            ),
            SizedBox(
              height: SizeConfig.height157,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: moreController.creativeSectionMainStrings.length,
                itemBuilder: (context, index) {
                  return Obx(() => Padding(
                        padding: EdgeInsets.only(
                            left: languageController.arb.value
                                ? SizeConfig.padding16
                                : 0,
                            right: languageController.arb.value
                                ? 0
                                : SizeConfig.padding16),
                        child: Container(
                          width: SizeConfig.width151,
                          height: SizeConfig.height157,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius16),
                            color: ColorConfig.backgroundColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(SizeConfig.padding16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                  image: AssetImage(moreController
                                      .creativeSectionImage[index]),
                                  width: SizeConfig.width38,
                                ),
                                const SizedBox(
                                  height: SizeConfig.height08,
                                ),
                                Text(
                                  moreController
                                      .creativeSectionMainStrings[index],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: FontFamilyConfig.outfitMedium,
                                    fontSize: FontSizeConfig.heading4Text,
                                    color: ColorConfig.textColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: SizeConfig.height06,
                                ),
                                Expanded(
                                  child: Text(
                                    moreController
                                        .creativeSectionSubStrings[index],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          FontFamilyConfig.outfitRegular,
                                      fontSize: FontSizeConfig.body2Text,
                                      color: ColorConfig.textLightColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ));
                },
              ),
            ),
            const SizedBox(
              height: SizeConfig.height24,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringConfig.businessTab,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamilyConfig.outfitSemiBold,
                    fontSize: FontSizeConfig.heading3Text,
                    color: ColorConfig.textColor,
                  ),
                ),
                Text(
                  StringConfig.seeAll,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamilyConfig.outfitMedium,
                    fontSize: FontSizeConfig.body2Text,
                    color: ColorConfig.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: SizeConfig.height16,
            ),
            SizedBox(
              height: SizeConfig.height157,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: moreController.businessSectionSubStrings.length,
                itemBuilder: (context, index) {
                  return Obx(() => Padding(
                    padding:  EdgeInsets.only(
                        left: languageController.arb.value
                            ? SizeConfig.padding16
                            : 0,
                        right: languageController.arb.value
                            ? 0
                            : SizeConfig.padding16),
                    child: Container(
                      width: SizeConfig.width151,
                      height: SizeConfig.height157,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadius16),
                        color: ColorConfig.backgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(SizeConfig.padding16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage(
                                  moreController.businessSectionImage[index]),
                              width: SizeConfig.width38,
                            ),
                            const SizedBox(
                              height: SizeConfig.height08,
                            ),
                            Text(
                              moreController.businessSectionMainStrings[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamilyConfig.outfitMedium,
                                fontSize: FontSizeConfig.heading4Text,
                                color: ColorConfig.textColor,
                              ),
                            ),
                            const SizedBox(
                              height: SizeConfig.height06,
                            ),
                            Expanded(
                              child: Text(
                                moreController.businessSectionSubStrings[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamilyConfig.outfitRegular,
                                  fontSize: FontSizeConfig.body2Text,
                                  color: ColorConfig.textLightColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
                },
              ),
            ),
            const SizedBox(
              height: SizeConfig.height24,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringConfig.developersTab,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamilyConfig.outfitSemiBold,
                    fontSize: FontSizeConfig.heading3Text,
                    color: ColorConfig.textColor,
                  ),
                ),
                Text(
                  StringConfig.seeAll,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamilyConfig.outfitMedium,
                    fontSize: FontSizeConfig.body2Text,
                    color: ColorConfig.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: SizeConfig.height16,
            ),
            SizedBox(
              height: SizeConfig.height157,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: moreController.developersSectionMainStrings.length,
                itemBuilder: (context, index) {
                  return Obx(() => Padding(
                    padding:  EdgeInsets.only( left: languageController.arb.value
                        ? SizeConfig.padding16
                        : 0,
                        right: languageController.arb.value
                            ? 0
                            : SizeConfig.padding16),
                    child: Container(
                      width: SizeConfig.width151,
                      height: SizeConfig.height157,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadius16),
                        color: ColorConfig.backgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(SizeConfig.padding16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage(
                                  moreController.developersSectionImage[index]),
                              width: SizeConfig.width38,
                            ),
                            const SizedBox(
                              height: SizeConfig.height08,
                            ),
                            Text(
                              moreController
                                  .developersSectionMainStrings[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamilyConfig.outfitMedium,
                                fontSize: FontSizeConfig.heading4Text,
                                color: ColorConfig.textColor,
                              ),
                            ),
                            const SizedBox(
                              height: SizeConfig.height06,
                            ),
                            Expanded(
                              child: Text(
                                moreController
                                    .developersSectionSubStrings[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamilyConfig.outfitRegular,
                                  fontSize: FontSizeConfig.body2Text,
                                  color: ColorConfig.textLightColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
                },
              ),
            ),
            const SizedBox(
              height: SizeConfig.height24,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringConfig.othersTab,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamilyConfig.outfitSemiBold,
                    fontSize: FontSizeConfig.heading3Text,
                    color: ColorConfig.textColor,
                  ),
                ),
                Text(
                  StringConfig.seeAll,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamilyConfig.outfitMedium,
                    fontSize: FontSizeConfig.body2Text,
                    color: ColorConfig.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: SizeConfig.height16,
            ),
            SizedBox(
              height: SizeConfig.height157,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: moreController.othersSectionMainStrings.length,
                itemBuilder: (context, index) {
                  return Obx(() => Padding(
                    padding:  EdgeInsets.only(left: languageController.arb.value
                        ? SizeConfig.padding16
                        : 0,
                        right: languageController.arb.value
                            ? 0
                            : SizeConfig.padding16),
                    child: Container(
                      width: SizeConfig.width151,
                      height: SizeConfig.height157,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadius16),
                        color: ColorConfig.backgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(SizeConfig.padding16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage(
                                  moreController.othersSectionImage[index]),
                              width: SizeConfig.width38,
                            ),
                            const SizedBox(
                              height: SizeConfig.height08,
                            ),
                            Text(
                              moreController.othersSectionMainStrings[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamilyConfig.outfitMedium,
                                fontSize: FontSizeConfig.heading4Text,
                                color: ColorConfig.textColor,
                              ),
                            ),
                            const SizedBox(
                              height: SizeConfig.height06,
                            ),
                            Expanded(
                              child: Text(
                                moreController.othersSectionSubStrings[index],
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamilyConfig.outfitRegular,
                                  fontSize: FontSizeConfig.body2Text,
                                  color: ColorConfig.textLightColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
                },
              ),
            ),
            const SizedBox(
              height: SizeConfig.height20,
            ),
          ],
        ),
      ),
    );
  }
}

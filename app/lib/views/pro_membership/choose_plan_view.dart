// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/controller/upgrade_pro_controller.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';

import '../../config/color_config.dart';
import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';
import '../../config/image_config.dart';
import '../../config/size_config.dart';
import '../../config/string_config.dart';
import '../widget/common_app_bar.dart';

class ChoosePlanView extends StatelessWidget {
  ChoosePlanView({Key? key}) : super(key: key);

  UpgradeProController upgradeProController = Get.put(UpgradeProController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundWhiteColor,
      appBar: CommonAppBar(
        backgroundColor: ColorConfig.backgroundWhiteColor,
        centerTitle: true,
        title: StringConfig.choosePlan.tr,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: SizeConfig.padding05),
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: SizeConfig.padding20,
          right: SizeConfig.padding20,
          top: SizeConfig.padding10,
          bottom: SizeConfig.padding10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: SizeConfig.padding24),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.selectPaymentView,
                      arguments: Get.arguments,
                    );
                  },
                  child: Container(
                    // height: SizeConfig.width241,
                    padding: const EdgeInsets.only(
                      left: SizeConfig.padding14,
                      right: SizeConfig.padding14,
                      top: SizeConfig.padding16,
                      bottom: SizeConfig.padding12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius32),
                      color: ColorConfig.backgroundColor,
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          ImageConfig.goldMembership,
                          width: SizeConfig.width34,
                        ),
                        const SizedBox(
                          height: SizeConfig.height06,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              StringConfig.dollar20.tr,
                              style: const TextStyle(
                                fontSize: FontSizeConfig.fontSize30,
                                fontWeight: FontWeight.w600,
                                fontFamily: FontFamilyConfig.outfitSemiBold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: SizeConfig.padding10),
                              child: Text(
                                StringConfig.month1.tr,
                                style: const TextStyle(
                                  fontSize: FontSizeConfig.body1Text,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamilyConfig.outfitRegular,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: SizeConfig.height05,
                        ),
                        Text(
                          StringConfig.save10.tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: FontSizeConfig.body2Text,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamilyConfig.outfitRegular,
                          ),
                        ),
                        const Divider(
                          color: ColorConfig.dividerColor,
                          height: SizeConfig.height24,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount:
                              upgradeProController.planFeatureList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: SizeConfig.padding24,
                                  bottom: SizeConfig.padding08),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageConfig.tickBlack,
                                    width: SizeConfig.width15,
                                  ),
                                  const SizedBox(
                                    width: SizeConfig.width10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      upgradeProController
                                          .planFeatureList[index].tr,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: FontSizeConfig.body1Text,
                                        fontWeight: FontWeight.w400,
                                        fontFamily:
                                            FontFamilyConfig.outfitRegular,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: SizeConfig.padding24),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.selectPaymentView,
                      arguments: Get.arguments,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: SizeConfig.padding14,
                      right: SizeConfig.padding14,
                      top: SizeConfig.padding16,
                      bottom: SizeConfig.padding12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius32),
                      color: ColorConfig.backgroundColor,
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          ImageConfig.goldMembership,
                          width: SizeConfig.width34,
                        ),
                        const SizedBox(
                          height: SizeConfig.height06,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              StringConfig.dollar40.tr,
                              style: const TextStyle(
                                fontSize: FontSizeConfig.fontSize30,
                                fontWeight: FontWeight.w600,
                                fontFamily: FontFamilyConfig.outfitSemiBold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: SizeConfig.padding10),
                              child: Text(
                                StringConfig.month6.tr,
                                style: const TextStyle(
                                  fontSize: FontSizeConfig.body1Text,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamilyConfig.outfitRegular,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: SizeConfig.height05,
                        ),
                        Text(
                          StringConfig.save40.tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: FontSizeConfig.body2Text,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamilyConfig.outfitRegular,
                          ),
                        ),
                        const Divider(
                          color: ColorConfig.dividerColor,
                          height: SizeConfig.height24,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount:
                              upgradeProController.planFeatureList2.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: SizeConfig.padding24,
                                  bottom: SizeConfig.padding08),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageConfig.tickBlack,
                                    width: SizeConfig.width15,
                                  ),
                                  const SizedBox(
                                    width: SizeConfig.width10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      upgradeProController
                                          .planFeatureList2[index].tr,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: FontSizeConfig.body1Text,
                                        fontWeight: FontWeight.w400,
                                        fontFamily:
                                            FontFamilyConfig.outfitRegular,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: SizeConfig.padding24),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.selectPaymentView,
                      arguments: Get.arguments,
                    );
                  },
                  child: Container(
                    // height: SizeConfig.width241,
                    padding: const EdgeInsets.only(
                      left: SizeConfig.padding14,
                      right: SizeConfig.padding14,
                      top: SizeConfig.padding16,
                      bottom: SizeConfig.padding12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius32),
                      color: ColorConfig.backgroundColor,
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          ImageConfig.goldMembership,
                          width: SizeConfig.width34,
                        ),
                        const SizedBox(
                          height: SizeConfig.height06,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              StringConfig.dollar70.tr,
                              style: const TextStyle(
                                fontSize: FontSizeConfig.fontSize30,
                                fontWeight: FontWeight.w600,
                                fontFamily: FontFamilyConfig.outfitSemiBold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: SizeConfig.padding10),
                              child: Text(
                                StringConfig.month12.tr,
                                style: const TextStyle(
                                  fontSize: FontSizeConfig.body1Text,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamilyConfig.outfitRegular,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: SizeConfig.height05,
                        ),
                        Text(
                          StringConfig.save40.tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: FontSizeConfig.body2Text,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamilyConfig.outfitRegular,
                          ),
                        ),
                        const Divider(
                          color: ColorConfig.dividerColor,
                          height: SizeConfig.height24,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              upgradeProController.planFeatureList3.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: SizeConfig.padding24,
                                  bottom: SizeConfig.padding08),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageConfig.tickBlack,
                                    width: SizeConfig.width15,
                                  ),
                                  const SizedBox(
                                    width: SizeConfig.width10,
                                  ),
                                  Expanded(
                                      child: Text(
                                    upgradeProController
                                        .planFeatureList3[index].tr,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: FontSizeConfig.body1Text,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          FontFamilyConfig.outfitRegular,
                                    ),
                                  )),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
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

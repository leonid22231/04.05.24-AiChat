// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/controller/bottom_navigation_controller.dart';
import 'package:prime_ai_flutter_ui_kit/controller/upgrade_pro_controller.dart';
import '../../config/color_config.dart';
import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';
import '../../config/image_config.dart';
import '../../config/size_config.dart';
import '../../config/string_config.dart';
import '../../routes/app_routes.dart';
import '../widget/common_app_bar.dart';

class ReviewSummaryView extends StatelessWidget {
  ReviewSummaryView({Key? key}) : super(key: key);

  UpgradeProController upgradeProController = Get.put(UpgradeProController());
  BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    return Scaffold(
      backgroundColor: ColorConfig.backgroundWhiteColor,
      appBar: CommonAppBar(
        backgroundColor: ColorConfig.backgroundWhiteColor,
        centerTitle: true,
        title: StringConfig.reviewSummary,
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
          left: SizeConfig.padding20, top: SizeConfig.padding10,
          right: SizeConfig.padding20, bottom: SizeConfig.padding10,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: SizeConfig.padding24),
              child: Container(
                height: SizeConfig.width241,
                padding: const EdgeInsets.only(
                  left: SizeConfig.padding14, right: SizeConfig.padding14,
                  top: SizeConfig.padding16, bottom: SizeConfig.padding12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.borderRadius32),
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringConfig.dollar20,
                          style: TextStyle(
                            fontSize: FontSizeConfig.fontSize30,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamilyConfig.outfitSemiBold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.padding10),
                          child: Text(
                            StringConfig.month1,
                            style: TextStyle(
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
                    const Text(
                      StringConfig.save10,
                      style: TextStyle(
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
                      itemCount: upgradeProController.planFeatureList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: SizeConfig.padding24, bottom: SizeConfig.padding08),
                          child: Row(
                            children: [
                              Image.asset(
                                ImageConfig.tickBlack,
                                width: SizeConfig.width15,
                              ),
                              const SizedBox(
                                width: SizeConfig.width10,
                              ),
                              Text(
                                upgradeProController.planFeatureList[index],
                                style: const TextStyle(
                                  fontSize: FontSizeConfig.body1Text,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamilyConfig.outfitRegular,
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
            Container(
              height: SizeConfig.height138,
              padding: const EdgeInsets.all(SizeConfig.padding16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.borderRadius16),
                color: ColorConfig.backgroundColor,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringConfig.amount,
                        style: TextStyle(
                          fontSize: FontSizeConfig.body1Text,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitRegular,
                        ),
                      ),
                      Text(
                        StringConfig.dollar20,
                        style: TextStyle(
                          fontSize: FontSizeConfig.body1Text,
                          fontWeight: FontWeight.w500,
                          fontFamily: FontFamilyConfig.outfitMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.height16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringConfig.tax,
                        style: TextStyle(
                          fontSize: FontSizeConfig.body1Text,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitRegular,
                        ),
                      ),
                      Text(
                        StringConfig.dollar20By1,
                        style: TextStyle(
                          fontSize: FontSizeConfig.body1Text,
                          fontWeight: FontWeight.w500,
                          fontFamily: FontFamilyConfig.outfitMedium,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: ColorConfig.dividerColor,
                    height: SizeConfig.height30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringConfig.total,
                        style: TextStyle(
                          fontSize: FontSizeConfig.body1Text,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitRegular,
                        ),
                      ),
                      Text(
                        StringConfig.dollar20,
                        style: TextStyle(
                          fontSize: FontSizeConfig.body1Text,
                          fontWeight: FontWeight.w500,
                          fontFamily: FontFamilyConfig.outfitMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: SizeConfig.padding20, bottom: SizeConfig.padding15, top: SizeConfig.padding15, right: SizeConfig.padding20),
        child: SizedBox(
          height: SizeConfig.height52,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (args != null && args['cameFromImageGenerator'] == true) {
                Get.offAllNamed(
                  AppRoutes.imageGeneratorView,
                  predicate: (route) =>
                  !route.isFirst &&
                      route.settings.name != AppRoutes.imageGeneratorView,
                );
              } else {
                Get.toNamed(AppRoutes.bottomBarView);
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
              StringConfig.buttonConfirm,
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
    );
  }
}

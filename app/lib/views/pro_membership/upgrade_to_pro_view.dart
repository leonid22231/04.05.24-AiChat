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

class UpgradeToProView extends StatelessWidget {
  UpgradeToProView({Key? key}) : super(key: key);

  UpgradeProController upgradeProController = Get.put(UpgradeProController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundWhiteColor,
      appBar: CommonAppBar(
        backgroundColor: ColorConfig.backgroundWhiteColor,
        centerTitle: true,
        title: StringConfig.upgradeToPro.tr,
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
            right: SizeConfig.padding20,
            left: SizeConfig.padding20,
            top: SizeConfig.padding10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(SizeConfig.borderRadius10),
                    topRight: Radius.circular(SizeConfig.borderRadius10),
                  ),
                  color: ColorConfig.primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: SizeConfig.padding12,
                      right: SizeConfig.padding12,
                      bottom: SizeConfig.padding12,
                      top: SizeConfig.padding10),
                  child: Column(
                    children: [
                      Image.asset(
                        ImageConfig.goldMembership,
                        width: SizeConfig.width26,
                      ),
                      const SizedBox(
                        height: SizeConfig.height08,
                      ),
                      Text(
                        StringConfig.enjoyAllFeatures.tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: FontSizeConfig.body2Text,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitLight,
                          color: ColorConfig.textWhiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: SizeConfig.height485,
                padding: const EdgeInsets.only(
                    left: SizeConfig.padding16,
                    top: SizeConfig.padding15,
                    bottom: SizeConfig.padding16,
                    right: SizeConfig.padding16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(SizeConfig.borderRadius10),
                    bottomRight: Radius.circular(SizeConfig.borderRadius10),
                  ),
                  border: Border.all(
                    color: ColorConfig.backgroundColor,
                    width: 2,
                  ),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: upgradeProController.featuresList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: SizeConfig.padding15),
                          child: Row(
                            children: [
                              Image.asset(
                                ImageConfig.checkFeature,
                                width: SizeConfig.width15,
                              ),
                              const SizedBox(
                                width: SizeConfig.width10,
                              ),
                              Expanded(
                                child: Text(
                                  upgradeProController.featuresList[index].tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: FontSizeConfig.body1Text,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontFamilyConfig.outfitRegular,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            left: SizeConfig.padding20,
            bottom: SizeConfig.padding15,
            top: SizeConfig.padding15,
            right: SizeConfig.padding20),
        child: SizedBox(
          height: SizeConfig.height52,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(
                AppRoutes.choosePlanView,
                arguments: Get.arguments,
              );
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: ColorConfig.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeConfig.borderRadius52),
              ),
            ),
            child: const Text(
              StringConfig.buttonUpgradeToPro,
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

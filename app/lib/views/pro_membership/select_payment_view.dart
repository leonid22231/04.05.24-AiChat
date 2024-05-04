// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/controller/upgrade_pro_controller.dart';

import '../../config/color_config.dart';
import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';
import '../../config/image_config.dart';
import '../../config/size_config.dart';
import '../../config/string_config.dart';
import '../../routes/app_routes.dart';
import '../widget/common_app_bar.dart';

class SelectPaymentView extends StatefulWidget {
  const SelectPaymentView({Key? key}) : super(key: key);

  @override
  State<SelectPaymentView> createState() => _SelectPaymentViewState();
}

class _SelectPaymentViewState extends State<SelectPaymentView> {
  UpgradeProController upgradeProController = Get.put(UpgradeProController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundWhiteColor,
      appBar: CommonAppBar(
        backgroundColor: ColorConfig.backgroundWhiteColor,
        centerTitle: true,
        title: StringConfig.selectPayment,
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
        padding: const EdgeInsets.only(left: SizeConfig.padding20, top: SizeConfig.padding10, right: SizeConfig.padding20, bottom: SizeConfig.padding10),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: upgradeProController.paymentModeList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: SizeConfig.padding24),
              child: Container(
                height: SizeConfig.height70,
                padding: const EdgeInsets.only(left: SizeConfig.padding12, top: SizeConfig.padding12, bottom: SizeConfig.padding12, right: SizeConfig.padding16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.borderRadius10),
                  color: ColorConfig.backgroundColor,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      upgradeProController.selectedIndex = index;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: ColorConfig.backgroundWhiteColor,
                            child: Image.asset(
                              upgradeProController.paymentModeImage[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: SizeConfig.width10,
                          ),
                          Text(
                            upgradeProController.paymentModeList[index],
                            style: const TextStyle(
                              fontSize: FontSizeConfig.heading4Text,
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamilyConfig.outfitMedium,
                            ),
                          ),
                        ],
                      ),
                      if (upgradeProController.selectedIndex == index)
                        Image.asset(
                          ImageConfig.radioButtonFill,
                          width: SizeConfig.width16,
                        ),
                      if (upgradeProController.selectedIndex != index)
                        Image.asset(
                          ImageConfig.radioButton,
                          width: SizeConfig.width16,
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: SizeConfig.padding20, bottom: SizeConfig.padding15, top: SizeConfig.padding15, right: SizeConfig.padding20),
        child: SizedBox(
          height: SizeConfig.height52,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(
                AppRoutes.reviewSummaryView,
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
              StringConfig.buttonConfirmPayment,
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

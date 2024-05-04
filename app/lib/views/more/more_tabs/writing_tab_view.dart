// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/controller/more_controller.dart';
import '../../../config/color_config.dart';
import '../../../config/font_family_config.dart';
import '../../../config/font_size_config.dart';
import '../../../config/size_config.dart';

class WritingTabView extends StatelessWidget {
  WritingTabView({Key? key}) : super(key: key);

  MoreController moreController = Get.put(MoreController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: SizeConfig.padding20, right: SizeConfig.padding20, top: SizeConfig.padding24),
      child: SizedBox(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: SizeConfig.axisCountSize02,
            mainAxisSpacing: SizeConfig.spacingSize16,
            crossAxisSpacing: SizeConfig.spacingSize16,
            mainAxisExtent: SizeConfig.height164,
          ),
          itemCount: moreController.writingSectionImage.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(moreController.navigationIndexString[index]);
              },
              child: Container(
                width: SizeConfig.width158,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.borderRadius16),
                  color: ColorConfig.backgroundColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(SizeConfig.padding16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage(moreController.writingSectionImage[index]),
                        width: SizeConfig.width38,
                      ),
                      const SizedBox(
                        height: SizeConfig.height08,
                      ),
                      Text(
                        moreController.writingSectionMainStrings[index],
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
                      Text(
                        moreController.writingSectionSubStrings[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitRegular,
                          fontSize: FontSizeConfig.body2Text,
                          color: ColorConfig.textLightColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

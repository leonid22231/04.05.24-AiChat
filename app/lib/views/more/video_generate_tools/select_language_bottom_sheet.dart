import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/controller/video_generator_controller.dart';

import '../../../config/color_config.dart';
import '../../../config/font_family_config.dart';
import '../../../config/font_size_config.dart';
import '../../../config/image_config.dart';
import '../../../config/size_config.dart';
import '../../../config/string_config.dart';
import '../../../model/video_generate_language_model.dart';

selectLanguageBottomSheet(BuildContext context) {
  VideoGeneratorController videoGeneratorController = Get.put(VideoGeneratorController());
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: ColorConfig.backgroundWhiteColor,
    shape: const OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(SizeConfig.borderRadius10),
        topRight: Radius.circular(SizeConfig.borderRadius10),
      ),
      borderSide: BorderSide.none,
    ),
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: SizeConfig.height500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: SizeConfig.padding16, right: SizeConfig.padding16, top: SizeConfig.padding16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Image(
                        image: AssetImage(ImageConfig.selectLanguage),
                        width: SizeConfig.width29,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        StringConfig.selectLanguage,
                        style: TextStyle(
                          fontFamily: FontFamilyConfig.outfitRegular,
                          fontWeight: FontWeight.w400,
                          fontSize: FontSizeConfig.heading4Text,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Image(
                      image: AssetImage(ImageConfig.close),
                      width: SizeConfig.width16,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: SizeConfig.height30,
              indent: SizeConfig.width16,
              endIndent: SizeConfig.width16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: SizeConfig.padding05),
                child: Scrollbar(
                  thickness: 1.6,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: SizeConfig.padding16, right: SizeConfig.padding11),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final language = commonLanguagesWithFlags[index]["language"];
                            final countryCode = commonLanguagesWithFlags[index]["code"];
                            return GestureDetector(
                              onTap: () {
                                videoGeneratorController.selectLanguage(index);
                              },
                              child: Obx(() {
                                final isSelected = index == videoGeneratorController.selectedLanguageIndex.value;
                                return Container(
                                  padding: const EdgeInsets.all(SizeConfig.padding15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(SizeConfig.borderRadius10),
                                    border: Border.all(
                                      color: isSelected ? ColorConfig.primaryColor : Colors.transparent,
                                      width: 1.0,
                                    ),
                                    color: isSelected ? ColorConfig.backgroundLightColor : Colors.transparent,
                                  ),
                                  child: Row(
                                    children: [
                                      Flag.fromString(
                                        countryCode.toString(),
                                        width: SizeConfig.width26,
                                        height: SizeConfig.height18,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width12,
                                      ),
                                      Text(
                                        language.toString(),
                                        style: const TextStyle(
                                          fontSize: FontSizeConfig.body1Text,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: FontFamilyConfig.outfitRegular,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            );
                          },
                          itemCount: commonLanguagesWithFlags.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: SizeConfig.padding16, right: SizeConfig.padding16, bottom: SizeConfig.padding16),
              child: SizedBox(
                height: SizeConfig.height52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: ColorConfig.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius52),
                    ),
                  ),
                  child: const Text(
                    StringConfig.buttonSubmit,
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
      );
    },
  );
}
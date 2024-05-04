import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/controller/video_generator_controller.dart';
import '../../../config/color_config.dart';
import '../../../config/font_family_config.dart';
import '../../../config/font_size_config.dart';
import '../../../config/image_config.dart';
import '../../../config/size_config.dart';
import '../../../config/string_config.dart';

selectVoiceBottomSheet(BuildContext context) {
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
                        image: AssetImage(ImageConfig.selectVoice),
                        width: SizeConfig.width29,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        StringConfig.selectVoice,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              StringConfig.voiceFemale,
                              style: TextStyle(
                                fontSize: FontSizeConfig.heading4Text,
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamilyConfig.outfitMedium,
                              ),
                            ),
                            const SizedBox(
                              height: SizeConfig.height10,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                bool shouldShowIcon = [1, 4, 5].contains(index);
                                return GestureDetector(
                                  onTap: () {
                                    if (videoGeneratorController.selectedVoiceIndex.value == index) {
                                      videoGeneratorController.selectedVoiceIndex.value = -1;
                                    } else {
                                      videoGeneratorController.selectedVoiceIndex.value = index;
                                      videoGeneratorController.selectedMaleVoiceIndex.value = -1;
                                    }
                                  },
                                  child: Obx(() {
                                    final isSelected = index == videoGeneratorController.selectedVoiceIndex.value;
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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            videoGeneratorController.selectFemaleVoice[index],
                                            style: const TextStyle(
                                              fontSize: FontSizeConfig.body1Text,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: FontFamilyConfig.outfitRegular,
                                            ),
                                          ),
                                          if(shouldShowIcon)
                                            const Image(
                                              image: AssetImage(ImageConfig.goldMembership),
                                              width: SizeConfig.width22,
                                            ),
                                        ],
                                      ),
                                    );
                                  }),
                                );
                              },
                              itemCount: videoGeneratorController.selectFemaleVoice.length,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: SizeConfig.height10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: SizeConfig.padding16, right: SizeConfig.padding16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              StringConfig.voiceMale,
                              style: TextStyle(
                                fontSize: FontSizeConfig.heading4Text,
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamilyConfig.outfitMedium,
                              ),
                            ),
                            const SizedBox(
                              height: SizeConfig.height10,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                bool shouldShowIcon = [0, 1].contains(index);
                                return GestureDetector(
                                  onTap: () {
                                    if (videoGeneratorController.selectedMaleVoiceIndex.value == index) {
                                      videoGeneratorController.selectedMaleVoiceIndex.value = -1;
                                    } else {
                                      videoGeneratorController.selectedMaleVoiceIndex.value = index;
                                      videoGeneratorController.selectedVoiceIndex.value = -1;
                                    }
                                  },
                                  child: Obx(() {
                                    final isSelected = index == videoGeneratorController.selectedMaleVoiceIndex.value;
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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            videoGeneratorController.selectMaleVoice[index],
                                            style: const TextStyle(
                                              fontSize: FontSizeConfig.body1Text,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: FontFamilyConfig.outfitRegular,
                                            ),
                                          ),
                                          if(shouldShowIcon)
                                            const Image(
                                              image: AssetImage(ImageConfig.goldMembership),
                                              width: SizeConfig.width22,
                                            ),
                                        ],
                                      ),
                                    );
                                  }),
                                );
                              },
                              itemCount: videoGeneratorController.selectMaleVoice.length,
                            ),
                          ],
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
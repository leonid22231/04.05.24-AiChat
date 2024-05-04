import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/color_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/font_family_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/font_size_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/image_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/size_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/string_config.dart';
import 'package:prime_ai_flutter_ui_kit/controller/video_generator_controller.dart';

selectFramingBottomSheet(BuildContext context) {
  VideoGeneratorController videoGeneratorController = Get.put(VideoGeneratorController());

  void changeFramingSize(int newIndex, BuildContext context) {
    // ignore: invalid_use_of_protected_member
    ScaffoldMessenger.of(context).setState(() {
      videoGeneratorController.selectedFramingSizeIndex = newIndex;
    });
  }

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
                        image: AssetImage(ImageConfig.selectFraming),
                        width: SizeConfig.width29,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        StringConfig.selectFraming,
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
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: SizeConfig.mainAxisSize20,
                            crossAxisSpacing: SizeConfig.mainAxisSize20,
                            mainAxisExtent: SizeConfig.height131,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                videoGeneratorController.deselectAllFrames();
                                videoGeneratorController.toggleFrameSelection(index);
                                changeFramingSize(index, context);
                              },
                              child: Obx(() {
                                final isSelected = videoGeneratorController.selectedFrames[index];
                                return Container(
                                  width: SizeConfig.width98,
                                  decoration: BoxDecoration(
                                    color: ColorConfig.backgroundColor,
                                    borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                                    border: Border.all(
                                      color: isSelected ? ColorConfig.primaryColor : Colors.transparent,
                                      width: 1.0, // Border width
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(SizeConfig.padding08),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image(
                                          image: AssetImage(videoGeneratorController.selectFramingImage[index]),
                                        ),
                                        const SizedBox(
                                          height: SizeConfig.height04,
                                        ),
                                        Text(
                                          videoGeneratorController.selectFramingSize[index],
                                          style: const TextStyle(
                                            fontFamily: FontFamilyConfig.outfitRegular,
                                            fontWeight: FontWeight.w400,
                                            fontSize: FontSizeConfig.fontSize15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                          itemCount: 7,
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
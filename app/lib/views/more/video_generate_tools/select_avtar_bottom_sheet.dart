import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prime_ai_flutter_ui_kit/config/color_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/font_family_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/font_size_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/image_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/size_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/string_config.dart';
import 'package:prime_ai_flutter_ui_kit/controller/video_generator_controller.dart';

selectAvtarBottomSheet(BuildContext context) {
  VideoGeneratorController videoGeneratorController =
      Get.put(VideoGeneratorController());
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
              padding: const EdgeInsets.only(
                  left: SizeConfig.padding16,
                  top: SizeConfig.padding16,
                  right: SizeConfig.padding16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Image(
                        image: AssetImage(ImageConfig.selectAvtar),
                        width: SizeConfig.width29,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        StringConfig.selectAvtar,
                        style: TextStyle(
                          fontFamily: FontFamilyConfig.outfitRegular,
                          fontWeight: FontWeight.w400,
                          fontSize: FontSizeConfig.heading4Text,
                        ),
                      ), // Text
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
                        padding: const EdgeInsets.only(
                            left: SizeConfig.padding16,
                            right: SizeConfig.padding11),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: SizeConfig.mainAxisSize20,
                            crossAxisSpacing: SizeConfig.mainAxisSize20,
                          ),
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return GestureDetector(
                                onTap: () {
                                  _pickImage();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.borderRadius10),
                                    color: ColorConfig.backgroundColor,
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(ImageConfig.addVideo),
                                        width: SizeConfig.width22,
                                      ),
                                      SizedBox(
                                        height: SizeConfig.height09,
                                      ),
                                      Text(
                                        StringConfig.addAvtar,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily:
                                              FontFamilyConfig.outfitRegular,
                                          fontSize: FontSizeConfig.body1Text,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  videoGeneratorController.deselectAllAvatars();
                                  videoGeneratorController
                                      .toggleAvatarSelection(index - 1);
                                  videoGeneratorController
                                      .selectImage(index - 1);
                                },
                                child: Obx(() {
                                  final isSelected = videoGeneratorController
                                      .selectedAvatars[index - 1];
                                  return Container(
                                    width: SizeConfig.width98,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.borderRadius10),
                                      border: Border.all(
                                        color: isSelected
                                            ? ColorConfig.primaryColor
                                            : Colors.transparent,
                                        width: SizeConfig.width03,
                                      ),
                                    ),
                                    child: Image(
                                      image: AssetImage(videoGeneratorController
                                          .selectAvtarImage[index - 1]),
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                }),
                              );
                            }
                          },
                          itemCount:
                              videoGeneratorController.selectAvtarImage.length +
                                  1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: SizeConfig.height16),
            Padding(
              padding: const EdgeInsets.only(
                  left: SizeConfig.padding16,
                  right: SizeConfig.padding16,
                  bottom: SizeConfig.padding16),
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
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius52),
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

Future<void> _pickImage() async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
  } else {}
}

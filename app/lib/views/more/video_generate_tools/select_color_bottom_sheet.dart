import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/controller/video_generator_controller.dart';
import '../../../config/color_config.dart';
import '../../../config/font_family_config.dart';
import '../../../config/font_size_config.dart';
import '../../../config/image_config.dart';
import '../../../config/size_config.dart';
import '../../../config/string_config.dart';

selectTextColorBottomSheet(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.only(top: SizeConfig.padding10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: SizeConfig.padding16, right: SizeConfig.padding16, top: SizeConfig.padding16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                child: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: videoGeneratorController.selectedColor2,
                    onColorChanged: (Color value) {
                      videoGeneratorController.selectedColor2 = value;
                    },
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
        ),
      );
    },
  );
}
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/color_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/size_config.dart';
import 'package:prime_ai_flutter_ui_kit/controller/video_generator_controller.dart';

import '../../../../config/font_family_config.dart';
import '../../../../config/font_size_config.dart';
import '../../../../config/string_config.dart';

class SelectColorTabView extends StatefulWidget {
  const SelectColorTabView({Key? key}) : super(key: key);

  @override
  State<SelectColorTabView> createState() => _SelectColorTabViewState();
}

class _SelectColorTabViewState extends State<SelectColorTabView> {
  VideoGeneratorController videoGeneratorController = Get.put(VideoGeneratorController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: SizeConfig.padding20, left: SizeConfig.padding20, right: SizeConfig.padding20, bottom: SizeConfig.padding15),
            child: SingleChildScrollView(
              child: Container(
                height: SizeConfig.height585,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.borderRadius10),
                  border: Border.all(
                    color: ColorConfig.backgroundColor,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(SizeConfig.padding10),
                  child: Column(
                    children: [
                      ColorPicker(
                        pickerColor: videoGeneratorController.selectedColor,
                        onColorChanged: (Color value) {
                          setState(() {
                            videoGeneratorController.selectedColor = value;
                            videoGeneratorController.selectedBgImageIndex = -1;
                          });
                        },
                      ),
                      const SizedBox(
                        height: SizeConfig.height10,
                      ),
                      const Divider(
                        color: ColorConfig.backgroundColor,
                        height: SizeConfig.height20,
                      ),
                      const SizedBox(
                        height: SizeConfig.height10,
                      ),
                      GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          mainAxisExtent: SizeConfig.height36,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 19,
                        ),
                        itemCount: 12,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            width: SizeConfig.width36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius04),
                              color: videoGeneratorController.colorList[index],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: SizeConfig.padding20, right: SizeConfig.padding20, bottom: SizeConfig.padding10),
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
    );
  }
}

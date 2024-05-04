// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prime_ai_flutter_ui_kit/controller/video_generator_controller.dart';

import '../../../../config/color_config.dart';
import '../../../../config/font_family_config.dart';
import '../../../../config/font_size_config.dart';
import '../../../../config/image_config.dart';
import '../../../../config/size_config.dart';
import '../../../../config/string_config.dart';

class SelectImagesTabView extends StatefulWidget {
  const SelectImagesTabView({Key? key}) : super(key: key);

  @override
  State<SelectImagesTabView> createState() => _SelectImagesTabViewState();
}

class _SelectImagesTabViewState extends State<SelectImagesTabView> {
  VideoGeneratorController videoGeneratorController = Get.put(VideoGeneratorController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: SizeConfig.padding20, right: SizeConfig.padding20, top: SizeConfig.padding20, bottom: SizeConfig.padding20),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: SizeConfig.mainAxisSize20,
                crossAxisSpacing: SizeConfig.mainAxisSize20,
                mainAxisExtent: SizeConfig.height94,
              ),
              itemBuilder: (context, index) {
                bool isSelected = videoGeneratorController.selectedBgImageIndex == index;
                if (index == 0) {
                  return GestureDetector(
                    onTap: () {
                      _pickImage();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(SizeConfig.borderRadius10),
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
                            StringConfig.uploadImage,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamilyConfig.outfitRegular,
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
                      setState(() {
                        if (isSelected) {
                          videoGeneratorController.selectedBgImageIndex = -1;
                        } else {
                          videoGeneratorController.selectedBgImageIndex = index;
                        }
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: SizeConfig.width158,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                          ),
                          child: Image(
                            image: AssetImage(videoGeneratorController.selectBackgroundImage[index]),
                            fit: BoxFit.fill,
                          ),
                        ),
                        if (isSelected)
                          Container(
                            alignment: Alignment.topRight,
                            width: SizeConfig.width158,
                            padding: const EdgeInsets.only(top: SizeConfig.padding04, right: SizeConfig.padding04),
                            decoration: BoxDecoration(
                              color: ColorConfig.containerLightColor.withOpacity(.8),
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                            ),
                            child: const Image(
                              image: AssetImage(ImageConfig.checkImage),
                              width: SizeConfig.width22,
                            ),
                          ),
                      ],
                    ),
                  );
                }
              },
              itemCount: 12,
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

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {

    } else {

    }
  }
}

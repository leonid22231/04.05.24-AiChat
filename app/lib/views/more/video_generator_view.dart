// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/font_family_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/font_size_config.dart';
import 'package:prime_ai_flutter_ui_kit/controller/video_generator_controller.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';
import '../../config/color_config.dart';
import '../../config/image_config.dart';
import '../../config/size_config.dart';
import '../../config/string_config.dart';
import '../widget/common_app_bar.dart';

class VideoGeneratorView extends StatelessWidget {
  VideoGeneratorView({Key? key}) : super(key: key);

  VideoGeneratorController videoGeneratorController = Get.put(VideoGeneratorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundWhiteColor,
      appBar: CommonAppBar(
        backgroundColor: ColorConfig.backgroundWhiteColor,
        centerTitle: true,
        title: StringConfig.videoGenerator,
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
        padding: const EdgeInsets.only(left: SizeConfig.padding20, top: SizeConfig.padding10, right: SizeConfig.padding20, bottom: SizeConfig.padding20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.videoCreateView);
                },
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.height133,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SizeConfig.borderRadius10),
                    color: ColorConfig.backgroundColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageConfig.addVideo,
                        width: SizeConfig.width22,
                      ),
                      const SizedBox(
                        height: SizeConfig.height12,
                      ),
                      const Text(
                        StringConfig.startBlank,
                        style: TextStyle(
                          fontFamily: FontFamilyConfig.outfitRegular,
                          fontWeight: FontWeight.w400,
                          fontSize: FontSizeConfig.heading4Text,
                        ),
                      ),
                      const SizedBox(
                        height: SizeConfig.height04,
                      ),
                      const Text(
                        StringConfig.getStartedWithEmptyCanvas,
                        style: TextStyle(
                          fontFamily: FontFamilyConfig.outfitRegular,
                          fontWeight: FontWeight.w400,
                          fontSize: FontSizeConfig.body2Text,
                          color: ColorConfig.textLightColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height28,
              ),
              const Text(
                StringConfig.startWithTemplates,
                style: TextStyle(
                  fontFamily: FontFamilyConfig.outfitMedium,
                  fontWeight: FontWeight.w500,
                  fontSize: FontSizeConfig.heading3Text,
                ),
              ),
              const SizedBox(
                height: SizeConfig.height15,
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: SizeConfig.axisCountSize02,
                  crossAxisSpacing: 30,
                  mainAxisExtent: SizeConfig.mainAxisSize130,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.width158,
                        height: SizeConfig.height84,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                          image: DecorationImage(
                            image: AssetImage(
                              videoGeneratorController.templateListImage[index],
                            )
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: SizeConfig.height06,
                      ),
                      Text(
                        videoGeneratorController.templatesListName[index],
                        style: const TextStyle(
                          fontFamily: FontFamilyConfig.outfitRegular,
                          fontWeight: FontWeight.w400,
                          fontSize: FontSizeConfig.heading4Text,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

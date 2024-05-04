// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/color_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/font_family_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/font_size_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/size_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/string_config.dart';
import 'package:prime_ai_flutter_ui_kit/controller/on_boarding_controller.dart';
import 'package:prime_ai_flutter_ui_kit/model/on_boarding_model.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({Key? key}) : super(key: key);

  OnBoardingController onBoardingController = Get.put(OnBoardingController());
  PageController pageController = Get.put(PageController(initialPage: 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundWhiteColor,
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.only(
            left: SizeConfig.padding20,
            right: SizeConfig.padding20,
            top: SizeConfig.padding50,
            bottom: SizeConfig.padding20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.height500,
                child: PageView.builder(
                  itemCount: onBoardingModelList.length,
                  controller: pageController,
                  onPageChanged: (value) {
                    onBoardingController.pageViewIndex.value = value;
                  },
                  itemBuilder: (context, index) {
                    index = onBoardingController.pageViewIndex.value;
                    return AnimatedBuilder(
                      animation: pageController,
                      builder: (context, child) {
                        double value = 1.0;
                        if (pageController.position.haveDimensions) {
                          value = pageController.page! - index;
                          value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
                        }
                        return Opacity(
                          opacity: value,
                          child: Transform.scale(
                            scale: value,
                            child: child,
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image:
                                AssetImage(onBoardingModelList[index].image ?? ""),
                            width: SizeConfig.width310,
                            height: SizeConfig.height323,
                          ),
                          const SizedBox(
                            height: SizeConfig.height40,
                          ),
                          Text(
                            onBoardingModelList[index].title ?? "",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: FontSizeConfig.heading1Text,
                              fontFamily: FontFamilyConfig.outfitSemiBold,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height16,
                          ),
                          Text(
                            onBoardingModelList[index].description ?? "",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: FontSizeConfig.heading4Text,
                              fontFamily: FontFamilyConfig.outfitRegular,
                              fontWeight: FontWeight.w400,
                              color: ColorConfig.textMediumColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: SizeConfig.height50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onBoardingModelList.length,
                  (int index) => buildDot(index: index),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height65,
              ),
              if (onBoardingController.pageViewIndex.value < onBoardingModelList.length - 1)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: SizeConfig.height52,
                        child: ElevatedButton(
                          onPressed: () {
                            if (onBoardingController.pageViewIndex.value == 0) {
                              pageController.jumpToPage(onBoardingModelList.length - 1);
                            } else if (onBoardingController.pageViewIndex.value == 1) {
                              pageController.jumpToPage(onBoardingModelList.length - 1);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: ColorConfig.backgroundLightColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius52),
                            ),
                          ),
                          child: const Text(
                            StringConfig.buttonSkip,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: FontFamilyConfig.outfitSemiBold,
                              fontSize: FontSizeConfig.heading3Text,
                              color: ColorConfig.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: SizeConfig.width16),
                    Expanded(
                      child: SizedBox(
                        height: SizeConfig.height52,
                        child: ElevatedButton(
                          onPressed: () {
                            if (onBoardingController.pageViewIndex.value < onBoardingModelList.length - 1) {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: ColorConfig.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius52),
                            ),
                          ),
                          child: const Text(
                            StringConfig.buttonNext,
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
              if (onBoardingController.pageViewIndex.value == onBoardingModelList.length - 1)
                SizedBox(
                  height: SizeConfig.height52,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.signInView);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: ColorConfig.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SizeConfig.borderRadius52),
                      ),
                    ),
                    child: const Text(
                      StringConfig.buttonGetStarted,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: FontFamilyConfig.outfitSemiBold,
                        fontSize: FontSizeConfig.heading3Text,
                        color: ColorConfig.textWhiteColor,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: SizeConfig.margin02point),
      height: onBoardingController.pageViewIndex.value == index
          ? SizeConfig.height06
          : SizeConfig.height06,
      width: onBoardingController.pageViewIndex.value == index
          ? SizeConfig.width20
          : SizeConfig.width06,
      decoration: BoxDecoration(
        color: onBoardingController.pageViewIndex.value == index
            ? ColorConfig.primaryColor
            : ColorConfig.textLightColor,
        borderRadius: BorderRadius.circular(SizeConfig.borderRadius20),
      ),
    );
  }
}

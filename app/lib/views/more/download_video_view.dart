// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/controller/more_controller.dart';
import 'package:prime_ai_flutter_ui_kit/controller/video_generator_controller.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../config/color_config.dart';
import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';
import '../../config/image_config.dart';
import '../../config/size_config.dart';
import '../../config/string_config.dart';
import '../../controller/bottom_navigation_controller.dart';
import '../widget/common_app_bar.dart';

class DownloadVideoView extends StatefulWidget {
  const DownloadVideoView({Key? key}) : super(key: key);

  @override
  State<DownloadVideoView> createState() => _DownloadVideoViewState();
}

class _DownloadVideoViewState extends State<DownloadVideoView> with SingleTickerProviderStateMixin {
  BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());

  MoreController moreController = Get.put(MoreController());

  void goToTab(int tabIndex) {
    bottomNavigationController.changePage(tabIndex);
    Get.toNamed(AppRoutes.bottomBarView);
  }

  void _togglePlayPause() {
    if (mounted) {
      setState(() {
        moreController.isPlaying = !moreController.isPlaying;
        if (moreController.isPlaying) {
          _startAnimation();
        } else {
          moreController.controller.stop();
        }
      });
    }
  }

  void _startAnimation() {
    moreController.controller.forward(from: moreController.loaderPosition);
    moreController.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          moreController.loaderPosition = 0.0;
        });
        _togglePlayPause();
      }
    });

    Timer(const Duration(minutes: 1), () {
      if (moreController.isPlaying && mounted) {
        _togglePlayPause();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    moreController.loaderPosition = 0.0;
    moreController.controller = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 1),
    )..addListener(() {
      setState(() {
        moreController.loaderPosition = moreController.controller.value;
      });
    })..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _togglePlayPause();
        setState(() {
          moreController.isPlaying = false;
        });
      }
    });
  }

  String _formatDuration(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    moreController.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Duration totalDuration = const Duration(minutes: 1);
    return Scaffold(
      backgroundColor: ColorConfig.backgroundWhiteColor,
      appBar: CommonAppBar(
        backgroundColor: ColorConfig.backgroundWhiteColor,
        centerTitle: true,
        toolBarHeight: SizeConfig.height70,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: SizeConfig.padding10),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return customDiscardVideoDialouge();
                  },
                );
              },
              child: Image.asset(
                ImageConfig.closeButton,
                width: SizeConfig.width22,
              ),
            ),
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: SizeConfig.padding20,left: SizeConfig.padding20),
              child: GestureDetector(
                onTap: () async {
                  await showTopModalSheet<String?>(context, SelectVideoPixelTopSheet());
                },
                child: Container(
                  width: SizeConfig.height68,
                  height: SizeConfig.height30,
                  padding: const EdgeInsets.only(left: SizeConfig.padding08, right: SizeConfig.padding08),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SizeConfig.borderRadius04),
                    color: ColorConfig.backgroundColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        StringConfig.pixel720,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: FontFamilyConfig.outfitMedium,
                          fontSize: FontSizeConfig.body1Text,
                          color: ColorConfig.textColor,
                        ),
                      ),
                      const SizedBox(
                        width: SizeConfig.width04,
                      ),
                      Image.asset(
                        ImageConfig.dropdownArrow,
                        width: SizeConfig.width14,
                        color: ColorConfig.textColor,
                      ),
                    ],
                  ),
                ),
              )
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: SizeConfig.padding20, right: SizeConfig.padding20, bottom: SizeConfig.padding20),
        child: Column(
          children: [
            const SizedBox(
              height: SizeConfig.height52,
            ),
            Center(
              child: Image.asset(
                ImageConfig.videoComplete,
                width: SizeConfig.width56,
              ),
            ),
            const SizedBox(
              height: SizeConfig.height24,
            ),
            const Text(
              StringConfig.yourVideoIsComplete,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: FontFamilyConfig.outfitMedium,
                fontSize: FontSizeConfig.heading4Text,
                color: ColorConfig.textColor,
              ),
            ),
            const SizedBox(
              height: SizeConfig.height16,
            ),
            SizedBox(
              height: SizeConfig.height209,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    ImageConfig.halfScreenVideo,
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                  ),
                  GestureDetector(
                    onTap: () {
                      _togglePlayPause();
                    },
                    child: Image.asset(
                      moreController.isPlaying ? ImageConfig.pauseBg : ImageConfig.playBg,
                      width: SizeConfig.width29,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 4,
                    child: Container(
                      width: SizeConfig.width44,
                      height: SizeConfig.height22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(SizeConfig.borderRadius04),
                        color: ColorConfig.containerColor,
                      ),
                      child: Center(
                        child: Text(
                          _formatDuration(
                            Duration(seconds: (moreController.loaderPosition * totalDuration.inSeconds).round()),
                          ),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamilyConfig.outfitRegular,
                            fontSize: FontSizeConfig.body2Text,
                            color: ColorConfig.textWhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Theme(
              data: ThemeData(
                sliderTheme: const SliderThemeData(
                  inactiveTrackColor: ColorConfig.primaryColor,
                  disabledActiveTrackColor: ColorConfig.primaryColor,
                  disabledThumbColor: ColorConfig.primaryColor,
                  disabledActiveTickMarkColor: ColorConfig.primaryColor,
                  activeTrackColor: ColorConfig.backgroundLightColor,
                  disabledInactiveTrackColor: ColorConfig.backgroundLightColor,
                ),
              ),
              child: Slider(
                autofocus: true,
                activeColor: ColorConfig.primaryColor,
                inactiveColor: ColorConfig.backgroundLightColor,
                secondaryActiveColor: ColorConfig.primaryColor,
                value: moreController.loaderPosition,
                min: 0.0,
                max: 1.0,
                onChanged: moreController.isPlaying
                    ? null
                    : (newValue) {
                  setState(() {
                    moreController.loaderPosition = newValue;
                  });
                  if (newValue == 0.0) {
                    moreController.controller.stop();
                    _togglePlayPause();
                  }
                },
                onChangeEnd: (newValue) {
                  if (newValue == 1.0) {
                    _togglePlayPause();
                    setState(() {
                      moreController.loaderPosition = 0.0;
                    });
                  }
                },
              ),
            ),
            const SizedBox(
              height: SizeConfig.height32,
            ),
            const Text(
              StringConfig.videoViewDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: FontFamilyConfig.outfitRegular,
                fontSize: FontSizeConfig.body1Text,
                color: ColorConfig.textMediumColor,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            left: SizeConfig.padding20,
            right: SizeConfig.padding20,
            bottom: SizeConfig.padding20),
        child: SizedBox(
          height: SizeConfig.height52,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              goToTab(1);
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: ColorConfig.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeConfig.borderRadius52),
              ),
            ),
            child: const Text(
              StringConfig.buttonDownloadNow,
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
    );
  }

  Material customDiscardVideoDialouge() {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.only(left: SizeConfig.padding20, right: SizeConfig.padding20, bottom: SizeConfig.padding20, top: SizeConfig.padding20),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: SizeConfig.width335,
            height: SizeConfig.height204,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      ImageConfig.deleteChatRound,
                      width: SizeConfig.width29,
                    ),
                    const SizedBox(
                      width: SizeConfig.width08,
                    ),
                    const Expanded(
                      child: Text(
                        StringConfig.discardVideo,
                        style: TextStyle(
                          fontSize: FontSizeConfig.heading4Text,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitMedium,
                          color: ColorConfig.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: ColorConfig.dividerColor,
                  height: SizeConfig.height30,
                ),
                const SizedBox(
                  height: SizeConfig.height08,
                ),
                const Text(
                  StringConfig.discardVideoDescription,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamilyConfig.outfitRegular,
                    fontSize: FontSizeConfig.heading4Text,
                    color: ColorConfig.textColor,
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: SizeConfig.height52,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: ColorConfig.backgroundLightColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius52),
                            ),
                          ),
                          child: const Text(
                            StringConfig.buttonCancel,
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
                            goToTab(1);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: ColorConfig.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius52),
                            ),
                          ),
                          child: const Text(
                            StringConfig.buttonDiscard,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class SelectVideoPixelTopSheet extends StatefulWidget {
  @override
  State<SelectVideoPixelTopSheet> createState() => _SelectVideoPixelTopSheetState();
}

class _SelectVideoPixelTopSheetState extends State<SelectVideoPixelTopSheet> {
  VideoGeneratorController videoGeneratorController = Get.put(VideoGeneratorController());

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: SizeConfig.padding20, right: SizeConfig.padding20, bottom: SizeConfig.padding25, top: SizeConfig.padding20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: SizeConfig.height40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  StringConfig.videoFileSize,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamilyConfig.outfitRegular,
                    fontSize: FontSizeConfig.body1Text,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    ImageConfig.closeButton,
                    width: SizeConfig.width16,
                  ),
                ),
              ],
            ),
            const Divider(
              height: SizeConfig.height34,
            ),
            const SizedBox(
              height: SizeConfig.height10,
            ),
            const Text(
              StringConfig.resolution,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: FontFamilyConfig.outfitMedium,
                fontSize: FontSizeConfig.heading4Text,
              ),
            ),
            SfSlider(
              min: 0,
              max: 100,
              value: videoGeneratorController.value,
              activeColor: ColorConfig.primaryColor,
              inactiveColor: ColorConfig.backgroundLightColor,
              showLabels: false,
              enableTooltip: false,
              onChanged: (dynamic value){
                setState(() {
                  videoGeneratorController.value = value;
                });
              },
            ),
            const SizedBox(
              height: SizeConfig.height15,
              child: Padding(
                padding: EdgeInsets.only(left: SizeConfig.padding12, right: SizeConfig.padding12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringConfig.resolution480p,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamilyConfig.outfitRegular,
                        fontSize: FontSizeConfig.body2Text,
                        color: ColorConfig.textLightColor,
                      ),
                    ),
                    Text(
                      StringConfig.resolution640p,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamilyConfig.outfitRegular,
                        fontSize: FontSizeConfig.body2Text,
                        color: ColorConfig.textLightColor,
                      ),
                    ),
                    Text(
                      StringConfig.resolution720p,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamilyConfig.outfitRegular,
                        fontSize: FontSizeConfig.body2Text,
                        color: ColorConfig.textLightColor,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          StringConfig.resolution1080p,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamilyConfig.outfitRegular,
                            fontSize: FontSizeConfig.body2Text,
                            color: ColorConfig.textLightColor,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.width02,
                        ),
                        Image(
                          image: AssetImage(ImageConfig.goldMembership),
                          width: SizeConfig.width12,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          StringConfig.resolution1440p,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamilyConfig.outfitRegular,
                            fontSize: FontSizeConfig.body2Text,
                            color: ColorConfig.textLightColor,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.width02,
                        ),
                        Image(
                          image: AssetImage(ImageConfig.goldMembership),
                          width: SizeConfig.width12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: SizeConfig.height20,
            ),
            const Text(
              StringConfig.quality,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: FontFamilyConfig.outfitMedium,
                fontSize: FontSizeConfig.heading4Text,
              ),
            ),
            SfSlider(
              min: 0,
              max: 90,
              value: videoGeneratorController.value2,
              activeColor: ColorConfig.primaryColor,
              inactiveColor: ColorConfig.backgroundLightColor,
              showLabels: false,
              enableTooltip: false,
              onChanged: (dynamic value){
                setState(() {
                  videoGeneratorController.value2 = value;
                });
              },
            ),
            const SizedBox(
              height: SizeConfig.height15,
              child: Padding(
                padding: EdgeInsets.only(left: SizeConfig.padding12, right: SizeConfig.padding12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringConfig.low,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamilyConfig.outfitRegular,
                        fontSize: FontSizeConfig.body2Text,
                        color: ColorConfig.textLightColor,
                      ),
                    ),
                    Text(
                      StringConfig.medium,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamilyConfig.outfitRegular,
                        fontSize: FontSizeConfig.body2Text,
                        color: ColorConfig.textLightColor,
                      ),
                    ),
                    Text(
                      StringConfig.high,
                      style: TextStyle(
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
          ],
        ),
      ),
    );
  }
}
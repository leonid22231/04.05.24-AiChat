// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/color_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/size_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/string_config.dart';
import 'package:prime_ai_flutter_ui_kit/controller/history_controller.dart';
import 'package:prime_ai_flutter_ui_kit/controller/language_controller.dart';

import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';
import '../../config/image_config.dart';

class HistoryFullVideoView extends StatefulWidget {
  const HistoryFullVideoView({Key? key}) : super(key: key);

  @override
  State<HistoryFullVideoView> createState() => _HistoryFullVideoViewState();
}

class _HistoryFullVideoViewState extends State<HistoryFullVideoView> {
  HistoryController historyController = Get.put(HistoryController());
  final LanguageController languageController = Get.put(LanguageController());

  void _toggleFullScreen() {
    setState(() {
      historyController.isFullScreen = !historyController.isFullScreen;
    });
  }

  void _togglePlayPause() {
    setState(() {
      historyController.isPlaying = !historyController.isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    languageController.loadSelectedLanguage();
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: double.infinity,
            child: Center(
              child: Stack(
                children: [
                  Image.asset(
                    historyController.isFullScreen
                        ? ImageConfig.fullVideoImage
                        : ImageConfig.halfScreenVideo,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 6,
                    right: 6,
                    child: Container(
                      width: SizeConfig.width44,
                      height: SizeConfig.height22,
                      padding: const EdgeInsets.all(SizeConfig.padding06),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.borderRadius04),
                        color: ColorConfig.containerColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                historyController.isLike = true;
                                historyController.isDislike = false;
                              });
                            },
                            child: Image(
                              image: const AssetImage(ImageConfig.likeChat),
                              width: SizeConfig.width13,
                              color: historyController.isLike
                                  ? ColorConfig.primaryColor
                                  : ColorConfig.backgroundColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                historyController.isLike = false;
                                historyController.isDislike = true;
                              });
                            },
                            child: Image(
                              image: const AssetImage(ImageConfig.dislikeChat),
                              width: SizeConfig.width13,
                              color: historyController.isDislike
                                  ? Colors.red
                                  : ColorConfig.backgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.only(
                  left: languageController.arb.value ? 0 : SizeConfig.padding20,
                  right:
                      languageController.arb.value ? SizeConfig.padding20 : 0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: SizeConfig.padding45),
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
                  const SizedBox(
                    width: SizeConfig.width47,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: SizeConfig.padding45),
                    child: Text(
                      StringConfig.futureOfArtist,
                      style: TextStyle(
                        fontSize: FontSizeConfig.heading2Text,
                        fontFamily: FontFamilyConfig.outfitMedium,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: SizeConfig.height87,
        padding: const EdgeInsets.only(
            right: SizeConfig.padding12,
            left: SizeConfig.padding12,
            top: SizeConfig.padding16),
        color: ColorConfig.backgroundWhiteColor,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  StringConfig.videoTiming1,
                  style: TextStyle(
                    fontSize: FontSizeConfig.body2Text,
                    fontFamily: FontFamilyConfig.outfitRegular,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Image.asset(
                  ImageConfig.videoSlider,
                  width: SizeConfig.width264,
                ),
                const Text(
                  StringConfig.videoTiming2,
                  style: TextStyle(
                    fontSize: FontSizeConfig.body2Text,
                    fontFamily: FontFamilyConfig.outfitRegular,
                    fontWeight: FontWeight.w400,
                    color: ColorConfig.textLightColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: SizeConfig.height20,
            ),
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageConfig.rewind10Second,
                      width: SizeConfig.width22,
                    ),
                    const SizedBox(
                      width: SizeConfig.width24,
                    ),
                    GestureDetector(
                      onTap: () {
                        _togglePlayPause();
                      },
                      child: Image.asset(
                        historyController.isPlaying
                            ? ImageConfig.pauseImage
                            : ImageConfig.videoPlayButton,
                        width: SizeConfig.width22,
                        color: ColorConfig.textColor,
                      ),
                    ),
                    const SizedBox(
                      width: SizeConfig.width24,
                    ),
                    Image.asset(
                      ImageConfig.rewind10SecondForward,
                      width: SizeConfig.width22,
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      _toggleFullScreen();
                    },
                    child: Image.asset(
                      historyController.isFullScreen
                          ? ImageConfig.fullScreenIcon
                          : ImageConfig.fullScreenVideo,
                      width: SizeConfig.width22,
                      color: ColorConfig.textColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

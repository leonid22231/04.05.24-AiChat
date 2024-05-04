// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/controller/video_generator_controller.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';
import 'package:prime_ai_flutter_ui_kit/views/more/video_generate_tools/select_avtar_bottom_sheet.dart';
import 'package:prime_ai_flutter_ui_kit/views/more/video_generate_tools/select_framing_bottom_sheet.dart';
import 'package:prime_ai_flutter_ui_kit/views/more/video_generate_tools/select_language_bottom_sheet.dart';
import 'package:prime_ai_flutter_ui_kit/views/more/video_generate_tools/select_voice_bottom_sheet.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:super_tooltip/super_tooltip.dart';
import '../../config/color_config.dart';
import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';
import '../../config/image_config.dart';
import '../../config/size_config.dart';
import '../../config/string_config.dart';
import '../widget/common_app_bar.dart';

class VideoCreateView extends StatefulWidget {
  const VideoCreateView({Key? key}) : super(key: key);

  @override
  State<VideoCreateView> createState() => _VideoCreateViewState();
}

class _VideoCreateViewState extends State<VideoCreateView>
    with SingleTickerProviderStateMixin {
  VideoGeneratorController videoGeneratorController =
      Get.put(VideoGeneratorController());

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void _updateCharacterCount(String text) {
    setState(() {
      videoGeneratorController.characterCount = text.length;
    });
  }

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.playlistFinished.listen((finished) {
      setState(() {
        videoGeneratorController.sliderValue = 0.0;
      });
    });
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      final currentPosition =
          assetsAudioPlayer.currentPosition.value.inSeconds.toDouble();
      if (currentPosition >= 0 &&
          currentPosition <=
              (assetsAudioPlayer.current.valueOrNull?.audio.duration.inSeconds
                      .toDouble() ??
                  0.0)) {
        setState(() {
          audioPosition = currentPosition;
        });
      }
    });
    videoGeneratorController.drawerItems.clear();
    videoGeneratorController.sceneNumber = 2;
  }

  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  double audioPosition = 0.0;

  Future<void> _playAudio() async {
    if (videoGeneratorController.audioFilePath != null) {
      if (assetsAudioPlayer.isPlaying.value) {
        await assetsAudioPlayer.pause();
      } else {
        await assetsAudioPlayer.open(
          Audio.file(videoGeneratorController.audioFilePath!),
          autoStart: true,
        );
      }
    }
  }

  void changeTextColor(Color color) {
    setState(() {
      videoGeneratorController.selectedColor2 = color;
    });
  }

  Future<void> _pickAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );

    if (result != null) {
      setState(() {
        videoGeneratorController.audioFilePath = result.files.single.path;
        videoGeneratorController.sliderValue = 0.0;
      });
    }
  }

  void toggleTextField() {
    setState(() {
      videoGeneratorController.isTextFieldVisible =
          !videoGeneratorController.isTextFieldVisible;
    });
  }

  void toggleStickerView() {
    setState(() {
      videoGeneratorController.showStickerView =
          !videoGeneratorController.showStickerView;
      videoGeneratorController.isTextFieldVisible =
          !videoGeneratorController.isTextFieldVisible;
    });
  }

  void resetContainerSize() {
    setState(() {
      videoGeneratorController.containerWidth = 100;
      videoGeneratorController.containerHeight = 40;
    });
  }

  @override
  void dispose() {
    videoGeneratorController.audioFilePath = null;
    videoGeneratorController.audioPlayer.dispose();
    videoGeneratorController.selectedImageIndex.value = -1;
    videoGeneratorController.selectedBgImageIndex = -1;
    videoGeneratorController.deselectAllAvatars();
    videoGeneratorController.selectImage(-1);
    super.dispose();
  }

  void addUpperContainer() {
    setState(() {
      videoGeneratorController.drawerItems.add(
        Column(
          children: [
            Container(
              width: SizeConfig.width115,
              height: SizeConfig.height72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                color: ColorConfig.backgroundColor,
                border: Border.all(
                  color: ColorConfig.primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: SizeConfig.height06,
            ),
            Text(
              StringConfig.sceneNumber +
                  videoGeneratorController.sceneNumber.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: FontFamilyConfig.outfitSemiBold,
                fontSize: FontSizeConfig.body2Text,
              ),
            ),
            const SizedBox(
              height: SizeConfig.height16,
            ),
          ],
        ),
      );
      videoGeneratorController.sceneNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedFramingSize = videoGeneratorController
        .selectFramingSize[videoGeneratorController.selectedFramingSizeIndex];
    final imageSize =
        videoGeneratorController.sizeMappings[selectedFramingSize] ??
            const Size(335.0, 306.0);
    return Scaffold(
      key: scaffoldKey,
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
      drawer: Drawer(
        width: SizeConfig.width139,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: SizeConfig.padding20),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        width: SizeConfig.width115,
                        height: SizeConfig.height72,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(SizeConfig.borderRadius08),
                          color: ColorConfig.backgroundColor,
                          border: Border.all(
                            color: ColorConfig.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: SizeConfig.height06,
                      ),
                      const Text(
                        StringConfig.scene1,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: FontFamilyConfig.outfitSemiBold,
                          fontSize: FontSizeConfig.body2Text,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  ...videoGeneratorController.drawerItems,
                  GestureDetector(
                    onTap: addUpperContainer,
                    child: Container(
                      width: SizeConfig.width115,
                      height: SizeConfig.height72,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.borderRadius08),
                        color: ColorConfig.backgroundLightColor,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: SizeConfig.width16,
                          color: ColorConfig.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: SizeConfig.padding20,
            top: SizeConfig.padding10,
            right: SizeConfig.padding20,
            bottom: SizeConfig.padding20),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Obx(() {
                final selectedImageIndex =
                    videoGeneratorController.selectedImageIndex.value;
                final selectedBgImageIndex =
                    videoGeneratorController.selectedBgImageIndex;
                return Padding(
                  padding: const EdgeInsets.only(bottom: SizeConfig.padding60),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: SizeConfig.height306,
                            color: ColorConfig.backgroundColor,
                            child: Center(
                              child: Stack(
                                children: [
                                  if (selectedBgImageIndex != -1 ||
                                      // ignore: unnecessary_null_comparison
                                      videoGeneratorController.selectedColor !=
                                          null)
                                    Container(
                                      height: imageSize.height,
                                      width: imageSize.width,
                                      decoration: BoxDecoration(
                                        image: selectedBgImageIndex != -1
                                            ? DecorationImage(
                                                image: AssetImage(
                                                  videoGeneratorController
                                                          .selectBackgroundImage[
                                                      selectedBgImageIndex],
                                                ),
                                                fit: BoxFit.cover,
                                                filterQuality:
                                                    FilterQuality.high,
                                              )
                                            : null,
                                        color: videoGeneratorController
                                            .selectedColor,
                                      ),
                                    ),
                                  if (selectedImageIndex != -1)
                                    SizedBox(
                                      height: imageSize.height,
                                      width: imageSize.width,
                                      child: Image(
                                        image: AssetImage(
                                          videoGeneratorController
                                                  .selectAvtarTImage[
                                              selectedImageIndex],
                                        ),
                                        filterQuality: FilterQuality.high,
                                      ),
                                    ),
                                  if (selectedImageIndex == -1 &&
                                      selectedBgImageIndex == -1)
                                    Container(
                                      height: SizeConfig.height306,
                                      color: ColorConfig.backgroundColor,
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: videoGeneratorController.top,
                            left: videoGeneratorController.left,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                setState(() {
                                  videoGeneratorController.left +=
                                      details.delta.dx;
                                  videoGeneratorController.top +=
                                      details.delta.dy;
                                });
                              },
                              child: Visibility(
                                visible:
                                    videoGeneratorController.showStickerView,
                                child: Container(
                                  width:
                                      videoGeneratorController.containerWidth,
                                  // height: videoGeneratorController.containerHeight,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorConfig.textColor,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          resetContainerSize();
                                          setState(() {
                                            videoGeneratorController
                                                .showStickerView = false;
                                          });
                                          videoGeneratorController
                                              .textEditingController
                                              .clear();
                                        },
                                        child: Container(
                                          width: SizeConfig.width12,
                                          height: SizeConfig.height12,
                                          color: ColorConfig.textColor,
                                          child: const Center(
                                            child: Icon(Icons.close,
                                                size: SizeConfig.width09,
                                                color: ColorConfig
                                                    .backgroundWhiteColor),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: SizeConfig.padding15,
                                              right: SizeConfig.padding15),
                                          child: TextField(
                                            controller: videoGeneratorController
                                                .textEditingController,
                                            textAlignVertical:
                                                TextAlignVertical.top,
                                            textAlign: TextAlign.center,
                                            maxLines: null,
                                            cursorColor: ColorConfig.textColor,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize:
                                                  FontSizeConfig.body1Text,
                                              fontFamily: FontFamilyConfig
                                                  .outfitRegular,
                                              color: videoGeneratorController
                                                  .selectedColor2,
                                            ),
                                            decoration: InputDecoration(
                                              hintText:
                                                  StringConfig.typeAMessage,
                                              hintStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    FontSizeConfig.body2Text,
                                                fontFamily: FontFamilyConfig
                                                    .outfitRegular,
                                                color: videoGeneratorController
                                                    .selectedColor2,
                                              ),
                                              border:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor: ColorConfig
                                                  .backgroundWhiteColor,
                                              shape: const OutlineInputBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      SizeConfig
                                                          .borderRadius10),
                                                  topRight: Radius.circular(
                                                      SizeConfig
                                                          .borderRadius10),
                                                ),
                                                borderSide: BorderSide.none,
                                              ),
                                              context: context,
                                              builder: (BuildContext context) {
                                                return SizedBox(
                                                  height: SizeConfig.height500,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: SizeConfig
                                                                .padding10),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .only(
                                                              left: SizeConfig
                                                                  .padding16,
                                                              right: SizeConfig
                                                                  .padding16,
                                                              top: SizeConfig
                                                                  .padding16),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  Get.back();
                                                                },
                                                                child:
                                                                    const Image(
                                                                  image: AssetImage(
                                                                      ImageConfig
                                                                          .close),
                                                                  width: SizeConfig
                                                                      .width16,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const Divider(
                                                          height: SizeConfig
                                                              .height30,
                                                          indent: SizeConfig
                                                              .width16,
                                                          endIndent: SizeConfig
                                                              .width16,
                                                        ),
                                                        Expanded(
                                                          child:
                                                              SingleChildScrollView(
                                                            child: ColorPicker(
                                                              pickerColor:
                                                                  videoGeneratorController
                                                                      .selectedColor2,
                                                              onColorChanged:
                                                                  changeTextColor,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 16.0),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .only(
                                                              left: SizeConfig
                                                                  .padding16,
                                                              right: SizeConfig
                                                                  .padding16,
                                                              bottom: SizeConfig
                                                                  .padding16),
                                                          child: SizedBox(
                                                            height: SizeConfig
                                                                .height52,
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                ElevatedButton(
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                elevation: 0,
                                                                backgroundColor:
                                                                    ColorConfig
                                                                        .primaryColor,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          SizeConfig
                                                                              .borderRadius52),
                                                                ),
                                                              ),
                                                              child: const Text(
                                                                StringConfig
                                                                    .buttonSubmit,
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontFamily:
                                                                      FontFamilyConfig
                                                                          .outfitSemiBold,
                                                                  fontSize:
                                                                      FontSizeConfig
                                                                          .heading3Text,
                                                                  color: ColorConfig
                                                                      .textWhiteColor,
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
                                          },
                                          child: Container(
                                            width: SizeConfig.width12,
                                            height: SizeConfig.height12,
                                            color: ColorConfig.textColor,
                                            child: const Center(
                                              child: Icon(
                                                Icons.edit,
                                                size: SizeConfig.width09,
                                                color: ColorConfig
                                                    .backgroundWhiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              videoGeneratorController
                                                      .containerWidth +=
                                                  SizeConfig.width10;
                                              videoGeneratorController
                                                      .containerHeight +=
                                                  SizeConfig.height05;
                                            });
                                          },
                                          child: Container(
                                            width: SizeConfig.width12,
                                            height: SizeConfig.height12,
                                            color: ColorConfig.textColor,
                                            child: const Center(
                                              child: Icon(
                                                Icons.zoom_out_map_rounded,
                                                size: SizeConfig.width09,
                                                color: ColorConfig
                                                    .backgroundWhiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: SizeConfig.height24,
                      ),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: SizeConfig.axisCountSize05,
                          mainAxisExtent: SizeConfig.mainAxisSize65,
                        ),
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                scaffoldKey.currentState?.openDrawer();
                              } else if (index == 1) {
                                selectFramingBottomSheet(context);
                              } else if (index == 2) {
                                selectAvtarBottomSheet(context);
                              } else if (index == 3) {
                                Get.toNamed(AppRoutes.selectBackgroundView);
                              } else if (index == 4) {
                                toggleStickerView();
                              } else if (index == 5) {
                                _openFileManager();
                              } else if (index == 6) {
                                selectLanguageBottomSheet(context);
                              } else if (index == 7) {
                                _openEmojiPicker(context);
                              } else if (index == 8) {
                                selectVoiceBottomSheet(context);
                              }
                            },
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage(videoGeneratorController
                                      .videoToolsImage[index]),
                                  width: SizeConfig.width20,
                                ),
                                const SizedBox(
                                  height: SizeConfig.height10,
                                ),
                                Text(
                                  videoGeneratorController
                                      .videoToolsName[index],
                                  style: const TextStyle(
                                    fontFamily: FontFamilyConfig.outfitRegular,
                                    fontWeight: FontWeight.w400,
                                    fontSize: FontSizeConfig.body2Text,
                                    color: ColorConfig.textLightColor,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: SizeConfig.height05,
                      ),
                      if (videoGeneratorController.audioFilePath != null)
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _playAudio();
                              },
                              child: Image(
                                image: AssetImage(
                                  assetsAudioPlayer.isPlaying.value
                                      ? ImageConfig.pauseButton
                                      : ImageConfig.playButton,
                                ),
                                width: SizeConfig.width24,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: SizeConfig.height80,
                                child: Slider(
                                  activeColor: ColorConfig.primaryColor,
                                  inactiveColor: ColorConfig.backgroundLightColor,
                                  value: audioPosition.clamp(0.0, assetsAudioPlayer.current.valueOrNull?.audio.duration.inSeconds.toDouble() ?? 0.0),
                                  onChanged: (newValue) {
                                    // Update the audio position here, ensuring it's within the valid range
                                    setState(() {
                                      audioPosition = newValue.clamp(0.0, assetsAudioPlayer.current.valueOrNull?.audio.duration.inSeconds.toDouble() ?? 0.0);
                                    });
                                  },
                                  min: 0.0,
                                  max: assetsAudioPlayer.current.valueOrNull?.audio.duration.inSeconds.toDouble() ?? 0.0,
                                ),

                              ),
                            ),
                          ],
                        ),
                      const SizedBox(
                        height: SizeConfig.height20,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _pickAudio();
                            },
                            child: Container(
                              width: SizeConfig.width157,
                              height: SizeConfig.height39,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.borderRadius08),
                                color: ColorConfig.backgroundColor,
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        ImageConfig.uploadVideoAudio),
                                    width: SizeConfig.width16,
                                  ),
                                  SizedBox(
                                    width: SizeConfig.width06,
                                  ),
                                  Text(
                                    StringConfig.uploadAVideoAudio,
                                    style: TextStyle(
                                      fontSize: FontSizeConfig.body2Text,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          FontFamilyConfig.outfitRegular,
                                      color: ColorConfig.textLightColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: SizeConfig.width07,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                videoGeneratorController.controller
                                    .showTooltip();
                              },
                              child: SuperTooltip(
                                controller: videoGeneratorController.controller,
                                barrierColor: Colors.transparent,
                                borderColor: ColorConfig.textWhiteColor,
                                hasShadow: true,
                                shadowSpreadRadius: .1,
                                borderRadius: SizeConfig.borderRadius08,
                                arrowBaseWidth: SizeConfig.width10,
                                arrowLength: 9,
                                arrowTipDistance: 20,
                                content: buildStyleDropdownMenu(),
                                child: Container(
                                  width: SizeConfig.width84,
                                  height: SizeConfig.height39,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.borderRadius08),
                                    color: ColorConfig.backgroundColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Image(
                                        image: AssetImage(ImageConfig.timing),
                                        width: SizeConfig.width16,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width04,
                                      ),
                                      Text(
                                        videoGeneratorController.selectedSecond,
                                        style: const TextStyle(
                                          fontSize: FontSizeConfig.body2Text,
                                          fontWeight: FontWeight.w400,
                                          fontFamily:
                                              FontFamilyConfig.outfitRegular,
                                          color: ColorConfig.textLightColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width04,
                                      ),
                                      const Image(
                                        image: AssetImage(
                                            ImageConfig.dropdownArrow),
                                        width: SizeConfig.width14,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: SizeConfig.width07,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                await videoGeneratorController.controller2
                                    .showTooltip();
                              },
                              child: SuperTooltip(
                                controller:
                                    videoGeneratorController.controller2,
                                barrierColor: Colors.transparent,
                                borderColor: ColorConfig.textWhiteColor,
                                hasShadow: true,
                                shadowSpreadRadius: .1,
                                borderRadius: SizeConfig.borderRadius08,
                                arrowBaseWidth: SizeConfig.width10,
                                arrowLength: 9,
                                arrowTipDistance: 20,
                                content: buildDropdownMenu(),
                                child: Container(
                                  width: SizeConfig.width84,
                                  height: SizeConfig.height39,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.borderRadius08),
                                    color: ColorConfig.backgroundColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Image(
                                        image: AssetImage(ImageConfig.speed),
                                        width: SizeConfig.width16,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width04,
                                      ),
                                      Text(
                                        videoGeneratorController.selectedSpeed,
                                        style: const TextStyle(
                                          fontSize: FontSizeConfig.body2Text,
                                          fontWeight: FontWeight.w400,
                                          fontFamily:
                                              FontFamilyConfig.outfitRegular,
                                          color: ColorConfig.textLightColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width04,
                                      ),
                                      const Image(
                                        image: AssetImage(
                                            ImageConfig.dropdownArrow),
                                        width: SizeConfig.width14,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: SizeConfig.height24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            StringConfig.script,
                            style: TextStyle(
                              fontSize: FontSizeConfig.heading4Text,
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamilyConfig.outfitMedium,
                            ),
                          ),
                          Text(
                            '${videoGeneratorController.characterCount}${StringConfig.character}',
                            style: const TextStyle(
                              fontSize: FontSizeConfig.body2Text,
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamilyConfig.outfitMedium,
                              color: ColorConfig.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: SizeConfig.height18,
                      ),
                      TextFormField(
                        controller: videoGeneratorController.scriptController,
                        cursorColor: ColorConfig.primaryColor,
                        maxLines: 6,
                        onChanged: _updateCharacterCount,
                        style: const TextStyle(
                          fontFamily: FontFamilyConfig.outfitRegular,
                          fontSize: FontSizeConfig.body1Text,
                          fontWeight: FontWeight.w400,
                          color: ColorConfig.textColor,
                        ),
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.all(SizeConfig.padding16),
                          hintText: StringConfig.scriptPasteHere,
                          hintStyle: const TextStyle(
                            fontFamily: FontFamilyConfig.outfitRegular,
                            fontSize: FontSizeConfig.body1Text,
                            fontWeight: FontWeight.w400,
                            color: ColorConfig.textLightColor,
                          ),
                          filled: true,
                          fillColor: ColorConfig.backgroundColor,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius10),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SizedBox(
                height: SizeConfig.height52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return CustomVideoGenerateDialog();
                      },
                    );
                    setState(() {
                      videoGeneratorController.currentValue = 100;
                    });
                    Future.delayed(const Duration(seconds: 3), () {
                      Navigator.of(context).pop();
                      Get.toNamed(AppRoutes.downloadVideoView);
                    });
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
                    StringConfig.buttonGenerate,
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
  }

  Widget buildDropdownMenu() {
    return SizedBox(
      width: SizeConfig.width63,
      height: SizeConfig.height119,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: buildDropdownItems(),
        ),
      ),
    );
  }

  List<Widget> buildDropdownItems() {
    final dropdownItems = [
      StringConfig.speed5point,
      StringConfig.onePointZeroX,
      StringConfig.speed1point5,
      StringConfig.speed2,
      StringConfig.speed2point5,
    ];

    return List.generate(dropdownItems.length, (index) {
      return buildDropdownItem(dropdownItems[index],
          showIcon: index >= 3, index: index);
    });
  }

  Widget buildDropdownItem(String option,
      {bool showIcon = false, required int index}) {
    final isSelected = index == videoGeneratorController.selectedOptionIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          videoGeneratorController.selectedOption = option;
          videoGeneratorController.selectedOptionIndex = index;
          videoGeneratorController.selectedOptionText = option;
          videoGeneratorController.selectedSpeed = option;
          videoGeneratorController.controller2.hideTooltip();
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            vertical: SizeConfig.padding10, horizontal: SizeConfig.padding05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.borderRadius06),
          border:
              isSelected ? Border.all(color: ColorConfig.primaryColor) : null,
          color: isSelected ? ColorConfig.backgroundLightColor : null,
        ),
        child: Text(
          option,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: FontSizeConfig.body2Text,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamilyConfig.outfitRegular,
          ),
        ),
      ),
    );
  }

  Widget buildStyleDropdownMenu() {
    return SizedBox(
      width: SizeConfig.width63,
      height: SizeConfig.height119,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: buildStyleDropdownItems(),
        ),
      ),
    );
  }

  List<Widget> buildStyleDropdownItems() {
    final dropdownStyleItems = [
      StringConfig.zeroPointFiveSecond,
      StringConfig.second3,
      StringConfig.second5,
      StringConfig.second10,
      StringConfig.second15,
      StringConfig.second20,
    ];

    return List.generate(dropdownStyleItems.length, (index) {
      return buildStyleDropdownItem(dropdownStyleItems[index],
          showIcon: index >= 3, index: index);
    });
  }

  Widget buildStyleDropdownItem(String option,
      {bool showIcon = false, required int index}) {
    final isSelectedStyle =
        index == videoGeneratorController.selectedOptionIndex2;
    return GestureDetector(
      onTap: () {
        setState(() {
          videoGeneratorController.selectedOption2 = option;
          videoGeneratorController.selectedOptionIndex2 = index;
          videoGeneratorController.selectedSecond = option;
          videoGeneratorController.controller.hideTooltip();
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            vertical: SizeConfig.padding10, horizontal: SizeConfig.padding05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.borderRadius06),
          border: isSelectedStyle
              ? Border.all(color: ColorConfig.primaryColor)
              : null,
          color: isSelectedStyle ? ColorConfig.backgroundLightColor : null,
        ),
        child: Text(
          option,
          style: const TextStyle(
            fontSize: FontSizeConfig.body2Text,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamilyConfig.outfitRegular,
          ),
        ),
      ),
    );
  }

  void _openFileManager() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'wav', 'ogg'],
    );

    if (result != null) {
      // ignore: avoid_print
      print('Selected file: ${result.files.single.name}');
    }
  }

  void _openEmojiPicker(BuildContext context) {
    showModalBottomSheet(
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
        return EmojiPicker(
          onBackspacePressed: () {},
          textEditingController: videoGeneratorController.emojiController,
          config: Config(
            columns: 7,
            emojiSizeMax: 24 *
                (foundation.defaultTargetPlatform == TargetPlatform.iOS
                    ? 1.30
                    : 1.0),
            verticalSpacing: 0,
            horizontalSpacing: 0,
            gridPadding: EdgeInsets.zero,
            initCategory: Category.RECENT,
            bgColor: ColorConfig.backgroundWhiteColor,
            indicatorColor: ColorConfig.primaryColor,
            iconColor: Colors.grey,
            iconColorSelected: ColorConfig.primaryColor,
            backspaceColor: ColorConfig.primaryColor,
            skinToneDialogBgColor: ColorConfig.backgroundWhiteColor,
            skinToneIndicatorColor: Colors.grey,
            enableSkinTones: true,
            recentTabBehavior: RecentTabBehavior.RECENT,
            recentsLimit: 28,
            noRecents: const Text(
              StringConfig.noRecentEmoji,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: FontSizeConfig.heading4Text,
                fontFamily: FontFamilyConfig.outfitMedium,
                color: ColorConfig.textMediumColor,
              ),
              textAlign: TextAlign.center,
            ),
            loadingIndicator: const SizedBox.shrink(),
            tabIndicatorAnimDuration: kTabScrollDuration,
            categoryIcons: const CategoryIcons(),
            buttonMode: ButtonMode.MATERIAL,
          ),
        );
      },
    );
  }
}

// ignore: use_key_in_widget_constructors
class CustomVideoGenerateDialog extends StatelessWidget {
  VideoGeneratorController controller = Get.put(VideoGeneratorController());

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.only(
            left: SizeConfig.padding20,
            right: SizeConfig.padding20,
            bottom: SizeConfig.padding20,
            top: SizeConfig.padding20),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(SizeConfig.padding16),
            width: SizeConfig.width335,
            height: SizeConfig.height184,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(SizeConfig.borderRadius10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(ImageConfig.loader),
                  width: SizeConfig.width54,
                ),
                const SizedBox(
                  height: SizeConfig.height24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      StringConfig.generatingVideo,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamilyConfig.outfitMedium,
                        fontSize: FontSizeConfig.heading4Text,
                        color: ColorConfig.textColor,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TweenAnimationBuilder<int>(
                        tween: IntTween(begin: 1, end: 100),
                        duration: const Duration(seconds: 3),
                        builder: (context, value, child) {
                          return Text(
                            '($value%)',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamilyConfig.outfitMedium,
                              fontSize: FontSizeConfig.heading4Text,
                              color: ColorConfig.textColor,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: SizeConfig.height08,
                ),
                const Text(
                  StringConfig.generatingVideoDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamilyConfig.outfitLight,
                    fontSize: FontSizeConfig.body2Text,
                    color: ColorConfig.textMediumColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

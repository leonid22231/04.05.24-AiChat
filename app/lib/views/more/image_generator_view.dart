// ignore_for_file: must_be_immutable, unnecessary_null_comparison, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/controller/bottom_navigation_controller.dart';
import 'package:prime_ai_flutter_ui_kit/controller/image_generator_controller.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';
import 'package:super_tooltip/super_tooltip.dart';
import '../../config/color_config.dart';
import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';
import '../../config/image_config.dart';
import '../../config/size_config.dart';
import '../../config/string_config.dart';
import '../../controller/chat_controller.dart';
import '../widget/common_app_bar.dart';

class ImageGeneratorView extends StatefulWidget {
  const ImageGeneratorView({Key? key}) : super(key: key);

  @override
  State<ImageGeneratorView> createState() => _ImageGeneratorViewState();
}

class _ImageGeneratorViewState extends State<ImageGeneratorView> {
  ImageGeneratorController imageGeneratorController =
      Get.put(ImageGeneratorController());
  BottomNavigationController bottomNavigationController =
      Get.find<BottomNavigationController>();
  final _controller = SuperTooltipController();
  final _controller2 = SuperTooltipController();

  void goToTab(int tabIndex) {
    bottomNavigationController.changePage(tabIndex);
    Get.toNamed(AppRoutes.bottomBarView);
  }

  @override
  void initState() {
    super.initState();
    imageGeneratorController.initialSearchText = "";
    imageGeneratorController.imageSearchController.text =
        imageGeneratorController.initialSearchText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundWhiteColor,
      appBar: CommonAppBar(
        backgroundColor: ColorConfig.backgroundWhiteColor,
        centerTitle: true,
        title: StringConfig.imageGenerator,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: SizeConfig.padding05),
            child: GestureDetector(
              onTap: () {
                if (Get.previousRoute == null) {
                  Get.back();
                } else {
                  goToTab(1);
                }
              },
              child: Image.asset(
                ImageConfig.backArrow,
                width: SizeConfig.width24,
              ),
            ),
          ),
        ),
        actions: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: imageGeneratorController.isSearchOpen
                ? MediaQuery.of(context).size.width - 100
                : 0,
            child: imageGeneratorController.isSearchOpen
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: SizeConfig.padding08,
                      bottom: SizeConfig.padding08,
                      left: SizeConfig.padding06,
                    ),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.bottom,
                      controller: imageGeneratorController.searchController,
                      cursorColor: ColorConfig.primaryColor,
                      style: const TextStyle(
                        fontFamily: FontFamilyConfig.outfitMedium,
                        fontSize: FontSizeConfig.body1Text,
                        fontWeight: FontWeight.w500,
                        color: ColorConfig.textColor,
                      ),
                      decoration: InputDecoration(
                        hintText: StringConfig.search,
                        hintStyle: const TextStyle(
                          fontFamily: FontFamilyConfig.outfitRegular,
                          fontSize: FontSizeConfig.body1Text,
                          fontWeight: FontWeight.w400,
                          color: ColorConfig.textLightColor,
                        ),
                        filled: true,
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(SizeConfig.borderRadius08),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(SizeConfig.borderRadius08),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
          imageGeneratorController.isSearchOpen
              ? IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: ColorConfig.textColor,
                    size: SizeConfig.width20,
                  ),
                  onPressed: () {
                    setState(() {
                      imageGeneratorController.isSearchOpen = false;
                    });
                    imageGeneratorController.searchController.clear();
                  },
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      imageGeneratorController.isSearchOpen = true;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: SizeConfig.padding20,left: SizeConfig.padding20),
                    child: Image.asset(
                      ImageConfig.searchMore,
                      width: 20.0,
                    ),
                  ),
                ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: SizeConfig.padding20,
            top: SizeConfig.padding10,
            right: SizeConfig.padding20,
            bottom: SizeConfig.padding20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TextFormField(
                    controller: imageGeneratorController.imageSearchController,
                    cursorColor: ColorConfig.primaryColor,
                    style: const TextStyle(
                      fontFamily: FontFamilyConfig.outfitMedium,
                      fontSize: FontSizeConfig.heading4Text,
                      fontWeight: FontWeight.w500,
                      color: ColorConfig.textColor,
                    ),
                    focusNode: imageGeneratorController.focusNode,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.all(SizeConfig.padding16),
                      hintText: StringConfig.describeImageWhatToGenerate,
                      hintStyle: const TextStyle(
                        fontFamily: FontFamilyConfig.outfitRegular,
                        fontSize: FontSizeConfig.body1Text,
                        fontWeight: FontWeight.w400,
                        color: ColorConfig.textLightColor,
                      ),
                      filled: true,
                      fillColor: ColorConfig.backgroundColor,
                      border: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorConfig.textFieldBorderColor,
                        ),
                        borderRadius:
                            BorderRadius.circular(SizeConfig.borderRadius10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorConfig.textFieldBorderColor,
                        ),
                        borderRadius:
                            BorderRadius.circular(SizeConfig.borderRadius10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorConfig.textFieldBorderColor,
                        ),
                        borderRadius:
                            BorderRadius.circular(SizeConfig.borderRadius10),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(SizeConfig.padding15),
                        child: GestureDetector(
                          onTap: () {},
                          child: Image(
                            image: const AssetImage(ImageConfig.messageSend),
                            width: SizeConfig.width18,
                            color: imageGeneratorController.focusNode.hasFocus
                                ? ColorConfig.primaryColor
                                : (imageGeneratorController
                                        .isGenerateImageButtonPressed
                                    ? ColorConfig.primaryColor
                                    : ColorConfig.textLightColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  Container(
                    height: SizeConfig.height92,
                    padding: const EdgeInsets.only(
                        left: SizeConfig.padding16,
                        top: SizeConfig.padding14,
                        right: SizeConfig.padding16,
                        bottom: SizeConfig.padding16),
                    decoration: BoxDecoration(
                      color: ColorConfig.primaryColor,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius08),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                StringConfig.imageSize,
                                style: TextStyle(
                                  fontFamily: FontFamilyConfig.outfitMedium,
                                  fontWeight: FontWeight.w500,
                                  fontSize: FontSizeConfig.body1Text,
                                  color: ColorConfig.textWhiteColor,
                                ),
                              ),
                              const SizedBox(
                                height: SizeConfig.height06,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await _controller.showTooltip();
                                },
                                child: Container(
                                  height: SizeConfig.height36,
                                  width: SizeConfig.width140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.borderRadius04),
                                    color: ColorConfig.backgroundWhiteColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                        SizeConfig.padding10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          imageGeneratorController.selectedSize,
                                          style: imageGeneratorController
                                                      .selectedSize !=
                                                  null
                                              ? const TextStyle(
                                                  fontSize:
                                                      FontSizeConfig.body2Text,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: FontFamilyConfig
                                                      .outfitRegular,
                                                  color: ColorConfig.textColor,
                                                )
                                              : const TextStyle(
                                                  fontSize:
                                                      FontSizeConfig.body2Text,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: FontFamilyConfig
                                                      .outfitRegular,
                                                  color: ColorConfig
                                                      .textLightColor,
                                                ),
                                        ),
                                        SuperTooltip(
                                          controller: _controller,
                                          barrierColor: Colors.transparent,
                                          borderColor:
                                              ColorConfig.textWhiteColor,
                                          hasShadow: true,
                                          shadowSpreadRadius: .1,
                                          borderRadius:
                                              SizeConfig.borderRadius08,
                                          arrowBaseWidth: SizeConfig.width10,
                                          arrowLength: 9,
                                          arrowTipDistance: 20,
                                          left: 35,
                                          content: buildDropdownMenu(),
                                          child: const Image(
                                            image: AssetImage(
                                                ImageConfig.dropdownArrow),
                                            width: SizeConfig.width16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: SizeConfig.width23,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                StringConfig.imageStyle,
                                style: TextStyle(
                                  fontFamily: FontFamilyConfig.outfitMedium,
                                  fontWeight: FontWeight.w500,
                                  fontSize: FontSizeConfig.body1Text,
                                  color: ColorConfig.textWhiteColor,
                                ),
                              ),
                              const SizedBox(
                                height: SizeConfig.height06,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _controller2.showTooltip();
                                },
                                child: Container(
                                  height: SizeConfig.height36,
                                  width: SizeConfig.width140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.borderRadius04),
                                    color: ColorConfig.backgroundWhiteColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                        SizeConfig.padding10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          imageGeneratorController
                                              .selectedStyle,
                                          style: imageGeneratorController
                                                      .selectedStyle !=
                                                  null
                                              ? const TextStyle(
                                                  fontSize:
                                                      FontSizeConfig.body2Text,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: FontFamilyConfig
                                                      .outfitRegular,
                                                  color: ColorConfig.textColor,
                                                )
                                              : const TextStyle(
                                                  fontSize:
                                                      FontSizeConfig.body2Text,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: FontFamilyConfig
                                                      .outfitRegular,
                                                  color: ColorConfig
                                                      .textLightColor,
                                                ),
                                        ),
                                        SuperTooltip(
                                          controller: _controller2,
                                          barrierColor: Colors.transparent,
                                          borderColor:
                                              ColorConfig.textWhiteColor,
                                          hasShadow: true,
                                          shadowSpreadRadius: .1,
                                          borderRadius:
                                              SizeConfig.borderRadius08,
                                          arrowBaseWidth: SizeConfig.width10,
                                          arrowLength: 9,
                                          arrowTipDistance: 20,
                                          right: 15,
                                          content: buildStyleDropdownMenu(),
                                          child: const Image(
                                            image: AssetImage(
                                                ImageConfig.dropdownArrow),
                                            width: SizeConfig.width16,
                                          ),
                                        ),
                                      ],
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
                  const SizedBox(
                    height: SizeConfig.height20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.9,
                    child: ListView(
                      children:
                          imageGeneratorController.isGenerateImageButtonPressed
                              ? buildUpdatedImageContent()
                              : buildInitialImageContent(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: !imageGeneratorController.isGenerateImageButtonPressed,
        child: Padding(
          padding: const EdgeInsets.only(
              left: SizeConfig.padding20,
              right: SizeConfig.padding20,
              bottom: SizeConfig.padding20),
          child: SizedBox(
            height: SizeConfig.height52,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  imageGeneratorController.isGenerateImageButtonPressed = true;
                  imageGeneratorController.initialSearchText = "Fish";
                  imageGeneratorController.imageSearchController.text =
                      imageGeneratorController.initialSearchText;
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
                StringConfig.buttonGenerateImage,
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
      ),
    );
  }

  List<Widget> buildUpdatedImageContent() {
    return [
      SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: SizeConfig.spacingSize16,
            mainAxisSpacing: SizeConfig.spacingSize16,
            mainAxisExtent: SizeConfig.height157,
          ),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (context, builder) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  imageGeneratorController.isImagesVisibleList[builder] = true;

                  Future.delayed(const Duration(seconds: 10), () {
                    setState(() {
                      imageGeneratorController.isImagesVisibleList[builder] =
                          false;
                    });
                  });
                });
              },
              child: Container(
                width: SizeConfig.width157,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        imageGeneratorController.gridFishImages[builder]),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    if (imageGeneratorController.isImagesVisibleList[builder])
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: () {
                            final selectedOptionIndex =
                                imageGeneratorController.selectedOptionIndex;
                            final selectedOptionIndex2 =
                                imageGeneratorController.selectedOptionIndex2;
                            if (selectedOptionIndex == 3 ||
                                selectedOptionIndex == 4) {
                              if (selectedOptionIndex2 == 3 ||
                                  selectedOptionIndex2 == 4 ||
                                  selectedOptionIndex2 == 5) {
                                if (bottomNavigationController
                                    .cameFromImageGenerator.value) {
                                  Fluttertoast.showToast(
                                    msg: StringConfig.yourImageDownloadSuccess,
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                  );
                                  bottomNavigationController
                                      .cameFromImageGenerator.value = false;
                                } else {
                                  Get.toNamed(
                                    AppRoutes.upgradeToProView,
                                    arguments: {'cameFromImageGenerator': true},
                                  );
                                  bottomNavigationController
                                      .cameFromImageGenerator.value = true;
                                }
                              }
                            } else {
                              Fluttertoast.showToast(
                                msg: StringConfig.yourImageDownloadSuccess,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                              );
                            }
                          },
                          child: const Image(
                            image: AssetImage(ImageConfig.downloadImage),
                            width: SizeConfig.width22,
                          ),
                        ),
                      ),
                    if (imageGeneratorController.isImagesVisibleList[builder])
                      Positioned(
                        bottom: 4,
                        left: 4,
                        child: Container(
                          width: SizeConfig.width44,
                          height: SizeConfig.height22,
                          padding: const EdgeInsets.all(SizeConfig.padding06),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius04),
                            color: ColorConfig.containerColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CustomLikeDialog();
                                    },
                                  );
                                },
                                child: const Image(
                                  image: AssetImage(ImageConfig.likeChat),
                                  width: SizeConfig.width12,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CustomDislikeDialog();
                                    },
                                  );
                                },
                                child: const Image(
                                  image: AssetImage(ImageConfig.dislikeChat),
                                  width: SizeConfig.width12,
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
          },
        ),
      ),
    ];
  }

  List<Widget> buildInitialImageContent() {
    return [
      const Image(
        image: AssetImage(ImageConfig.aiImageGenerator),
        width: SizeConfig.width287,
        filterQuality: FilterQuality.high,
        fit: BoxFit.fill,
      ),
      const SizedBox(
        height: SizeConfig.height10,
      ),
      const Text(
        StringConfig.generateImagesDescription,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamilyConfig.outfitRegular,
          fontWeight: FontWeight.w400,
          fontSize: FontSizeConfig.heading4Text,
          color: ColorConfig.textMediumColor,
        ),
      ),
    ];
  }

  Widget buildDropdownMenu() {
    return SizedBox(
      width: SizeConfig.width115,
      height: SizeConfig.width187,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buildDropdownItems(),
      ),
    );
  }

  List<Widget> buildDropdownItems() {
    final dropdownItems = [
      StringConfig.size80,
      StringConfig.size256,
      StringConfig.size512,
      StringConfig.size1024,
      StringConfig.size1440,
    ];

    return List.generate(dropdownItems.length, (index) {
      return buildDropdownItem(dropdownItems[index],
          showIcon: index >= 3, index: index);
    });
  }

  Widget buildDropdownItem(String option,
      {bool showIcon = false, required int index}) {
    final isSelected = index == imageGeneratorController.selectedOptionIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          imageGeneratorController.selectedOption = option;
          imageGeneratorController.selectedOptionIndex = index;
          imageGeneratorController.selectedOptionText = option;
          imageGeneratorController.selectedSize = option;
          _controller.hideTooltip();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: SizeConfig.padding10, horizontal: SizeConfig.padding05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.borderRadius06),
          border:
              isSelected ? Border.all(color: ColorConfig.primaryColor) : null,
          color: isSelected ? ColorConfig.backgroundLightColor : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option,
              style: const TextStyle(
                fontSize: FontSizeConfig.body2Text,
                fontWeight: FontWeight.w400,
                fontFamily: FontFamilyConfig.outfitRegular,
              ),
            ),
            if (showIcon)
              const Image(
                image: AssetImage(ImageConfig.goldMembership),
                width: SizeConfig.width12,
                height: SizeConfig.height12,
              ),
          ],
        ),
      ),
    );
  }

  Widget buildStyleDropdownMenu() {
    return SizedBox(
      width: SizeConfig.width115,
      height: SizeConfig.height178,
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
      StringConfig.allDropdownText,
      StringConfig.popularDropdownText,
      StringConfig.movementDropdownText,
      StringConfig.themesDropdownText,
      StringConfig.techniquesDropdownText,
      StringConfig.effectDropdownText,
    ];

    return List.generate(dropdownStyleItems.length, (index) {
      return buildStyleDropdownItem(dropdownStyleItems[index],
          showIcon: index >= 3, index: index);
    });
  }

  Widget buildStyleDropdownItem(String option,
      {bool showIcon = false, required int index}) {
    final isSelectedStyle =
        index == imageGeneratorController.selectedOptionIndex2;
    return GestureDetector(
      onTap: () {
        setState(() {
          imageGeneratorController.selectedOption = option;
          imageGeneratorController.selectedOptionIndex2 = index;
          imageGeneratorController.selectedStyle = option;
          _controller2.hideTooltip();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: SizeConfig.padding10, horizontal: SizeConfig.padding05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.borderRadius06),
          border: isSelectedStyle
              ? Border.all(color: ColorConfig.primaryColor)
              : null,
          color: isSelectedStyle ? ColorConfig.backgroundLightColor : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option,
              style: const TextStyle(
                fontSize: FontSizeConfig.body2Text,
                fontWeight: FontWeight.w400,
                fontFamily: FontFamilyConfig.outfitRegular,
              ),
            ),
            if (showIcon)
              const Image(
                image: AssetImage(ImageConfig.goldMembership),
                width: SizeConfig.width12,
                height: SizeConfig.height12,
              ),
          ],
        ),
      ),
    );
  }
}

class CustomLikeDialog extends StatelessWidget {
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
            padding: const EdgeInsets.all(16.0),
            width: SizeConfig.width335,
            height: SizeConfig.height273,
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
                      ImageConfig.feedbackLike,
                      width: SizeConfig.width29,
                    ),
                    const SizedBox(
                      width: SizeConfig.width08,
                    ),
                    const Expanded(
                      child: Text(
                        StringConfig.provideAdditionalFeedback,
                        style: TextStyle(
                          fontSize: FontSizeConfig.heading4Text,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitMedium,
                          color: ColorConfig.textColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        ImageConfig.close,
                        width: SizeConfig.width16,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: ColorConfig.dividerColor,
                  height: SizeConfig.height30,
                ),
                const SizedBox(
                  height: SizeConfig.height14,
                ),
                TextField(
                  cursorColor: ColorConfig.primaryColor,
                  maxLines: 4,
                  style: const TextStyle(
                    fontFamily: FontFamilyConfig.outfitRegular,
                    fontWeight: FontWeight.w400,
                    fontSize: FontSizeConfig.body1Text,
                    color: ColorConfig.textColor,
                  ),
                  decoration: InputDecoration(
                    hintText: StringConfig.whatAboutLikeResponse,
                    hintStyle: const TextStyle(
                      fontFamily: FontFamilyConfig.outfitRegular,
                      fontWeight: FontWeight.w400,
                      fontSize: FontSizeConfig.body1Text,
                      color: ColorConfig.textLightColor,
                    ),
                    filled: true,
                    fillColor: ColorConfig.backgroundColor,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height20,
                ),
                SizedBox(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDislikeDialog extends StatefulWidget {
  @override
  State<CustomDislikeDialog> createState() => _CustomDislikeDialogState();
}

class _CustomDislikeDialogState extends State<CustomDislikeDialog> {
  ChatController controller = Get.put(ChatController());

  void toggleImage1() {
    setState(() {
      controller.isUpdatedImage4 = !controller.isUpdatedImage4;
    });
  }

  void toggleImage2() {
    setState(() {
      controller.isUpdatedImage5 = !controller.isUpdatedImage5;
    });
  }

  void toggleImage3() {
    setState(() {
      controller.isUpdatedImage6 = !controller.isUpdatedImage6;
    });
  }

  @override
  Widget build(BuildContext context) {
    AssetImage image1 = controller.isUpdatedImage4
        ? const AssetImage(ImageConfig.checkFeedback)
        : const AssetImage(ImageConfig.checkBoxSquare);
    AssetImage image2 = controller.isUpdatedImage5
        ? const AssetImage(ImageConfig.checkFeedback)
        : const AssetImage(ImageConfig.checkBoxSquare);
    AssetImage image3 = controller.isUpdatedImage6
        ? const AssetImage(ImageConfig.checkFeedback)
        : const AssetImage(ImageConfig.checkBoxSquare);
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
            padding: const EdgeInsets.all(16.0),
            width: SizeConfig.width335,
            height: SizeConfig.height362,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      ImageConfig.feedbackDislike,
                      width: SizeConfig.width29,
                    ),
                    const SizedBox(
                      width: SizeConfig.width08,
                    ),
                    const Expanded(
                      child: Text(
                        StringConfig.provideAdditionalFeedback,
                        style: TextStyle(
                          fontSize: FontSizeConfig.heading4Text,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitMedium,
                          color: ColorConfig.textColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        controller.isUpdatedImage4 = false;
                        controller.isUpdatedImage5 = false;
                        controller.isUpdatedImage6 = false;
                      },
                      child: Image.asset(
                        ImageConfig.close,
                        width: SizeConfig.width16,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: ColorConfig.dividerColor,
                  height: SizeConfig.height30,
                ),
                const SizedBox(
                  height: SizeConfig.height14,
                ),
                TextField(
                  cursorColor: ColorConfig.primaryColor,
                  maxLines: 4,
                  style: const TextStyle(
                    fontFamily: FontFamilyConfig.outfitRegular,
                    fontWeight: FontWeight.w400,
                    fontSize: FontSizeConfig.body1Text,
                    color: ColorConfig.textColor,
                  ),
                  decoration: InputDecoration(
                    hintText: StringConfig.whatAboutLikeResponse,
                    hintStyle: const TextStyle(
                      fontFamily: FontFamilyConfig.outfitRegular,
                      fontWeight: FontWeight.w400,
                      fontSize: FontSizeConfig.body1Text,
                      color: ColorConfig.textLightColor,
                    ),
                    filled: true,
                    fillColor: ColorConfig.backgroundColor,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height15,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            toggleImage1();
                          },
                          child: Image(
                            image: image1,
                            width: SizeConfig.width12,
                          ),
                        ),
                        const SizedBox(
                          width: SizeConfig.width06,
                        ),
                        const Text(
                          StringConfig.iDontLikeIt,
                          style: TextStyle(
                            fontFamily: FontFamilyConfig.outfitRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: FontSizeConfig.body1Text,
                            color: ColorConfig.textColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: SizeConfig.height10,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            toggleImage2();
                          },
                          child: Image(
                            image: image2,
                            width: SizeConfig.width12,
                          ),
                        ),
                        const SizedBox(
                          width: SizeConfig.width06,
                        ),
                        const Text(
                          StringConfig.iCantBear,
                          style: TextStyle(
                            fontFamily: FontFamilyConfig.outfitRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: FontSizeConfig.body1Text,
                            color: ColorConfig.textColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: SizeConfig.height10,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            toggleImage3();
                          },
                          child: Image(
                            image: image3,
                            width: SizeConfig.width12,
                          ),
                        ),
                        const SizedBox(
                          width: SizeConfig.width06,
                        ),
                        const Text(
                          StringConfig.iAmNotKeepOn,
                          style: TextStyle(
                            fontFamily: FontFamilyConfig.outfitRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: FontSizeConfig.body1Text,
                            color: ColorConfig.textColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: SizeConfig.height20,
                ),
                SizedBox(
                  height: SizeConfig.height52,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      controller.isUpdatedImage4 = false;
                      controller.isUpdatedImage5 = false;
                      controller.isUpdatedImage6 = false;
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

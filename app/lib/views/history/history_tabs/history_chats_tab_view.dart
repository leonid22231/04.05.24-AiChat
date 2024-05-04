// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/size_config.dart';
import 'package:prime_ai_flutter_ui_kit/controller/history_controller.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../../../config/color_config.dart';
import '../../../config/font_family_config.dart';
import '../../../config/font_size_config.dart';
import '../../../config/image_config.dart';
import '../../../config/string_config.dart';

class HistoryChatsTabView extends StatelessWidget {
  HistoryChatsTabView({Key? key}) : super(key: key);

  HistoryController historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: SizeConfig.padding20, right: SizeConfig.padding20, top: SizeConfig.padding20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              StringConfig.previous8Days,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSizeConfig.body1Text,
                fontFamily: FontFamilyConfig.outfitRegular,
                fontWeight: FontWeight.w400,
                color: ColorConfig.textMediumColor,
              ),
            ),
            const SizedBox(
              height: SizeConfig.height15,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: historyController.historyChat1Titles.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        final appBarText = historyController.historyChat1Titles[index];
                        Get.toNamed(AppRoutes.historyChatView, arguments: {'appBarText': appBarText});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: SizeConfig.padding03point),
                                child: Image.asset(
                                  ImageConfig.historyChat,
                                  width: SizeConfig.width14,
                                ),
                              ),
                              const SizedBox(
                                width: SizeConfig.width06,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    historyController.historyChat1Titles[index],
                                    style: const TextStyle(
                                      fontSize: FontSizeConfig.heading4Text,
                                      fontFamily: FontFamilyConfig.outfitMedium,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: SizeConfig.height06,
                                  ),
                                  Text(
                                    historyController.historyChat1Timings[index],
                                    style: const TextStyle(
                                      fontSize: FontSizeConfig.body1Text,
                                      fontFamily: FontFamilyConfig.outfitRegular,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConfig.textMediumColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              historyController.tooltipChatControllers1[index].showTooltip();
                            },
                            child: SuperTooltip(
                              controller: historyController.tooltipChatControllers1[index],
                              barrierColor: Colors.transparent,
                              borderColor: ColorConfig.textWhiteColor,
                              hasShadow: true,
                              shadowSpreadRadius: .1,
                              borderRadius: SizeConfig.borderRadius08,
                              arrowBaseWidth: SizeConfig.width10,
                              arrowTipDistance: 10,
                              arrowLength: 9,
                              content: GestureDetector(
                                onTap: () {
                                  historyController.tooltipChatControllers1[index].hideTooltip();
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return customDeleteChatDialouge();
                                    },
                                  );
                                },
                                child: SizedBox(
                                  width: SizeConfig.width115,
                                  height: SizeConfig.height27,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        ImageConfig.deleteChat,
                                        width: SizeConfig.width16,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width10,
                                      ),
                                      const Text(
                                        StringConfig.deleteChat,
                                        style: TextStyle(
                                          fontFamily: FontFamilyConfig.outfitRegular,
                                          fontWeight: FontWeight.w400,
                                          fontSize: FontSizeConfig.body1Text,
                                          color: ColorConfig.textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: const Icon(
                                Icons.more_vert_rounded,
                                size: SizeConfig.iconSize24,
                                color: ColorConfig.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: SizeConfig.height24,
                      color: ColorConfig.backgroundColor,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: SizeConfig.height10,
            ),
            const Text(
              StringConfig.previous25Days,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSizeConfig.body1Text,
                fontFamily: FontFamilyConfig.outfitRegular,
                fontWeight: FontWeight.w400,
                color: ColorConfig.textMediumColor,
              ),
            ),
            const SizedBox(
              height: SizeConfig.height15,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: historyController.historyChat2Titles.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        final appBarText = historyController.historyChat2Titles[index];
                        Get.toNamed(AppRoutes.historyChatView, arguments: {'appBarText': appBarText});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: SizeConfig.padding03point),
                                child: Image.asset(
                                  ImageConfig.historyChat,
                                  width: SizeConfig.width14,
                                ),
                              ),
                              const SizedBox(
                                width: SizeConfig.width06,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    historyController.historyChat2Titles[index],
                                    style: const TextStyle(
                                      fontSize: FontSizeConfig.heading4Text,
                                      fontFamily: FontFamilyConfig.outfitMedium,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: SizeConfig.height06,
                                  ),
                                  Text(
                                    historyController.historyChat2Timings[index],
                                    style: const TextStyle(
                                      fontSize: FontSizeConfig.body1Text,
                                      fontFamily: FontFamilyConfig.outfitRegular,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConfig.textMediumColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              historyController.tooltipChatControllers2[index].showTooltip();
                            },
                            child: SuperTooltip(
                              controller: historyController.tooltipChatControllers2[index],
                              barrierColor: Colors.transparent,
                              borderColor: ColorConfig.textWhiteColor,
                              hasShadow: true,
                              shadowSpreadRadius: .1,
                              borderRadius: SizeConfig.borderRadius08,
                              arrowBaseWidth: SizeConfig.width10,
                              arrowTipDistance: 10,
                              arrowLength: 9,
                              content: GestureDetector(
                                onTap: () {
                                  historyController.tooltipChatControllers2[index].hideTooltip();
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return customDeleteChatDialouge();
                                    },
                                  );
                                },
                                child: SizedBox(
                                  width: SizeConfig.width115,
                                  height: SizeConfig.height27,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        ImageConfig.deleteChat,
                                        width: SizeConfig.width16,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width10,
                                      ),
                                      const Text(
                                        StringConfig.deleteChat,
                                        style: TextStyle(
                                          fontFamily: FontFamilyConfig.outfitRegular,
                                          fontWeight: FontWeight.w400,
                                          fontSize: FontSizeConfig.body1Text,
                                          color: ColorConfig.textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: const Icon(
                                Icons.more_vert_rounded,
                                size: SizeConfig.iconSize24,
                                color: ColorConfig.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: SizeConfig.height24,
                      color: ColorConfig.backgroundColor,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: SizeConfig.height10,
            ),
            const Text(
              StringConfig.previousJulyDays,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSizeConfig.body1Text,
                fontFamily: FontFamilyConfig.outfitRegular,
                fontWeight: FontWeight.w400,
                color: ColorConfig.textMediumColor,
              ),
            ),
            const SizedBox(
              height: SizeConfig.height15,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: historyController.historyChat3Titles.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        final appBarText = historyController.historyChat2Titles[index];
                        Get.toNamed(AppRoutes.historyChatView, arguments: {'appBarText': appBarText});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: SizeConfig.padding03point),
                                child: Image.asset(
                                  ImageConfig.historyChat,
                                  width: SizeConfig.width14,
                                ),
                              ),
                              const SizedBox(
                                width: SizeConfig.width06,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    historyController.historyChat3Titles[index],
                                    style: const TextStyle(
                                      fontSize: FontSizeConfig.heading4Text,
                                      fontFamily: FontFamilyConfig.outfitMedium,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: SizeConfig.height06,
                                  ),
                                  Text(
                                    historyController.historyChat3Timings[index],
                                    style: const TextStyle(
                                      fontSize: FontSizeConfig.body1Text,
                                      fontFamily: FontFamilyConfig.outfitRegular,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConfig.textMediumColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              historyController.tooltipChatControllers3[index].showTooltip();
                            },
                            child: SuperTooltip(
                              controller: historyController.tooltipChatControllers3[index],
                              barrierColor: Colors.transparent,
                              borderColor: ColorConfig.textWhiteColor,
                              hasShadow: true,
                              shadowSpreadRadius: .1,
                              borderRadius: SizeConfig.borderRadius08,
                              arrowBaseWidth: SizeConfig.width10,
                              arrowTipDistance: 10,
                              arrowLength: 9,
                              content: GestureDetector(
                                onTap: () {
                                  historyController.tooltipChatControllers3[index].hideTooltip();
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return customDeleteChatDialouge();
                                    },
                                  );
                                },
                                child: SizedBox(
                                  width: SizeConfig.width115,
                                  height: SizeConfig.height27,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        ImageConfig.deleteChat,
                                        width: SizeConfig.width16,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width10,
                                      ),
                                      const Text(
                                        StringConfig.deleteChat,
                                        style: TextStyle(
                                          fontFamily: FontFamilyConfig.outfitRegular,
                                          fontWeight: FontWeight.w400,
                                          fontSize: FontSizeConfig.body1Text,
                                          color: ColorConfig.textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: const Icon(
                                Icons.more_vert_rounded,
                                size: SizeConfig.iconSize24,
                                color: ColorConfig.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: SizeConfig.height24,
                      color: ColorConfig.backgroundColor,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Material customDeleteChatDialouge() {
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
                        StringConfig.deleteChat,
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
                  StringConfig.areYouSureDeleteThisChat,
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
                            StringConfig.buttonDelete,
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

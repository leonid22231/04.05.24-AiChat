// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/size_config.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';
import 'package:prime_ai_flutter_ui_kit/views/history/no_history_found_view.dart';
import 'package:super_tooltip/super_tooltip.dart';
import '../../../config/color_config.dart';
import '../../../config/font_family_config.dart';
import '../../../config/font_size_config.dart';
import '../../../config/image_config.dart';
import '../../../config/string_config.dart';
import '../../../controller/history_controller.dart';

class HistoryVideosTabView extends StatefulWidget {
  const HistoryVideosTabView({Key? key}) : super(key: key);

  @override
  State<HistoryVideosTabView> createState() => _HistoryVideosTabViewState();
}

class _HistoryVideosTabViewState extends State<HistoryVideosTabView> {
  HistoryController historyController = Get.put(HistoryController());

  @override
  void initState() {
    super.initState();
    historyController.filteredVideoTitles.addAll(historyController.historyVideoTitles);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: SizeConfig.padding20, right: SizeConfig.padding20, top: SizeConfig.padding20),
      child: historyController.filteredVideoTitles.isEmpty
          ? const NoHistoryFoundView()
          : ListView.builder(
        shrinkWrap: true,
        itemCount: historyController.historyVideoTitles.length,
        itemBuilder: (context, index) {
          final itemTitle = historyController.historyVideoTitles[index].toLowerCase();
          final query = historyController.searchController.text.toLowerCase();
          final matchesQuery = itemTitle.contains(query);
          if (!matchesQuery) {
            return const SizedBox.shrink();
          }
          return GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.historyFullVideoView);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          historyController.historyVideoImages[index],
                          width: SizeConfig.width86,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          width: SizeConfig.width12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: SizeConfig.padding07),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                historyController.historyVideoTitles[index],
                                style: const TextStyle(
                                  fontSize: FontSizeConfig.heading4Text,
                                  fontFamily: FontFamilyConfig.outfitMedium,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: SizeConfig.height13,
                              ),
                              Row(
                                children: [
                                  Text(
                                    historyController.historyTiming[index],
                                    style: const TextStyle(
                                      fontSize: FontSizeConfig.body1Text,
                                      fontFamily: FontFamilyConfig.outfitRegular,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConfig.textMediumColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: SizeConfig.width12,
                                  ),
                                  Text(
                                    historyController.historyDays[index],
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
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: SizeConfig.padding07),
                      child: GestureDetector(
                        onTap: () {
                          historyController.tooltipControllers[index].showTooltip();
                        },
                        child: SuperTooltip(
                          controller: historyController.tooltipControllers[index],
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
                              historyController.tooltipControllers[index].hideTooltip();
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return customDeleteVideoDialouge();
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
                                    StringConfig.deleteVideo,
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
                    ),
                  ],
                ),
                const Divider(
                  height: SizeConfig.height30,
                  color: ColorConfig.backgroundColor,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Material customDeleteVideoDialouge() {
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
                        StringConfig.deleteVideo,
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
                  StringConfig.areYouSureDeleteThisVideo,
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

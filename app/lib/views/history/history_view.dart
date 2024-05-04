// ignore_for_file: must_be_immutable

import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/color_config.dart';
import 'package:prime_ai_flutter_ui_kit/controller/history_controller.dart';
import 'package:prime_ai_flutter_ui_kit/controller/language_controller.dart';
import 'package:prime_ai_flutter_ui_kit/views/history/history_tabs/history_chats_tab_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/history/history_tabs/history_videos_tab_view.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';
import '../../config/image_config.dart';
import '../../config/size_config.dart';
import '../../config/string_config.dart';
import '../../controller/bottom_navigation_controller.dart';
import '../../routes/app_routes.dart';
import '../widget/common_app_bar.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  HistoryController historyController = Get.put(HistoryController());
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());
  final LanguageController languageController = Get.put(LanguageController());

  void goToTab(int tabIndex) {
    bottomNavigationController.changePage(tabIndex);
    Get.toNamed(AppRoutes.bottomBarView);
  }

  void filterData(String query) {
    setState(() {
      historyController.filteredVideoTitles = historyController
          .historyVideoTitles
          .where((title) => title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void clearSearch() {
    historyController.searchController.clear();
    setState(() {
      historyController.filteredVideoTitles.clear();
      historyController.filteredVideoTitles
          .addAll(historyController.historyVideoTitles);
    });
  }

  @override
  Widget build(BuildContext context) {
    languageController.loadSelectedLanguage();
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: ConditionalWillPopScope(
        onWillPop: () async {
          goToTab(0);
          return false;
        },
        shouldAddCallback: false,
        child: Scaffold(
          backgroundColor: ColorConfig.backgroundWhiteColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(SizeConfig.height100),
            child: CommonAppBar(
              backgroundColor: ColorConfig.backgroundWhiteColor,
              centerTitle: true,
              title: StringConfig.history,
              leading: Center(
                  child: Obx(
                () => Padding(
                  padding: EdgeInsets.only(
                      left: languageController.arb.value
                          ? 0
                          : SizeConfig.padding20),
                  child: Image.asset(
                    ImageConfig.appLogo,
                    width: SizeConfig.width30,
                    height: SizeConfig.height24,
                  ),
                ),
              )),
              actions: [
                Center(
                  child: Obx(() => Padding(
                    padding:  EdgeInsets.only(right: SizeConfig.padding12,left:languageController.arb.value? SizeConfig.padding12:0),
                    child: Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: historyController.isSearchOpen
                              ? MediaQuery.of(context).size.width - 160
                              : 0,
                          child: historyController.isSearchOpen
                              ? Padding(
                            padding: const EdgeInsets.only(
                              top: SizeConfig.padding08,
                              bottom: SizeConfig.padding08,
                              left: SizeConfig.padding06,
                            ),
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.bottom,
                              controller:
                              historyController.searchController,
                              cursorColor: ColorConfig.primaryColor,
                              style: const TextStyle(
                                fontFamily: FontFamilyConfig.outfitMedium,
                                fontSize: FontSizeConfig.body1Text,
                                fontWeight: FontWeight.w500,
                                color: ColorConfig.textColor,
                              ),
                              onChanged: (query) {
                                filterData(query);
                              },
                              decoration: InputDecoration(
                                hintText: StringConfig.search,
                                hintStyle: const TextStyle(
                                  fontFamily:
                                  FontFamilyConfig.outfitRegular,
                                  fontSize: FontSizeConfig.body1Text,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConfig.textLightColor,
                                ),
                                filled: true,
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.borderRadius08),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.borderRadius08),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          )
                              : Container(),
                        ),
                        historyController.isSearchOpen
                            ? IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: ColorConfig.textColor,
                            size: SizeConfig.width20,
                          ),
                          onPressed: () {
                            setState(() {
                              historyController.isSearchOpen = false;
                            });
                            clearSearch();
                            historyController.searchController.clear();
                          },
                        )
                            : GestureDetector(
                          onTap: () {
                            setState(() {
                              historyController.isSearchOpen = true;
                            });
                          },
                          child: Image.asset(
                            ImageConfig.searchMore,
                            width: 20.0,
                          ),
                        ),
                        const SizedBox(
                          width: SizeConfig.width12,
                        ),
                        GestureDetector(
                          onTap: () {
                            historyController.controller.showTooltip();
                          },
                          child: SuperTooltip(
                            controller: historyController.controller,
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
                                historyController.controller.hideTooltip();
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return customDeleteChatDialouge();
                                  },
                                );
                              },
                              child: SizedBox(
                                width: SizeConfig.width118,
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
                                      StringConfig.deleteHistory,
                                      style: TextStyle(
                                        fontFamily:
                                        FontFamilyConfig.outfitRegular,
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
                  ),)
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(SizeConfig.height48),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: SizeConfig.padding20,
                    right: SizeConfig.padding20,
                  ),
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ColorConfig.textFieldBorderColor,
                          width: SizeConfig.height01,
                        ),
                      ),
                    ),
                    child: TabBar(
                      controller: historyController.tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelStyle: const TextStyle(
                        fontSize: FontSizeConfig.body1Text,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamilyConfig.outfitMedium,
                      ),
                      labelStyle: const TextStyle(
                        fontSize: FontSizeConfig.body1Text,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamilyConfig.outfitMedium,
                      ),
                      dividerColor: ColorConfig.textFieldBorderColor,
                      indicatorColor: ColorConfig.primaryColor,
                      labelColor: ColorConfig.primaryColor,
                      padding: EdgeInsets.zero,
                      unselectedLabelColor: ColorConfig.textColor,
                      labelPadding: const EdgeInsets.only(
                        left: SizeConfig.padding15,
                        right: SizeConfig.padding15,
                      ),
                      tabs: const [
                        Tab(text: StringConfig.chatsTab),
                        Tab(text: StringConfig.videosTab),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              HistoryChatsTabView(),
              const HistoryVideosTabView(),
            ],
          ),
        ),
      ),
    );
  }

  Material customDeleteChatDialouge() {
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
            height: SizeConfig.height201,
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
                        StringConfig.deleteHistory,
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
                  StringConfig.areYouSureDeleteHistory,
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
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.borderRadius52),
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
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.borderRadius52),
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

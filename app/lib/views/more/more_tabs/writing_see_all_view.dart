// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/controller/language_controller.dart';
import 'package:prime_ai_flutter_ui_kit/controller/more_controller.dart';
import 'package:prime_ai_flutter_ui_kit/views/more/more_tabs/writing_tab_view.dart';
import '../../../config/color_config.dart';
import '../../../config/font_family_config.dart';
import '../../../config/font_size_config.dart';
import '../../../config/image_config.dart';
import '../../../config/size_config.dart';
import '../../../config/string_config.dart';
import '../../widget/common_app_bar.dart';

class WritingSeeAllView extends StatefulWidget {
  const WritingSeeAllView({Key? key}) : super(key: key);

  @override
  State<WritingSeeAllView> createState() => _WritingSeeAllViewState();
}

class _WritingSeeAllViewState extends State<WritingSeeAllView> {
  MoreController moreController = Get.put(MoreController());
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    languageController.loadSelectedLanguage();
    return DefaultTabController(
      length: 6,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: ColorConfig.backgroundWhiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(SizeConfig.height100),
          child: CommonAppBar(
            backgroundColor: ColorConfig.backgroundWhiteColor,
            centerTitle: true,
            title: StringConfig.writingTab,
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
            actions: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: moreController.isSearchOpen
                    ? MediaQuery.of(context).size.width - 100
                    : 0,
                child: moreController.isSearchOpen
                    ? Padding(
                        padding: const EdgeInsets.only(
                          top: SizeConfig.padding08,
                          bottom: SizeConfig.padding08,
                          left: SizeConfig.padding06,
                        ),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.bottom,
                          controller: moreController.searchController,
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
              moreController.isSearchOpen
                  ? IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: ColorConfig.textColor,
                        size: SizeConfig.width20,
                      ),
                      onPressed: () {
                        setState(() {
                          moreController.isSearchOpen = false;
                        });
                        moreController.searchController.clear();
                      },
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          moreController.isSearchOpen = true;
                        });
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: SizeConfig.padding20,left: SizeConfig.padding20),
                        child: Image.asset(
                          ImageConfig.searchMore,
                          width: 20.0,
                        ),
                      ),
                    ),
            ],
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(SizeConfig.height48),
                child: Obx(
                  () => Padding(
                    padding: EdgeInsets.only(
                        right: languageController.arb.value
                            ? SizeConfig.padding20
                            : 0, left: languageController.arb.value
                            ? 0
                            : SizeConfig.padding20
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
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabAlignment: TabAlignment.center,
                        controller: moreController.tabController,
                        isScrollable: true,
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
                            right: SizeConfig.padding15),
                        tabs: const [
                          Tab(text: StringConfig.allTab),
                          Tab(text: StringConfig.writingTab),
                          Tab(text: StringConfig.creativeTab),
                          Tab(text: StringConfig.businessTab),
                          Tab(text: StringConfig.developersTab),
                          Tab(text: StringConfig.othersTab),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ),
        body: TabBarView(
          children: [
            WritingTabView(),
            WritingTabView(),
            WritingTabView(),
            WritingTabView(),
            WritingTabView(),
            WritingTabView(),
          ],
        ),
      ),
    );
  }
}

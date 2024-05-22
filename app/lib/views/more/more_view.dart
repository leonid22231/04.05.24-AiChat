// ignore_for_file: must_be_immutable

import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/controller/language_controller.dart';
import 'package:prime_ai_flutter_ui_kit/controller/more_controller.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';
import 'package:prime_ai_flutter_ui_kit/views/more/more_tabs/all_tab_view.dart';

import '../../config/color_config.dart';
import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';
import '../../config/image_config.dart';
import '../../config/size_config.dart';
import '../../config/string_config.dart';
import '../../controller/bottom_navigation_controller.dart';
import '../widget/common_app_bar.dart';

class MoreView extends StatefulWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  MoreController moreController = Get.put(MoreController());
  BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());
  final LanguageController languageController = Get.put(LanguageController());

  void goToTab(int tabIndex) {
    bottomNavigationController.changePage(tabIndex);
    Get.toNamed(AppRoutes.bottomBarView);
  }

  @override
  Widget build(BuildContext context) {
    languageController.loadSelectedLanguage();
    return DefaultTabController(
      length: 8,
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
            preferredSize: const Size.fromHeight(SizeConfig.height50),
            child: CommonAppBar(
              backgroundColor: ColorConfig.backgroundWhiteColor,
              centerTitle: true,
              title: moreController.isSearchOpen ? null : StringConfig.more,
              toolBarHeight: SizeConfig.height70,
              leading: Center(
                  child: Obx(
                () => Padding(
                  padding: EdgeInsets.only(left: languageController.arb.value ? 0 : SizeConfig.padding20),
                  child: Image.asset(
                    ImageConfig.appLogo,
                    width: SizeConfig.width30,
                    height: SizeConfig.height24,
                  ),
                ),
              )),
              actions: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: moreController.isSearchOpen ? MediaQuery.of(context).size.width - 110 : 0,
                  child: moreController.isSearchOpen
                      ? Padding(
                          padding: const EdgeInsets.only(
                            top: SizeConfig.padding08,
                            bottom: SizeConfig.padding08,
                            left: SizeConfig.padding06,
                            right: SizeConfig.padding06,
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
                                borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
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
                          padding: const EdgeInsets.only(right: SizeConfig.padding20, left: SizeConfig.padding20),
                          child: Image.asset(
                            ImageConfig.searchMore,
                            width: 20.0,
                          ),
                        ),
                      ),
              ],
            ),
          ),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: SizeConfig.padding20, top: SizeConfig.padding10, right: SizeConfig.padding20, bottom: SizeConfig.padding10),
                        child: Text(
                          StringConfig.aiSpecialFeature,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: FontSizeConfig.heading3Text,
                            fontFamily: FontFamilyConfig.outfitSemiBold,
                            fontWeight: FontWeight.w500,
                            color: ColorConfig.textColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: SizeConfig.height12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: SizeConfig.padding20, right: SizeConfig.padding20),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              moreController.isChildVisible = !moreController.isChildVisible;
                            });
                          },
                          child: Container(
                            height: SizeConfig.height100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                              image: const DecorationImage(
                                image: AssetImage(ImageConfig.imageGenerator),
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Center(
                              child: moreController.isChildVisible
                                  ? SizedBox(
                                      height: SizeConfig.height40,
                                      width: SizeConfig.width183,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Get.toNamed(AppRoutes.imageGeneratorView);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: ColorConfig.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(SizeConfig.borderRadius52),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              ImageConfig.magicStick,
                                              width: SizeConfig.width20,
                                              color: ColorConfig.textWhiteColor,
                                            ),
                                            const SizedBox(
                                              width: SizeConfig.width08,
                                            ),
                                            const Text(
                                              StringConfig.buttonGenerateNow,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontFamily: FontFamilyConfig.outfitSemiBold,
                                                fontSize: FontSizeConfig.heading4Text,
                                                color: ColorConfig.textWhiteColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: SizeConfig.height16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: SizeConfig.padding20, right: SizeConfig.padding20),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              moreController.isChild2Visible = !moreController.isChild2Visible;
                            });
                          },
                          child: Container(
                            height: SizeConfig.height100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
                              image: const DecorationImage(
                                image: AssetImage(ImageConfig.videoGenerator),
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Center(
                              child: moreController.isChild2Visible
                                  ? SizedBox(
                                      height: SizeConfig.height40,
                                      width: SizeConfig.width183,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Get.toNamed(AppRoutes.videoGeneratorView);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: ColorConfig.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(SizeConfig.borderRadius52),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              ImageConfig.magicStick,
                                              width: SizeConfig.width20,
                                              color: ColorConfig.textWhiteColor,
                                            ),
                                            const SizedBox(
                                              width: SizeConfig.width08,
                                            ),
                                            const Text(
                                              StringConfig.buttonGenerateNow,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontFamily: FontFamilyConfig.outfitSemiBold,
                                                fontSize: FontSizeConfig.heading4Text,
                                                color: ColorConfig.textWhiteColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: SizeConfig.height08,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: SizeConfig.padding20),
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
                          child: AppBar(
                            backgroundColor: ColorConfig.backgroundWhiteColor,
                            elevation: 0,
                            bottom: const TabBar(
                              indicatorSize: TabBarIndicatorSize.tab,
                              tabAlignment: TabAlignment.center,
                              isScrollable: true,
                              unselectedLabelStyle: TextStyle(
                                fontSize: FontSizeConfig.body1Text,
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamilyConfig.outfitMedium,
                              ),
                              labelStyle: TextStyle(
                                fontSize: FontSizeConfig.body1Text,
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamilyConfig.outfitMedium,
                              ),
                              dividerColor: ColorConfig.textFieldBorderColor,
                              indicatorColor: ColorConfig.primaryColor,
                              labelColor: ColorConfig.primaryColor,
                              padding: EdgeInsets.zero,
                              unselectedLabelColor: ColorConfig.textColor,
                              labelPadding: EdgeInsets.only(left: SizeConfig.padding15, right: SizeConfig.padding15),
                              tabs: [
                                Tab(text: StringConfig.allTab),
                                Tab(text: StringConfig.writingTab),
                                Tab(text: StringConfig.creativeTab),
                                Tab(text: StringConfig.businessTab),
                                Tab(text: StringConfig.lawsTab),
                                Tab(text: StringConfig.developersTab),
                                Tab(text: StringConfig.socialTab),
                                Tab(text: StringConfig.othersTab),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ];
            },
            body: TabBarView(
              children: [
                AllTabView(),
                AllTabView(),
                AllTabView(),
                AllTabView(),
                AllTabView(),
                AllTabView(),
                AllTabView(),
                AllTabView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

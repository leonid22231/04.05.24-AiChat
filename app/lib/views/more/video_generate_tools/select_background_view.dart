// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/controller/video_generator_controller.dart';
import 'package:prime_ai_flutter_ui_kit/views/more/video_generate_tools/select_background_tabs/select_color_tab_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/more/video_generate_tools/select_background_tabs/select_images_tab_view.dart';

import '../../../config/color_config.dart';
import '../../../config/font_family_config.dart';
import '../../../config/font_size_config.dart';
import '../../../config/image_config.dart';
import '../../../config/size_config.dart';
import '../../../config/string_config.dart';
import '../../widget/common_app_bar.dart';

class SelectBackgroundView extends StatelessWidget {
  SelectBackgroundView({Key? key}) : super(key: key);

  VideoGeneratorController videoGeneratorController =
      Get.put(VideoGeneratorController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: ColorConfig.backgroundWhiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(SizeConfig.height100),
          child: CommonAppBar(
            backgroundColor: ColorConfig.backgroundWhiteColor,
            centerTitle: true,
            title: StringConfig.selectBackground,
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
                    indicatorSize:TabBarIndicatorSize.tab ,
                    controller: videoGeneratorController.tabController,
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
                      Tab(text: StringConfig.color),
                      Tab(text: StringConfig.images),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            SelectColorTabView(),
            SelectImagesTabView(),
          ],
        ),
      ),
    );
  }
}

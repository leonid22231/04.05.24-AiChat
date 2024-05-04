import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/color_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/image_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/size_config.dart';
import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';
import '../../controller/bottom_navigation_controller.dart';

class BottomBarView extends StatelessWidget {
  BottomBarView({super.key});

  final BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: bottomNavigationController.pageIndex.value,
          children: bottomNavigationController.pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => SizedBox(
          height: Platform.isAndroid?SizeConfig.height82:SizeConfig.height91,
          child: BottomNavigationBar(
            currentIndex: bottomNavigationController.pageIndex.value,
            onTap: bottomNavigationController.changePage,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: ColorConfig.backgroundWhiteColor,
            selectedItemColor: ColorConfig.primaryColor,
            unselectedItemColor: ColorConfig.textLightColor,
            selectedLabelStyle: const TextStyle(
              fontFamily: FontFamilyConfig.outfitMedium,
              fontSize: FontSizeConfig.body2Text,
              fontWeight: FontWeight.w500,
            ),
            showSelectedLabels: true,
            unselectedLabelStyle: const TextStyle(
              fontFamily: FontFamilyConfig.outfitMedium,
              fontSize: FontSizeConfig.body2Text,
              fontWeight: FontWeight.w500,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.padding06),
                  child: Image(
                    image: AssetImage(ImageConfig.chatBottomBar),
                    width: SizeConfig.width22,
                  ),
                ),
                label: 'Chat',
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.padding06),
                  child: Image(
                    image: AssetImage(ImageConfig.chatBottomBarFill),
                    width: SizeConfig.width22,
                  ),
                ), // Active color
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.padding06),
                  child: Image(
                    image: AssetImage(ImageConfig.moreBottomBar),
                    width: SizeConfig.width22,
                  ),
                ),
                label: 'More',
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.padding06),
                  child: Image(
                    image: AssetImage(ImageConfig.moreBottomBar),
                    width: SizeConfig.width22,
                    color: ColorConfig.primaryColor,
                  ),
                ), // Active color
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.padding06),
                  child: Image(
                    image: AssetImage(ImageConfig.historyBottomBar),
                    width: SizeConfig.width22,
                  ),
                ),
                label: 'History',
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.padding06),
                  child: Image(
                    image: AssetImage(ImageConfig.historyBottomBar),
                    width: SizeConfig.width22,
                    color: ColorConfig.primaryColor,
                  ),
                ), // Active color
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.padding06),
                  child: Image(
                    image: AssetImage(ImageConfig.profileBottomBar),
                    width: SizeConfig.width22,
                  ),
                ),
                label: 'Profile',
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.padding06),
                  child: Image(
                    image: AssetImage(ImageConfig.profileBottomBar),
                    width: SizeConfig.width22,
                    color: ColorConfig.primaryColor,
                  ),
                ), // Active color
              ),
            ],
          ),
        ),
      ),
    );
  }
}

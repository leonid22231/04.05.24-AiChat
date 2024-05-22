// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prime_ai_flutter_ui_kit/controller/bottom_navigation_controller.dart';
import 'package:prime_ai_flutter_ui_kit/controller/language_controller.dart';
import 'package:prime_ai_flutter_ui_kit/controller/profile_controller.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/color_config.dart';
import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';
import '../../config/image_config.dart';
import '../../config/size_config.dart';
import '../../config/string_config.dart';
import '../widget/common_app_bar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController profileController = Get.put(ProfileController());
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());
  final LanguageController languageController = Get.put(LanguageController());

  void goToTab(int tabIndex) {
    bottomNavigationController.changePage(tabIndex);
    Get.toNamed(AppRoutes.bottomBarView);
  }

  @override
  Widget build(BuildContext context) {
    languageController.loadSelectedLanguage();
    return ConditionalWillPopScope(
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
            title: StringConfig.profile.tr,
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
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              left: SizeConfig.padding20,
              top: SizeConfig.padding60,
              right: SizeConfig.padding20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Center(
              //   child: GestureDetector(
              //     onTap: () {
              //       _pickImageFromGallery();
              //     },
              //     child: Stack(
              //       alignment: Alignment.bottomRight,
              //       children: [
              //         ClipRRect(
              //           borderRadius: BorderRadius.circular(100),
              //           child: Image.asset(
              //             ImageConfig.profilePickImage,
              //             width: SizeConfig.width122,
              //           ),
              //         ),
              //         Container(
              //           padding: const EdgeInsets.all(5),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(100),
              //             color: Colors.amber,
              //           ),
              //           child: const Icon(
              //             Icons.edit,
              //             color: Colors.white,
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: SizeConfig.height46,
              // ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: profileController.profileOptions.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if (index == 0) {
                            Get.toNamed(AppRoutes.languageView);
                          } else if (index == 1) {
                            Get.toNamed(AppRoutes.faqsView);
                          } else if (index == 2) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return customLogoutDialouge();
                              },
                            );
                          }
                        },
                        borderRadius: BorderRadius.circular(50),
                        child: Ink(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                profileController.profileOptions[index].tr,
                                style: const TextStyle(
                                  fontSize: FontSizeConfig.heading4Text,
                                  fontFamily: FontFamilyConfig.outfitMedium,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Image.asset(
                                ImageConfig.arrowLeft,
                                width: SizeConfig.width16,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: ColorConfig.dividerColor,
                        height: SizeConfig.height28,
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material customLogoutDialouge() {
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
                        StringConfig.logout,
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
                  StringConfig.logoutDescription,
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
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.remove("email");
                            prefs.remove("remember");
                            Get.offAllNamed(AppRoutes.signInView);
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
                            StringConfig.buttonLogout,
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

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profileController.selectedImage = File(pickedFile.path);
      });
    }
  }
}

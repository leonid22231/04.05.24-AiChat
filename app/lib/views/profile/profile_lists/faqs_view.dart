// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/font_family_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/font_size_config.dart';
import 'package:prime_ai_flutter_ui_kit/controller/profile_controller.dart';

import '../../../config/color_config.dart';
import '../../../config/image_config.dart';
import '../../../config/size_config.dart';
import '../../../config/string_config.dart';
import '../../widget/common_app_bar.dart';

class FAQsView extends StatefulWidget {
  const FAQsView({Key? key}) : super(key: key);

  @override
  State<FAQsView> createState() => _FAQsViewState();
}

class _FAQsViewState extends State<FAQsView> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundWhiteColor,
      appBar: CommonAppBar(
        backgroundColor: ColorConfig.backgroundWhiteColor,
        centerTitle: true,
        title: StringConfig.faqs,
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
            width: profileController.isSearchOpen
                ? MediaQuery.of(context).size.width - 100
                : 0,
            child: profileController.isSearchOpen
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: SizeConfig.padding08,
                      bottom: SizeConfig.padding08,
                      left: SizeConfig.padding06,
                    ),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.bottom,
                      controller: profileController.searchController,
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
          profileController.isSearchOpen
              ? IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: ColorConfig.textColor,
                    size: SizeConfig.width20,
                  ),
                  onPressed: () {
                    setState(() {
                      profileController.isSearchOpen = false;
                    });
                    profileController.searchController.clear();
                  },
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      profileController.isSearchOpen = true;
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
            bottom: SizeConfig.padding10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.borderRadius10),
                  color: ColorConfig.backgroundColor,
                ),
                child: Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    backgroundColor: ColorConfig.backgroundColor,
                    collapsedBackgroundColor: ColorConfig.backgroundColor,
                    trailing: Image.asset(
                      profileController.isFAQ1 == true
                          ? ImageConfig.dropdownOpen
                          : ImageConfig.dropdownArrow,
                      width: SizeConfig.width18,
                      color: ColorConfig.textColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius10),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    childrenPadding:
                        const EdgeInsets.only(bottom: SizeConfig.padding08),
                    title: const Text(
                      StringConfig.whatIsPremium,
                      style: TextStyle(
                        fontSize: FontSizeConfig.body1Text,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamilyConfig.outfitMedium,
                        color: ColorConfig.textColor,
                      ),
                    ),
                    children: const <Widget>[
                      Divider(
                        color: ColorConfig.dividerColor,
                        indent: SizeConfig.width12,
                        endIndent: SizeConfig.width12,
                        height: SizeConfig.height15,
                      ),
                      ListTile(
                        shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        title: Text(
                          StringConfig.faqDescription1,
                          style: TextStyle(
                            fontSize: FontSizeConfig.body2Text,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamilyConfig.outfitRegular,
                            color: ColorConfig.textColor,
                          ),
                        ),
                      )
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        profileController.isFAQ1 = expanded;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height24,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.borderRadius10),
                  color: ColorConfig.backgroundColor,
                ),
                child: Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    backgroundColor: ColorConfig.backgroundColor,
                    collapsedBackgroundColor: ColorConfig.backgroundColor,
                    trailing: Image.asset(
                      profileController.isFAQ2 == true
                          ? ImageConfig.dropdownOpen
                          : ImageConfig.dropdownArrow,
                      width: SizeConfig.width18,
                      color: ColorConfig.textColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius10),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    childrenPadding:
                        const EdgeInsets.only(bottom: SizeConfig.padding08),
                    title: const Text(
                      StringConfig.howToUsePremium,
                      style: TextStyle(
                        fontSize: FontSizeConfig.body1Text,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamilyConfig.outfitMedium,
                        color: ColorConfig.textColor,
                      ),
                    ),
                    children: const <Widget>[
                      Divider(
                        color: ColorConfig.dividerColor,
                        indent: SizeConfig.width12,
                        endIndent: SizeConfig.width12,
                        height: SizeConfig.height15,
                      ),
                      ListTile(
                        shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        title: Text(
                          StringConfig.faqDescription1,
                          style: TextStyle(
                            fontSize: FontSizeConfig.body2Text,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamilyConfig.outfitRegular,
                            color: ColorConfig.textColor,
                          ),
                        ),
                      )
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        profileController.isFAQ2 = expanded;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height24,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.borderRadius10),
                  color: ColorConfig.backgroundColor,
                ),
                child: Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    backgroundColor: ColorConfig.backgroundColor,
                    collapsedBackgroundColor: ColorConfig.backgroundColor,
                    trailing: Image.asset(
                      profileController.isFAQ3 == true
                          ? ImageConfig.dropdownOpen
                          : ImageConfig.dropdownArrow,
                      width: SizeConfig.width18,
                      color: ColorConfig.textColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius10),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    childrenPadding:
                        const EdgeInsets.only(bottom: SizeConfig.padding08),
                    title: const Text(
                      StringConfig.whatIsAI,
                      style: TextStyle(
                        fontSize: FontSizeConfig.body1Text,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamilyConfig.outfitMedium,
                        color: ColorConfig.textColor,
                      ),
                    ),
                    children: const <Widget>[
                      Divider(
                        color: ColorConfig.dividerColor,
                        indent: SizeConfig.width12,
                        endIndent: SizeConfig.width12,
                        height: SizeConfig.height15,
                      ),
                      ListTile(
                        shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        title: Text(
                          StringConfig.faqDescription1,
                          style: TextStyle(
                            fontSize: FontSizeConfig.body2Text,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamilyConfig.outfitRegular,
                            color: ColorConfig.textColor,
                          ),
                        ),
                      )
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        profileController.isFAQ3 = expanded;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height24,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.borderRadius10),
                  color: ColorConfig.backgroundColor,
                ),
                child: Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    backgroundColor: ColorConfig.backgroundColor,
                    collapsedBackgroundColor: ColorConfig.backgroundColor,
                    trailing: Image.asset(
                      profileController.isFAQ4 == true
                          ? ImageConfig.dropdownOpen
                          : ImageConfig.dropdownArrow,
                      width: SizeConfig.width18,
                      color: ColorConfig.textColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius10),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    childrenPadding:
                        const EdgeInsets.only(bottom: SizeConfig.padding08),
                    title: const Text(
                      StringConfig.canIUsePrime,
                      style: TextStyle(
                        fontSize: FontSizeConfig.body1Text,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamilyConfig.outfitMedium,
                        color: ColorConfig.textColor,
                      ),
                    ),
                    children: const <Widget>[
                      Divider(
                        color: ColorConfig.dividerColor,
                        indent: SizeConfig.width12,
                        endIndent: SizeConfig.width12,
                        height: SizeConfig.height15,
                      ),
                      ListTile(
                        shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        title: Text(
                          StringConfig.faqDescription1,
                          style: TextStyle(
                            fontSize: FontSizeConfig.body2Text,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamilyConfig.outfitRegular,
                            color: ColorConfig.textColor,
                          ),
                        ),
                      )
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        profileController.isFAQ4 = expanded;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height24,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.borderRadius10),
                  color: ColorConfig.backgroundColor,
                ),
                child: Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    backgroundColor: ColorConfig.backgroundColor,
                    collapsedBackgroundColor: ColorConfig.backgroundColor,
                    trailing: Image.asset(
                      profileController.isFAQ5 == true
                          ? ImageConfig.dropdownOpen
                          : ImageConfig.dropdownArrow,
                      width: SizeConfig.width18,
                      color: ColorConfig.textColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius10),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    childrenPadding:
                        const EdgeInsets.only(bottom: SizeConfig.padding08),
                    title: const Text(
                      StringConfig.whatDoIUsePrimeApp,
                      style: TextStyle(
                        fontSize: FontSizeConfig.body1Text,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamilyConfig.outfitMedium,
                        color: ColorConfig.textColor,
                      ),
                    ),
                    children: const <Widget>[
                      Divider(
                        color: ColorConfig.dividerColor,
                        indent: SizeConfig.width12,
                        endIndent: SizeConfig.width12,
                        height: SizeConfig.height15,
                      ),
                      ListTile(
                        shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        title: Text(
                          StringConfig.faqDescription1,
                          style: TextStyle(
                            fontSize: FontSizeConfig.body2Text,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamilyConfig.outfitRegular,
                            color: ColorConfig.textColor,
                          ),
                        ),
                      )
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        profileController.isFAQ5 = expanded;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height24,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.borderRadius10),
                  color: ColorConfig.backgroundColor,
                ),
                child: Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    backgroundColor: ColorConfig.backgroundColor,
                    collapsedBackgroundColor: ColorConfig.backgroundColor,
                    trailing: Image.asset(
                      profileController.isFAQ6 == true
                          ? ImageConfig.dropdownOpen
                          : ImageConfig.dropdownArrow,
                      width: SizeConfig.width18,
                      color: ColorConfig.textColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius10),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    childrenPadding:
                        const EdgeInsets.only(bottom: SizeConfig.padding08),
                    title: const Text(
                      StringConfig.howToUsePremium,
                      style: TextStyle(
                        fontSize: FontSizeConfig.body1Text,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamilyConfig.outfitMedium,
                        color: ColorConfig.textColor,
                      ),
                    ),
                    children: const <Widget>[
                      Divider(
                        color: ColorConfig.dividerColor,
                        indent: SizeConfig.width12,
                        endIndent: SizeConfig.width12,
                        height: SizeConfig.height15,
                      ),
                      ListTile(
                        shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        title: Text(
                          StringConfig.faqDescription1,
                          style: TextStyle(
                            fontSize: FontSizeConfig.body2Text,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamilyConfig.outfitRegular,
                            color: ColorConfig.textColor,
                          ),
                        ),
                      )
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        profileController.isFAQ6 = expanded;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

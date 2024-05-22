import 'dart:io';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prime_ai_flutter_ui_kit/api/enums/UserGender.dart';
import 'package:prime_ai_flutter_ui_kit/controller/profile_controller.dart';
import 'package:prime_ai_flutter_ui_kit/utils/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_tooltip/super_tooltip.dart';
import '../../../config/color_config.dart';
import '../../../config/font_family_config.dart';
import '../../../config/font_size_config.dart';
import '../../../config/image_config.dart';
import '../../../config/size_config.dart';
import '../../../config/string_config.dart';
import '../../widget/common_app_bar.dart';

class PersonalInfoView extends StatefulWidget {
  const PersonalInfoView({Key? key}) : super(key: key);

  @override
  State<PersonalInfoView> createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
  ProfileController profileController = Get.put(ProfileController());

  void _showCountryPicker() async {
    final code = await profileController.countryPicker.showPicker(
      context: context,
    );
    if (code != null) {
      setState(() {
        profileController.selectedCountry = code.flagUri;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: profileController.selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      keyboardType: TextInputType.datetime,
      builder: (BuildContext context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorConfig.primaryColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ColorConfig.primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != profileController.selectedDate) {
      setState(() {
        profileController.selectedDate = picked;
        profileController.dateOfBirthController.text =
            "${picked.toLocal()}".split(' ')[0];
      });
    }
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

  @override
  void initState() {
    super.initState();
    initProfile();
  }

  void initProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Globals.client.infoUser(prefs.getString("email")!).then((value) {
    //   profileController.selectedCountry = value.phone_code != null ? CountryCode.fromDialCode(value.phone_code!)!.flagUri : "";
    //   profileController.fullNameController.text = value.name ?? "";
    //   profileController.emailController.text = value.email;
    //   profileController.phoneNumberController.text = value.phone_number ?? "";
    //   profileController.genderController.text = value.gender == null ? "" : value.gender!.name;
    //   profileController.dateOfBirthController.text = value.date_of_birth != null ? "${value.date_of_birth!.toLocal()}".split(' ')[0] : "";
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundWhiteColor,
      appBar: CommonAppBar(
        backgroundColor: ColorConfig.backgroundWhiteColor,
        centerTitle: true,
        title: StringConfig.personalInfo,
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SizeConfig.padding20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: SizeConfig.height34,
              ),
              Center(
                child: GestureDetector(
                  onTap: _pickImageFromGallery,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          ImageConfig.profilePickImage,
                          width: SizeConfig.width122,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.amber,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height34,
              ),
              Column(
                children: [
                  Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        profileController.isFocusedTextField1 = hasFocus;
                      });
                    },
                    child: SizedBox(
                      height: SizeConfig.height52,
                      child: TextFormField(
                        controller: profileController.fullNameController,
                        cursorColor: ColorConfig.primaryColor,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          fontSize: FontSizeConfig.heading4Text,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitMedium,
                          color: ColorConfig.textColor,
                        ),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          isDense: true,
                          hintText: StringConfig.fullName,
                          hintStyle: const TextStyle(
                            fontSize: FontSizeConfig.heading4Text,
                            fontWeight: FontWeight.w300,
                            fontFamily: FontFamilyConfig.outfitLight,
                            color: ColorConfig.textLightColor,
                          ),
                          labelText: profileController.isFocusedTextField1 ||
                                  profileController
                                      .fullNameController.text.isNotEmpty
                              ? StringConfig.name
                              : null,
                          labelStyle: const TextStyle(
                            fontSize: FontSizeConfig.heading4Text,
                            fontWeight: FontWeight.w300,
                            fontFamily: FontFamilyConfig.outfitLight,
                            color: ColorConfig.textColor,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorConfig.textFieldBorderColor
                                  .withOpacity(.3),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius08),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorConfig.textFieldBorderColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius08),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorConfig.primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius08),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        profileController.isFocusedTextField2 = hasFocus;
                      });
                    },
                    child: SizedBox(
                      height: SizeConfig.height52,
                      child: TextFormField(
                        controller: profileController.emailController,
                        cursorColor: ColorConfig.primaryColor,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          fontSize: FontSizeConfig.heading4Text,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitMedium,
                          color: ColorConfig.textColor,
                        ),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          isDense: true,
                          hintText: StringConfig.email,
                          hintStyle: const TextStyle(
                            fontSize: FontSizeConfig.heading4Text,
                            fontWeight: FontWeight.w300,
                            fontFamily: FontFamilyConfig.outfitLight,
                            color: ColorConfig.textLightColor,
                          ),
                          labelText: profileController.isFocusedTextField2 ||
                                  profileController
                                      .emailController.text.isNotEmpty
                              ? StringConfig.email
                              : null,
                          labelStyle: const TextStyle(
                            fontSize: FontSizeConfig.heading4Text,
                            fontWeight: FontWeight.w300,
                            fontFamily: FontFamilyConfig.outfitLight,
                            color: ColorConfig.textColor,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorConfig.textFieldBorderColor
                                  .withOpacity(.3),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius08),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorConfig.textFieldBorderColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius08),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorConfig.primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius08),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        profileController.isFocusedTextField3 = hasFocus;
                      });
                    },
                    child: SizedBox(
                      height: SizeConfig.height52,
                      child: TextFormField(
                        controller: profileController.phoneNumberController,
                        cursorColor: ColorConfig.primaryColor,
                        style: const TextStyle(
                          fontSize: FontSizeConfig.heading4Text,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitMedium,
                          color: ColorConfig.textColor,
                        ),
                        decoration: InputDecoration(
                          alignLabelWithHint: false,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          isDense: true,
                          hintText: StringConfig.phoneNumber,
                          hintStyle: const TextStyle(
                            fontSize: FontSizeConfig.heading4Text,
                            fontWeight: FontWeight.w300,
                            fontFamily: FontFamilyConfig.outfitLight,
                            color: ColorConfig.textLightColor,
                          ),
                          labelText: profileController.isFocusedTextField3 ||
                                  profileController
                                      .phoneNumberController.text.isNotEmpty
                              ? StringConfig.phoneNumber
                              : null,
                          labelStyle: const TextStyle(
                            fontSize: FontSizeConfig.heading4Text,
                            fontWeight: FontWeight.w300,
                            fontFamily: FontFamilyConfig.outfitLight,
                            color: ColorConfig.textColor,
                          ),
                          contentPadding: const EdgeInsets.only(
                              left: 56.0), // Adjust the left padding as needed
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorConfig.textFieldBorderColor
                                  .withOpacity(.3),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius08),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorConfig.textFieldBorderColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius08),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorConfig.primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius08),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                                left: SizeConfig.padding15,
                                right: SizeConfig.padding05),
                            child: GestureDetector(
                              onTap: () {
                                _showCountryPicker();
                              },
                              child: SizedBox(
                                width: SizeConfig.width56,
                                child: Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          profileController.selectedCountry),
                                      width: SizeConfig.width30,
                                    ),
                                    const SizedBox(
                                      width: SizeConfig.width06,
                                    ),
                                    const Image(
                                      image:
                                          AssetImage(ImageConfig.dropdownArrow),
                                      width: SizeConfig.width18,
                                      color: ColorConfig.textLightColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        profileController.isFocusedTextField4 = hasFocus;
                      });
                    },
                    child: SizedBox(
                      height: SizeConfig.height52,
                      child: TextFormField(
                        controller: profileController.genderController,
                        cursorColor: ColorConfig.primaryColor,
                        style: const TextStyle(
                          fontSize: FontSizeConfig.heading4Text,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitMedium,
                          color: ColorConfig.textColor,
                        ),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          isDense: true,
                          hintText: StringConfig.gender,
                          hintStyle: const TextStyle(
                            fontSize: FontSizeConfig.heading4Text,
                            fontWeight: FontWeight.w300,
                            fontFamily: FontFamilyConfig.outfitLight,
                            color: ColorConfig.textLightColor,
                          ),
                          labelText: profileController.isFocusedTextField4 ||
                                  profileController
                                      .genderController.text.isNotEmpty
                              ? StringConfig.gender
                              : null,
                          labelStyle: const TextStyle(
                            fontSize: FontSizeConfig.heading4Text,
                            fontWeight: FontWeight.w300,
                            fontFamily: FontFamilyConfig.outfitLight,
                            color: ColorConfig.textColor,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorConfig.textFieldBorderColor
                                  .withOpacity(.3),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius08),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorConfig.textFieldBorderColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius08),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorConfig.primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius08),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(SizeConfig.padding15),
                            child: GestureDetector(
                              onTap: () {
                                profileController.controller.showTooltip();
                              },
                              child: SuperTooltip(
                                controller: profileController.controller,
                                barrierColor: Colors.transparent,
                                borderColor: ColorConfig.textWhiteColor,
                                hasShadow: true,
                                shadowSpreadRadius: .1,
                                borderRadius: SizeConfig.borderRadius08,
                                arrowBaseWidth: SizeConfig.width10,
                                arrowLength: 9,
                                arrowTipDistance: 20,
                                left: 35,
                                content: buildDropdownMenu(),
                                child: const Image(
                                  image: AssetImage(ImageConfig.dropdownArrow),
                                  width: SizeConfig.width18,
                                  color: ColorConfig.textColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        profileController.isFocusedTextField5 = hasFocus;
                      });
                    },
                    child: SizedBox(
                      height: SizeConfig.height52,
                      child: TextFormField(
                        controller: profileController.dateOfBirthController,
                        cursorColor: ColorConfig.primaryColor,
                        style: const TextStyle(
                          fontSize: FontSizeConfig.heading4Text,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitMedium,
                          color: ColorConfig.textColor,
                        ),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          isDense: true,
                          hintText: StringConfig.dateOfBirth,
                          hintStyle: const TextStyle(
                            fontSize: FontSizeConfig.heading4Text,
                            fontWeight: FontWeight.w300,
                            fontFamily: FontFamilyConfig.outfitLight,
                            color: ColorConfig.textLightColor,
                          ),
                          labelText: profileController.isFocusedTextField5 ||
                                  profileController
                                      .dateOfBirthController.text.isNotEmpty
                              ? StringConfig.dateOfBirth
                              : null,
                          labelStyle: const TextStyle(
                            fontSize: FontSizeConfig.heading4Text,
                            fontWeight: FontWeight.w300,
                            fontFamily: FontFamilyConfig.outfitLight,
                            color: ColorConfig.textColor,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorConfig.textFieldBorderColor
                                  .withOpacity(.3),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius08),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorConfig.textFieldBorderColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius08),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorConfig.primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius08),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(SizeConfig.padding15),
                            child: GestureDetector(
                              onTap: () {
                                _selectDate(context);
                              },
                              child: const Image(
                                image: AssetImage(ImageConfig.calendar),
                                width: SizeConfig.width18,
                                color: ColorConfig.textColor,
                              ),
                            ),
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
    );
  }

  Widget buildDropdownMenu() {
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.height75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buildDropdownItems(),
      ),
    );
  }

  List<Widget> buildDropdownItems() {
    final dropdownItems = [
      StringConfig.male,
      StringConfig.female,
    ];

    return List.generate(dropdownItems.length, (index) {
      return buildDropdownItem(dropdownItems[index],
          showIcon: index >= 3, index: index);
    });
  }

  Widget buildDropdownItem(String option,
      {bool showIcon = false, required int index}) {
    final isSelected = index == profileController.selectedOptionIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          profileController.selectedOption = option;
          profileController.selectedOptionIndex = index;
          profileController.selectedOptionText = option;
          profileController.genderController.text = option;
          profileController.controller.hideTooltip();
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            vertical: SizeConfig.padding10, horizontal: SizeConfig.padding05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.borderRadius06),
          border:
              isSelected ? Border.all(color: ColorConfig.primaryColor) : null,
          color: isSelected ? ColorConfig.backgroundLightColor : null,
        ),
        child: Text(
          option,
          style: const TextStyle(
            fontSize: FontSizeConfig.body2Text,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamilyConfig.outfitRegular,
          ),
        ),
      ),
    );
  }
}

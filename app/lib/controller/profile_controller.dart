import 'dart:io';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/string_config.dart';
import 'package:super_tooltip/super_tooltip.dart';

class ProfileController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  final controller = SuperTooltipController();

  String selectedOption = "";
  String selectedOptionText = "";
  int? selectedOptionIndex;

  String selectedGender = StringConfig.male;

  bool isSearchOpen = false;
  bool isFocusedTextField1 = false;
  bool isFocusedTextField2 = false;
  bool isFocusedTextField3 = false;
  bool isFocusedTextField4 = false;
  bool isFocusedTextField5 = false;

  bool status = false;
  int selectedIndex = -1;

  bool isFAQ1 = false;
  bool isFAQ2 = false;
  bool isFAQ3 = false;
  bool isFAQ4 = false;
  bool isFAQ5 = false;
  bool isFAQ6 = false;

  final countryPicker = const FlCountryCodePicker();
  String selectedCountry = StringConfig.flagInitial;

  File? selectedImage;

  DateTime? selectedDate;

  final List<String> genderOptions = [StringConfig.male, StringConfig.female, StringConfig.other];

  List<String> profileOptions = [
    StringConfig.personalInfo,
    StringConfig.languages,
    StringConfig.faqs,
    StringConfig.logout,
  ];

  List<String> languagesList = [StringConfig.english, StringConfig.arabic, StringConfig.chinese, StringConfig.german, StringConfig.france, StringConfig.hindi, StringConfig.russian];
}

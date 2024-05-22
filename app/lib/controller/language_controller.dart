import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/controller/storage_controller.dart';

class LanguageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initializeController();
    loadSelectedLanguage();
  }

  RxString languageName = "English".obs;
  RxBool arb = false.obs;
  RxString language = "English".obs;
  Future<void> initializeController() async {
    var lng = await StorageController.instance.getLang() ?? "";

    languageName.value = lng.isNotEmpty ? lng : 'English';
  }

  Future<void> changeLanguage({String? language}) async {
    Locale locale;
    switch (language) {
      case 'English':
        locale = const Locale('en', 'US');
        await StorageController.instance.setLang('English');
        await StorageController.instance.setLanguage('en');
        await StorageController.instance.setCountryCode('US');
        languageName.value = 'English';
        break;
      case 'Hindi':
        locale = const Locale('hi', 'IN');
        await StorageController.instance.setLang('Hindi');
        await StorageController.instance.setLanguage('hi');
        await StorageController.instance.setCountryCode('IN');
        languageName.value = 'Hindi';
        break;
      case 'Arabic':
        locale = const Locale('ar', 'SA');
        await StorageController.instance.setLang('Arabic');
        await StorageController.instance.setLanguage('ar');
        await StorageController.instance.setCountryCode('SA');
        arb.value = true;
        languageName.value = 'Arabic';
        break;
      case 'Chinese':
        locale = const Locale('zh', 'CN');
        await StorageController.instance.setLang('Chinese');
        await StorageController.instance.setLanguage('zh');
        await StorageController.instance.setCountryCode('CN');
        languageName.value = 'Chinese';
        break;
      case 'French':
        locale = const Locale('fr', 'FR');
        await StorageController.instance.setLang('French');
        await StorageController.instance.setLanguage('fr');
        await StorageController.instance.setCountryCode('FR');
        languageName.value = 'French';
        break;
      case 'German':
        locale = const Locale('de', 'DE');
        await StorageController.instance.setLang('German');
        await StorageController.instance.setLanguage('de');
        await StorageController.instance.setCountryCode('DE');
        languageName.value = 'German';
        break;
      case 'Russian':
        locale = const Locale('ru', 'RU');
        await StorageController.instance.setLang('Russiab');
        await StorageController.instance.setLanguage('ru');
        await StorageController.instance.setCountryCode('RU');
        languageName.value = 'Russian';
        break;
      case '':
        locale = const Locale('en', 'US');
        await StorageController.instance.setLang('English');
        await StorageController.instance.setLanguage('en');
        await StorageController.instance.setCountryCode('US');
        languageName.value = 'English';
        break;

      default:
        locale = const Locale('en', 'US');
        await StorageController.instance.setLang('English');
        languageName.value = 'English';
    }

    Get.updateLocale(locale);
  }

  void loadSelectedLanguage() async {
    language.value = await StorageController.instance.getLanguage() ?? "";
    language.value == "Arabic" || language.value == 'ar'
        ? arb.value = true
        : arb.value = false;
  }
}

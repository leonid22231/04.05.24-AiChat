import 'package:flutter/material.dart';
import 'package:prime_ai_flutter_ui_kit/app.dart';
import 'package:prime_ai_flutter_ui_kit/controller/storage_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? languageCode = await StorageController.instance.getLanguage();
  String? countryCode = await StorageController.instance.getCountryCode();
  runApp(AIApp(
    countryCode: countryCode,
    languageCode: languageCode,
  ));
}

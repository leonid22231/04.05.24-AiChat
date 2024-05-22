import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prime_ai_flutter_ui_kit/app.dart';
import 'package:prime_ai_flutter_ui_kit/controller/storage_controller.dart';
import 'package:prime_ai_flutter_ui_kit/firebase_options.dart';
import 'package:prime_ai_flutter_ui_kit/utils/globals.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  String? languageCode = await StorageController.instance.getLanguage();
  String? countryCode = await StorageController.instance.getCountryCode();
  Globals.initRest();
  runApp(AIApp(
    countryCode: countryCode,
    languageCode: languageCode,
  ));
}

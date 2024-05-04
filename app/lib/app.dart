import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/string_config.dart';
import 'package:prime_ai_flutter_ui_kit/localization/app_translation.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';
import 'package:prime_ai_flutter_ui_kit/views/splash/splash_view.dart';

class AIApp extends StatelessWidget {
  const AIApp({Key? key, this.languageCode, this.countryCode})
      : super(key: key);
  final String? languageCode;
  final String? countryCode;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translationsKeys: AppTranslation.translationsKeys,
      locale: Locale(languageCode ?? "en", countryCode ?? "US"),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      title: StringConfig.appName,
      home: SplashView(),
      getPages: AppRoutes.pages,
    );
  }
}

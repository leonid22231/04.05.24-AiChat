// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/color_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/image_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/size_config.dart';
import 'package:prime_ai_flutter_ui_kit/controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);

  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: const Scaffold(
        backgroundColor: ColorConfig.backgroundWhiteColor,
        body: Center(
          child: Image(
            image: AssetImage(ImageConfig.appLogo),
            width: SizeConfig.width136,
            height: SizeConfig.height108,
          ),
        )
      ),
    );
  }
}

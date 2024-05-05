import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    islogin();
  }

  Future<void> islogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString("email");
    bool? remember = prefs.getBool("remember");
    bool? welcome = prefs.getBool("welcome");
    debugPrint("Email $email and remember is $remember");
    if (email != null && (remember ?? false)) {
      Timer(const Duration(seconds: 4), () => Get.offAllNamed(AppRoutes.bottomBarView));
    } else {
      prefs.remove("email");
      prefs.remove("remember");
      if (welcome ?? true) {
        Timer(const Duration(seconds: 4), () => Get.offAllNamed(AppRoutes.onBoardingView));
      } else {
        Timer(const Duration(seconds: 4), () => Get.offAllNamed(AppRoutes.signInView));
      }
    }
  }
}

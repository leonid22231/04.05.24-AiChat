import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/api/RestClient.dart';
import 'package:prime_ai_flutter_ui_kit/utils/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    islogin();
  }

  Future<void> islogin() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      await FirebaseAuth.instance.signInAnonymously();
      user = FirebaseAuth.instance.currentUser;
    }
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("uid", user!.uid);
    await Globals.client.login(user.uid, Platform.localeName.split("_")[0]);
    Timer(const Duration(seconds: 4),
        () => Get.offAllNamed(AppRoutes.bottomBarView));
  }
}

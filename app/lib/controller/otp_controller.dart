import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  TextEditingController pinController = TextEditingController();

  final GlobalKey<FormState> formOTPKey = GlobalKey<FormState>();

  final FocusNode pinFocusNode = FocusNode();

  bool pin = false;
}

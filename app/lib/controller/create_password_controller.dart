import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreatePasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isFocusedTextField1 = false;
  bool isFocusedTextField2 = false;

  bool obscureText = true;
  bool obscureText2 = true;
}
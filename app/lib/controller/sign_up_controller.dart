import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formSignUpKey = GlobalKey<FormState>();

  bool isEmail = false;
  bool isPassword = false;
  bool showError = false;
  bool showError2 = false;
  bool isFocusedTextField1 = false;
  bool isFocusedTextField2 = false;
  bool? rememberMe = false;
  bool obscureText = true;
}
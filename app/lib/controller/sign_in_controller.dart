import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isEmail = true;
  bool isPassword = true;
  bool showError = false;
  bool showError2 = false;
  bool isFocusedTextField1 = false;
  bool isFocusedTextField2 = false;
  bool? rememberMe = false;
  bool obscureText = true;
}
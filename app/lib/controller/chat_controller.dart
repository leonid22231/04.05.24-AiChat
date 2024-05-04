import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  TextEditingController askController = TextEditingController();

  final FocusNode focusNode = FocusNode();

  bool isFocused = false;
  bool isSendButtonPressed = false;
  bool isUpdated = false;
  bool isUpdatedImage1 = false;
  bool isUpdatedImage2 = false;
  bool isUpdatedImage3 = false;
  bool isUpdatedImage4 = false;
  bool isUpdatedImage5 = false;
  bool isUpdatedImage6 = false;

  ValueNotifier<bool> isTextEntered = ValueNotifier<bool>(false);

  ScrollPhysics listViewPhysics = const AlwaysScrollableScrollPhysics();
}
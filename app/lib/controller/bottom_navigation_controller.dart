import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/views/chat/chat_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/history/history_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/more/more_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/profile/profile_view.dart';

class BottomNavigationController extends GetxController {
  var pageIndex = 0.obs;

  void changePage(int index) {
    pageIndex.value = index;
  }

  var cameFromImageGenerator = false.obs;

  final List<Widget> pages = <Widget>[
    ChatView(),
    const MoreView(),
    const HistoryView(),
    const ProfileView(),
  ];
}

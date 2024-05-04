import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/image_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/string_config.dart';
import 'package:super_tooltip/super_tooltip.dart';

class HistoryController extends GetxController {
  TabController? tabController;

  final controller = SuperTooltipController();

  TextEditingController searchController = TextEditingController();

  String searchQuery = '';

  bool isNoDataFound = false;
  bool isSearchOpen = false;
  bool isFullScreen = false;
  bool isPlaying = false;
  bool isLike = false;
  bool isDislike = false;

  List<SuperTooltipController> tooltipControllers = List.generate(
    3,
    (index) => SuperTooltipController(),
  );

  List<SuperTooltipController> tooltipChatControllers1 = List.generate(
    2,
        (index) => SuperTooltipController(),
  );

  List<SuperTooltipController> tooltipChatControllers2 = List.generate(
    3,
        (index) => SuperTooltipController(),
  );

  List<SuperTooltipController> tooltipChatControllers3 = List.generate(
    2,
        (index) => SuperTooltipController(),
  );

  List<String> filteredVideoTitles = [];

  List<String> historyVideoImages = [
    ImageConfig.historyVideo1,
    ImageConfig.historyVideo2,
    ImageConfig.historyVideo3,
  ];

  List<String> historyVideoTitles = [
    StringConfig.featureOfArtificialIntelligence,
    StringConfig.exploringVirtualReality,
    StringConfig.innovationInAge,
  ];

  List<String> historyTiming = [
    StringConfig.historyTime1,
    StringConfig.historyTime2,
    StringConfig.historyTime3,
  ];

  List<String> historyDays = [
    StringConfig.historyToday,
    StringConfig.historyYesterday,
    StringConfig.historyDay,
  ];

  List<String> historyChat1Titles = [
    StringConfig.bDayWishesForEmployee,
    StringConfig.bDayWishesAndReflection,
  ];

  List<String> historyChat1Timings = [
    StringConfig.chatHistoryTime1,
    StringConfig.chatHistoryTime2,
  ];

  List<String> historyChat2Titles = [
    StringConfig.randomCharacterDetected,
    StringConfig.reflectingOnIndependence,
    StringConfig.aiColorScheme,
  ];

  List<String> historyChat2Timings = [
    StringConfig.chatHistoryTime3,
    StringConfig.chatHistoryTime4,
    StringConfig.chatHistoryTime5,
  ];

  List<String> historyChat3Titles = [
    StringConfig.randomCharacterDetected,
    StringConfig.reflectingOnIndependence,
  ];

  List<String> historyChat3Timings = [
    StringConfig.chatHistoryTime6,
    StringConfig.chatHistoryTime5,
  ];
}

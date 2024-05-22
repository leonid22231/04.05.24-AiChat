import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/image_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/string_config.dart';
import 'package:prime_ai_flutter_ui_kit/routes/app_routes.dart';

class MoreController extends GetxController {
  TabController? tabController;
  late AnimationController controller;
  late Tween<double> tween;

  TextEditingController searchController = TextEditingController();

  ValueNotifier<double> sliderValueNotifier = ValueNotifier<double>(0.0);

  bool isChildVisible = false;
  bool isChild2Visible = false;
  bool isSearchOpen = false;
  bool isPlaying = false;
  bool isAnimationCompleted = false;

  double loaderPosition = 0.0;
  Timer? animationTimer;
  int animationSteps = 100;
  int currentStep = 0;
  //TODO: WRITING
  List<String> writingSectionImage = [
    ImageConfig.articles,
    ImageConfig.translateLanguage,
    ImageConfig.essay,
  ];

  List<String> writingSectionMainStrings = [
    StringConfig.articles,
    StringConfig.translateLanguage,
    StringConfig.essay,
  ];

  List<String> writingSectionSubStrings = [
    StringConfig.generateWellWritten,
    StringConfig.translateFromAnother,
    StringConfig.generateEssayWellWritten,
  ];
  //TODO: CREATIVE
  List<String> creativeSectionImage = [
    ImageConfig.songLyrics1,
    ImageConfig.articles,
    ImageConfig.songLyrics2,
  ];

  List<String> creativeSectionMainStrings = [
    StringConfig.songLyrics,
    StringConfig.storyTeller,
    StringConfig.songLyrics,
  ];

  List<String> creativeSectionSubStrings = [
    StringConfig.generateWellWritten,
    StringConfig.generateStories,
    StringConfig.generateWellWritten,
  ];
  //TODO: BUSINESS
  List<String> businessSectionImage = [
    ImageConfig.answerInterview,
    ImageConfig.explainCode,
    ImageConfig.summarize,
    ImageConfig.story,
    ImageConfig.story,
  ];

  List<String> businessSectionMainStrings = [
    StringConfig.answerInterview,
    StringConfig.explainCode,
    StringConfig.summarize,
    StringConfig.story,
    StringConfig.story,
  ];

  List<String> businessSectionSubStrings = [
    StringConfig.generateAAnswer,
    StringConfig.generateStories,
    StringConfig.extractKeyPoints,
    StringConfig.storyTopic,
    StringConfig.storyTopic,
  ];
  //TODO: LAWS
  List<String> lawsSectionImage = [
    ImageConfig.writeCode,
    ImageConfig.codeExplainLappy,
    ImageConfig.story,
    ImageConfig.summarize,
  ];
  List<String> lawsSectionMainString = [
    StringConfig.writeCode,
    StringConfig.explainCode,
    StringConfig.story,
    StringConfig.summarize,
  ];
  List<String> lawsSectionSubStrings = [
    StringConfig.writeApp,
    StringConfig.generateStories,
    StringConfig.storyTopic,
    StringConfig.extractKeyPoints,
  ];
  //TODO: DEVELOPERS
  List<String> developersSectionImage = [
    ImageConfig.writeCode,
    ImageConfig.codeExplainLappy,
    ImageConfig.story,
  ];

  List<String> developersSectionMainStrings = [
    StringConfig.writeCode,
    StringConfig.explainCode,
    StringConfig.story,
  ];

  List<String> developersSectionSubStrings = [
    StringConfig.writeApp,
    StringConfig.generateStories,
    StringConfig.storyTopic,
  ];
  //TODO: SOCIAL
  List<String> socialSectionImage = [
    ImageConfig.answerInterview,
    ImageConfig.explainCode,
    ImageConfig.summarize,
    ImageConfig.story,
    ImageConfig.story,
  ];

  List<String> socialSectionMainStrings = [
    StringConfig.answerInterview,
    StringConfig.explainCode,
    StringConfig.summarize,
    StringConfig.story,
    StringConfig.story,
  ];

  List<String> socialSectionSubStrings = [
    StringConfig.generateAAnswer,
    StringConfig.generateStories,
    StringConfig.extractKeyPoints,
    StringConfig.storyTopic,
    StringConfig.storyTopic,
  ];
  //TODO: OTHER
  List<String> othersSectionImage = [
    ImageConfig.birthday,
    ImageConfig.tellAJoke,
  ];

  List<String> othersSectionMainStrings = [
    StringConfig.birthday,
    StringConfig.tellAJoke,
  ];

  List<String> othersSectionSubStrings = [
    StringConfig.createSincere,
    StringConfig.writeJokes,
  ];

  List<String> navigationIndexString = [
    AppRoutes.moreArticlesChatView,
    AppRoutes.moreTranslateLanguageChatView,
    AppRoutes.moreArticlesChatView,
    AppRoutes.moreTranslateLanguageChatView,
    AppRoutes.moreArticlesChatView,
    AppRoutes.moreTranslateLanguageChatView,
  ];
}

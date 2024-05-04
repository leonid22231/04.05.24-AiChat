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

  List<String> writingSectionImage = [
    ImageConfig.articles,
    ImageConfig.translateLanguage,
    ImageConfig.essay,
    ImageConfig.summarize,
    ImageConfig.story,
  ];

  List<String> writingSectionMainStrings = [
    StringConfig.articles,
    StringConfig.translateLanguage,
    StringConfig.essay,
    StringConfig.summarize,
    StringConfig.story,
  ];

  List<String> writingSectionSubStrings = [
    StringConfig.generateWellWritten,
    StringConfig.translateFromAnother,
    StringConfig.generateEssayWellWritten,
    StringConfig.extractKeyPoints,
    StringConfig.storyTopic,
  ];

  List<String> businessSectionImage = [
    ImageConfig.answerInterview,
    ImageConfig.explainCode,
    ImageConfig.summarize,
    ImageConfig.story,
  ];

  List<String> businessSectionMainStrings = [
    StringConfig.answerInterview,
    StringConfig.explainCode,
    StringConfig.summarize,
    StringConfig.story,
  ];

  List<String> businessSectionSubStrings = [
    StringConfig.generateAAnswer,
    StringConfig.generateStories,
    StringConfig.extractKeyPoints,
    StringConfig.storyTopic,
  ];

  List<String> developersSectionImage = [
    ImageConfig.writeCode,
    ImageConfig.codeExplainLappy,
    ImageConfig.story,
    ImageConfig.summarize,
  ];

  List<String> developersSectionMainStrings = [
    StringConfig.writeCode,
    StringConfig.explainCode,
    StringConfig.story,
    StringConfig.summarize,
  ];

  List<String> developersSectionSubStrings = [
    StringConfig.writeApp,
    StringConfig.generateStories,
    StringConfig.storyTopic,
    StringConfig.extractKeyPoints,
  ];

  List<String> othersSectionImage = [
    ImageConfig.birthday,
    ImageConfig.tellAJoke,
    ImageConfig.story,
    ImageConfig.summarize,
  ];

  List<String> othersSectionMainStrings = [
    StringConfig.birthday,
    StringConfig.tellAJoke,
    StringConfig.story,
    StringConfig.summarize,
  ];

  List<String> othersSectionSubStrings = [
    StringConfig.createSincere,
    StringConfig.writeJokes,
    StringConfig.storyTopic,
    StringConfig.extractKeyPoints,
  ];

  List<String> creativeSectionImage = [
    ImageConfig.songLyrics1,
    ImageConfig.articles,
    ImageConfig.songLyrics2,
    ImageConfig.explainCode,
  ];

  List<String> creativeSectionMainStrings = [
    StringConfig.songLyrics,
    StringConfig.storyTeller,
    StringConfig.songLyrics,
    StringConfig.explainCode,
  ];

  List<String> creativeSectionSubStrings = [
    StringConfig.generateWellWritten,
    StringConfig.generateStories,
    StringConfig.generateWellWritten,
    StringConfig.generateStories,
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
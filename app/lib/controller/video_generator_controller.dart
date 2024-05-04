// ignore_for_file: equal_keys_in_map

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/color_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/image_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/string_config.dart';
import 'package:super_tooltip/super_tooltip.dart';

class VideoGeneratorController extends GetxController {

  TextEditingController scriptController = TextEditingController();
  TextEditingController emojiController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  double textFieldWidth = 100.0;
  double textFieldHeight = 40.0;
  double textFieldX = 0.0;
  double textFieldY = 0.0;
  bool isTextFieldVisible = false;
  // Offset textFieldPosition = const Offset(50, 50);
  Offset position = const Offset(0, 0);
  double top = 0;
  double left = 0;
  double containerWidth = 120;
  double containerHeight = 40;
  double containerRotation = 0;
  TextEditingController textEditingController = TextEditingController();
  late AnimationController animateController;
  int currentValue = 1;
  Color selectedColor = ColorConfig.primaryColor;
  Color selectedColor2 = ColorConfig.primaryColor;

  AudioPlayer audioPlayer = AudioPlayer();
  final audioController = RecorderController();

  final controller = SuperTooltipController();
  final controller2 = SuperTooltipController();

  String selectedOption = "";
  String selectedOptionText = "";
  int? selectedOptionIndex;
  String selectedOption2 = "";
  String selectedOptionText2 = "";
  int? selectedOptionIndex2;

  String selectedSpeed = StringConfig.onePointZeroX;
  String selectedSecond = StringConfig.zeroPointFiveSecond;

  TabController? tabController;
  String? audioFilePath;
  bool isContainerOpen = false;
  bool emojiShowing = false;
  bool isPlaying = false;
  bool showStickerView = false;
  double value = 60.0;
  double value2 = 60.0;
  int characterCount = 0;
  double sliderValue = 0.0;
  double maxDuration = 1.0;
  double percentage = 0.0;
  int selectedFramingSizeIndex = 0;
  int step = 10;
  final selectedImageIndex = (-1).obs;
  final RxList<int> selectedAvatarImageIndices = <int>[].obs;
  RxInt selectedLanguageIndex = (-1).obs;
  RxInt selectedVoiceIndex = RxInt(-1);
  RxInt selectedMaleVoiceIndex = RxInt(-1);
  int selectedBgImageIndex = -1;
  int sceneNumber = 2;

  List<Widget> drawerItems = [];

  onBackspacePressed() {
    emojiController
      ..text = emojiController.text.characters.toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: emojiController.text.length));
  }

  void selectLanguage(int index) {
    selectedLanguageIndex.value = index;
  }

  void selectImage(int index) {
    selectedImageIndex.value = index;
    if (index >= 0 && index < selectAvtarImage.length) {
      selectedAvatarImageIndices.add(index);
    }
  }

  final RxList<bool> selectedAvatars = <bool>[].obs;
  final RxList<bool> selectedFrames = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    selectedAvatars.assignAll(List.generate(selectAvtarImage.length, (index) => false));
    selectedFrames.assignAll(List.generate(selectFramingImage.length, (index) => false));
  }

  void toggleAvatarSelection(int index) {
    selectedAvatars[index] = !selectedAvatars[index];
  }

  void deselectAllAvatars() {
    selectedAvatars.assignAll(List.generate(selectAvtarImage.length, (index) => false));
  }

  void toggleFrameSelection(int index) {
    selectedFrames[index] = !selectedFrames[index];
  }

  void deselectAllFrames() {
    selectedFrames.assignAll(List.generate(selectFramingImage.length, (index) => false));
  }

  List<String> templateListImage = [
    ImageConfig.officeInterior,
    ImageConfig.business,
    ImageConfig.digitalMarketing,
    ImageConfig.finance,
    ImageConfig.healthcare,
    ImageConfig.sportAndFitness,
    ImageConfig.industry,
    ImageConfig.socialMedia,
  ];

  List<String> templatesListName = [
    StringConfig.officeInterior,
    StringConfig.business,
    StringConfig.digitalMarketing,
    StringConfig.finance,
    StringConfig.healthcare,
    StringConfig.sportAndFitness,
    StringConfig.industry,
    StringConfig.socialMedia,
  ];

  List<String> videoToolsImage = [
    ImageConfig.sceneTool,
    ImageConfig.framingTool,
    ImageConfig.avtarTool,
    ImageConfig.backgroundTool,
    ImageConfig.textTool,
    ImageConfig.musicTool,
    ImageConfig.languageTool,
    ImageConfig.styleTool,
    ImageConfig.voiceTool,
  ];

  List<String> videoToolsName = [
    StringConfig.scene,
    StringConfig.framing,
    StringConfig.avatar,
    StringConfig.background,
    StringConfig.text,
    StringConfig.music,
    StringConfig.language,
    StringConfig.style,
    StringConfig.voice,
  ];

  List<String> selectAvtarImage = [
    ImageConfig.avtar1,
    ImageConfig.avtar2,
    ImageConfig.avtar4,
    ImageConfig.avtar5,
    ImageConfig.avtar3,
    ImageConfig.avtar6,
    ImageConfig.avtar7,
    ImageConfig.avtar8,
  ];

  List<String> selectAvtarTImage = [
    ImageConfig.avtarT1,
    ImageConfig.avtarT2,
    ImageConfig.avtarT3,
    ImageConfig.avtarT4,
    ImageConfig.avtarT5,
    ImageConfig.avtarT6,
    ImageConfig.avtarT7,
    ImageConfig.avtarT8,
  ];

  List<String> selectFramingImage = [
    ImageConfig.framing1,
    ImageConfig.framing2,
    ImageConfig.framing3,
    ImageConfig.framing4,
    ImageConfig.framing5,
    ImageConfig.framing6,
    ImageConfig.framing7,
  ];

  List<String> selectFramingSize = [
    StringConfig.framing1,
    StringConfig.framing2,
    StringConfig.framing3,
    StringConfig.framing4,
    StringConfig.framing5,
    StringConfig.framing6,
    StringConfig.framing7,
  ];

  List<String> selectBackgroundImage = [
    ImageConfig.bgImage1,
    ImageConfig.bgImage2,
    ImageConfig.bgImage3,
    ImageConfig.bgImage4,
    ImageConfig.bgImage5,
    ImageConfig.bgImage6,
    ImageConfig.bgImage7,
    ImageConfig.bgImage8,
    ImageConfig.bgImage9,
    ImageConfig.bgImage10,
    ImageConfig.bgImage11,
    ImageConfig.bgImage5,
  ];

  List<String> selectFemaleVoice = [
    StringConfig.voiceFRochel,
    StringConfig.voiceFRochel,
    StringConfig.voiceFEmily,
    StringConfig.voiceFDorothy,
    StringConfig.voiceFBella,
    StringConfig.voiceFCharlotte,
  ];

  List<String> selectMaleVoice = [
    StringConfig.voiceMRajesh,
    StringConfig.voiceMKevin,
  ];

  List<Color> colorList = [
    ColorConfig.color1,
    ColorConfig.color2,
    ColorConfig.color3,
    ColorConfig.color4,
    ColorConfig.color5,
    ColorConfig.color6,
    ColorConfig.color7,
    ColorConfig.color8,
    ColorConfig.color9,
    ColorConfig.color10,
    ColorConfig.color11,
    ColorConfig.color12,
  ];

  Map<String, Size> sizeMappings = {
    StringConfig.framing1: const Size(335.0, 306.0),
    StringConfig.framing2: const Size(335.0, 112.5),
    StringConfig.framing3: const Size(306.0, 335.0),
    StringConfig.framing4: const Size(140.0, 335.0),
    StringConfig.framing5: const Size(100.0, 140.0),
    StringConfig.framing6: const Size(150.0, 100.0),
    StringConfig.framing7: const Size(335.0, 306.0),
  };
}
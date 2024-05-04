import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/image_config.dart';

import '../config/string_config.dart';

class ImageGeneratorController extends GetxController {
  TextEditingController imageSearchController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  String initialSearchText = "";
  String selectedOption = "";
  String selectedOptionText = "";
  // String selectedOptionText2 = "";
  int? selectedOptionIndex;
  int? selectedOptionIndex2;

  bool isSearchOpen = false;
  bool isGenerateImageButtonPressed = false;
  bool isSelectedItems = false;
  List<bool> isImagesVisibleList = List.generate(4, (index) => false);

  String selectedSize = StringConfig.selectSize;
  String selectedStyle = StringConfig.selectStyle;

  final FocusNode focusNode = FocusNode();

  List<String> gridFishImages = [
    ImageConfig.fishImage1,
    ImageConfig.fishImage2,
    ImageConfig.fishImage3,
    ImageConfig.fishImage4,
  ];
}
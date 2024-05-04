import 'package:prime_ai_flutter_ui_kit/config/image_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/string_config.dart';

class OnBoardingModel {
  String? title;
  String? description;
  String? image;

  OnBoardingModel({this.title, this.description, this.image});
}

List<OnBoardingModel> onBoardingModelList = [
  OnBoardingModel(
    title: StringConfig.boardingTitle1,
    description: StringConfig.boardingDescription1,
    image: ImageConfig.boardingRobot1,
  ),
  OnBoardingModel(
    title: StringConfig.boardingTitle2,
    description: StringConfig.boardingDescription1,
    image: ImageConfig.boardingRobot2,
  ),
  OnBoardingModel(
    title: StringConfig.boardingTitle3,
    description: StringConfig.boardingDescription1,
    image: ImageConfig.boardingRobot3,
  ),
];
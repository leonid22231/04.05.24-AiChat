import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/image_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/string_config.dart';

class UpgradeProController extends GetxController {

  int selectedIndex = -1;

  List<String> featuresList = [
    StringConfig.feature1,
    StringConfig.feature2,
    StringConfig.feature3,
    StringConfig.feature4,
    StringConfig.feature5,
    StringConfig.feature6,
    StringConfig.feature7,
    StringConfig.feature8,
    StringConfig.feature9,
    StringConfig.feature10,
    StringConfig.feature11,
    StringConfig.feature12,
    StringConfig.feature13,
    StringConfig.feature14,
  ];

  List<String> priceList = [
    StringConfig.dollar20,
    StringConfig.dollar40,
    StringConfig.dollar70,
  ];

  List<String> planMonthList = [
    StringConfig.month1,
    StringConfig.month6,
    StringConfig.month12,
  ];

  List<String> benefitList = [
    StringConfig.save10,
    StringConfig.save40,
    StringConfig.save40,
  ];

  List<String> planFeatureList = [
    StringConfig.removeAddsAndWatermark,
    StringConfig.unlimitedVideoGeneration,
    StringConfig.cloudStorageOf50GB,
  ];

  List<String> planFeatureList2 = [
    StringConfig.collaborationAndTeamFeature,
    StringConfig.priorityCustomerSupport,
    StringConfig.downloadVideoInHighResolution,
    StringConfig.unlimitedVideoGeneration,
  ];

  List<String> planFeatureList3 = [
    StringConfig.fasterProcessingTimes,
    StringConfig.priorityAccessToNewFeatures,
    StringConfig.cloudStorageOf50GB,
  ];

  List<String> paymentModeList = [
    StringConfig.payPal,
    StringConfig.googlePay,
    StringConfig.applePay,
    StringConfig.visaCard,
    StringConfig.americanExpressCard,
  ];

  List<String> paymentModeImage = [
    ImageConfig.payPal,
    ImageConfig.googlePay,
    ImageConfig.applePay,
    ImageConfig.visaCard,
    ImageConfig.americanExpress,
  ];
}
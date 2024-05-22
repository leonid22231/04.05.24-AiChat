import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/config/image_config.dart';
import 'package:prime_ai_flutter_ui_kit/config/string_config.dart';

class UpgradeProController extends GetxController {
  int selectedIndex = -1;

  List<String> featuresList = [
    StringConfig.feature1.tr,
    StringConfig.feature2.tr,
    StringConfig.feature3.tr,
    StringConfig.feature4.tr,
    StringConfig.feature5.tr,
    StringConfig.feature6.tr,
    StringConfig.feature7.tr,
    StringConfig.feature8.tr,
    StringConfig.feature9.tr,
    StringConfig.feature10.tr,
    StringConfig.feature11.tr,
    StringConfig.feature12.tr,
    StringConfig.feature13.tr,
    StringConfig.feature14.tr,
  ];

  List<String> priceList = [
    StringConfig.dollar20.tr,
    StringConfig.dollar40.tr,
    StringConfig.dollar70.tr,
  ];

  List<String> planMonthList = [
    StringConfig.month1.tr,
    StringConfig.month6.tr,
    StringConfig.month12.tr,
  ];

  List<String> benefitList = [
    StringConfig.save10.tr,
    StringConfig.save40.tr,
    StringConfig.save40.tr,
  ];

  List<String> planFeatureList = [
    StringConfig.removeAddsAndWatermark.tr,
    StringConfig.unlimitedVideoGeneration.tr,
    StringConfig.cloudStorageOf50GB.tr,
  ];

  List<String> planFeatureList2 = [
    StringConfig.collaborationAndTeamFeature.tr,
    StringConfig.priorityCustomerSupport.tr,
    StringConfig.downloadVideoInHighResolution.tr,
    StringConfig.unlimitedVideoGeneration.tr,
  ];

  List<String> planFeatureList3 = [
    StringConfig.fasterProcessingTimes.tr,
    StringConfig.priorityAccessToNewFeatures.tr,
    StringConfig.cloudStorageOf50GB.tr,
  ];

  List<String> paymentModeList = [
    StringConfig.payPal.tr,
    StringConfig.googlePay.tr,
    StringConfig.applePay.tr,
    StringConfig.visaCard.tr,
    StringConfig.americanExpressCard.tr,
  ];

  List<String> paymentModeImage = [
    ImageConfig.payPal,
    ImageConfig.googlePay,
    ImageConfig.applePay,
    ImageConfig.visaCard,
    ImageConfig.americanExpress,
  ];
}

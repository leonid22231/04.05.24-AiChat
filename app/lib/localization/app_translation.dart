import 'package:prime_ai_flutter_ui_kit/localization/ar_sa.dart';
import 'package:prime_ai_flutter_ui_kit/localization/de_de.dart';
import 'package:prime_ai_flutter_ui_kit/localization/en_us.dart';
import 'package:prime_ai_flutter_ui_kit/localization/fr_fr.dart';
import 'package:prime_ai_flutter_ui_kit/localization/hi_in.dart';
import 'package:prime_ai_flutter_ui_kit/localization/zh_cn.dart';


abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en": enUS,
    "hi": hiIN,
    "ar": arSA,
    "de": deDE,
    "fr": frFR,
    "zh": zhCN
  };
}

import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/views/bottom_bar/bottom_bar_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/chat/chat_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/chat/start_chat_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/history/history_chat_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/history/history_full_video_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/more/download_video_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/more/image_generator_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/more/more_chat/more_articles_chat_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/more/more_chat/more_translate_language_chat_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/more/more_tabs/writing_see_all_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/more/video_create_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/more/video_generate_tools/select_background_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/more/video_generator_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/on_boarding/on_boarding_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/otp/otp_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/pro_membership/choose_plan_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/pro_membership/review_summary_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/pro_membership/select_payment_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/pro_membership/upgrade_to_pro_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/profile/complete_your_profile_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/profile/profile_lists/faqs_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/profile/profile_lists/language_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/profile/profile_lists/personal_info_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/sign_in/create_password_view/create_password_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/sign_in/forgot_password/forgot_password_otp_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/sign_in/forgot_password/forgot_password_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/sign_in/sign_in_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/sign_up/sign_up_view.dart';
import 'package:prime_ai_flutter_ui_kit/views/splash/splash_view.dart';

class AppRoutes {
  static const String splashView = "/splash_view";
  static const String onBoardingView = "/on_boarding_view";
  static const String signInView = "/sign_in_view";
  static const String signUpView = "/sign_up_view";
  static const String otpView = "/otp_view";
  static const String completeYourProfileView = "/complete_your_profile_view";
  static const String forgotPasswordView = "/forgot_password_view";
  static const String forgotPasswordOTPView = "/forgot_password_otp_view";
  static const String createPasswordView = "/create_password_view";
  static const String chatView = "/chat_view";
  static const String bottomBarView = "/bottom_bar_view";
  static const String startChatView = "/start_chat_view";
  static const String writingSeeAllView = "/writing_see_all_view";
  static const String moreArticlesChatView = "/more_articles_chat_view";
  static const String moreTranslateLanguageChatView = "/more_translate_language_chat_view";
  static const String imageGeneratorView = "/image_generator_view";
  static const String videoGeneratorView = "/video_generator_view";
  static const String videoCreateView = "/video_create_view";
  static const String selectBackgroundView = "/select_background_view";
  static const String downloadVideoView = "/download_video_view";
  static const String historyFullVideoView = "/history_full_video_view";
  static const String personalInfoView = "/personal_info_view";
  static const String languageView = "/language_view";
  static const String faqsView = "/faqs_view";
  static const String upgradeToProView = "/upgrade_to_pro_view";
  static const String choosePlanView = "/choose_plan_view";
  static const String selectPaymentView = "/select_payment_view";
  static const String reviewSummaryView = "/review_summary_view";
  static const String historyChatView = "/history_chat_view";
  static const String articlesView = "/articles_view";
  static const String translateLanguageView = "/translate_language_view";

  static List<GetPage> pages = [
    GetPage(name: splashView, page: () => SplashView()),
    GetPage(name: onBoardingView, page: () => OnBoardingView()),
    GetPage(name: signInView, page: () => const SignInView()),
    GetPage(name: signUpView, page: () => const SignUpView()),
    GetPage(name: otpView, page: () => OTPView()),
    GetPage(name: completeYourProfileView, page: () => const CompleteYourProfileView()),
    GetPage(name: forgotPasswordView, page: () => const ForgotPasswordView()),
    GetPage(name: forgotPasswordOTPView, page: () => ForgotPasswordOTPView()),
    GetPage(name: createPasswordView, page: () => const CreatePasswordView()),
    GetPage(name: chatView, page: () => ChatView()),
    GetPage(name: bottomBarView, page: () => BottomBarView()),
    GetPage(name: startChatView, page: () => const StartChatView()),
    GetPage(name: writingSeeAllView, page: () => const WritingSeeAllView()),
    GetPage(name: moreArticlesChatView, page: () => const MoreArticlesChatView()),
    GetPage(name: moreTranslateLanguageChatView, page: () => const MoreTranslateLanguageChatView()),
    GetPage(name: imageGeneratorView, page: () => const ImageGeneratorView()),
    GetPage(name: videoGeneratorView, page: () => VideoGeneratorView()),
    GetPage(name: videoCreateView, page: () => const VideoCreateView()),
    GetPage(name: selectBackgroundView, page: () => SelectBackgroundView()),
    GetPage(name: downloadVideoView, page: () => const DownloadVideoView()),
    GetPage(name: historyFullVideoView, page: () => const HistoryFullVideoView()),
    GetPage(name: personalInfoView, page: () => const PersonalInfoView()),
    GetPage(name: languageView, page: () => const LanguageView()),
    GetPage(name: faqsView, page: () => const FAQsView()),
    GetPage(name: upgradeToProView, page: () => UpgradeToProView()),
    GetPage(name: choosePlanView, page: () => ChoosePlanView()),
    GetPage(name: selectPaymentView, page: () => const SelectPaymentView()),
    GetPage(name: reviewSummaryView, page: () => ReviewSummaryView()),
    GetPage(name: historyChatView, page: () => const HistoryChatView()),
    GetPage(name: articlesView, page: () => const MoreArticlesChatView()),
    GetPage(name: translateLanguageView, page: () => const MoreTranslateLanguageChatView()),
  ];
}

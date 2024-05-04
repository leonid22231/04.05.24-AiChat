// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prime_ai_flutter_ui_kit/controller/chat_controller.dart';
import 'package:share_plus/share_plus.dart';
import 'package:super_tooltip/super_tooltip.dart';
import '../../config/color_config.dart';
import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';
import '../../config/image_config.dart';
import '../../config/size_config.dart';
import '../../config/string_config.dart';
import '../widget/common_app_bar.dart';

class StartChatView extends StatefulWidget {
  const StartChatView({Key? key}) : super(key: key);

  @override
  State<StartChatView> createState() => _StartChatViewState();
}

class _StartChatViewState extends State<StartChatView> {
  ChatController chatController = Get.put(ChatController());

  final _controller = SuperTooltipController();

  @override
  void initState() {
    super.initState();
    chatController.focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      chatController.isFocused = chatController.focusNode.hasFocus;
    });
  }

  void toggleTextAndImage() {
    setState(() {
      chatController.isUpdated = !chatController.isUpdated;
    });
  }

  @override
  void dispose() {
    chatController.focusNode.removeListener(_handleFocusChange);
    chatController.focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double containerWidth =
        chatController.isUpdated ? SizeConfig.width125 : SizeConfig.width144;
    String buttonText = chatController.isUpdated
        ? StringConfig.stopGenerating
        : StringConfig.regenerateResponse;
    AssetImage image = chatController.isUpdated
        ? const AssetImage(ImageConfig.checkFeedback)
        : const AssetImage(ImageConfig.refreshResponse);
    return Scaffold(
      backgroundColor: ColorConfig.backgroundWhiteColor,
      appBar: CommonAppBar(
        backgroundColor: ColorConfig.backgroundWhiteColor,
        centerTitle: true,
        title: StringConfig.aiAssistant,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: SizeConfig.padding05),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                ImageConfig.backArrow,
                width: SizeConfig.width24,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: SizeConfig.padding20,left: SizeConfig.padding20),
            child: GestureDetector(
              onTap: () async {
                await _controller.showTooltip();
              },
              child: SuperTooltip(
                controller: _controller,
                barrierColor: Colors.transparent,
                borderColor: ColorConfig.textWhiteColor,
                hasShadow: true,
                shadowSpreadRadius: .1,
                borderRadius: SizeConfig.borderRadius08,
                arrowBaseWidth: SizeConfig.width10,
                arrowLength: 9,
                content: GestureDetector(
                  onTap: () {
                    _controller.hideTooltip();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return customDeleteChatDialouge();
                      },
                    );
                  },
                  child: SizedBox(
                    width: SizeConfig.width105,
                    height: SizeConfig.height27,
                    child: Row(
                      children: [
                        Image.asset(
                          ImageConfig.deleteChat,
                          width: SizeConfig.width16,
                        ),
                        const SizedBox(
                          width: SizeConfig.width10,
                        ),
                        const Text(
                          StringConfig.deleteChat,
                          style: TextStyle(
                            fontFamily: FontFamilyConfig.outfitRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: FontSizeConfig.body1Text,
                            color: ColorConfig.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.more_vert_rounded,
                  size: SizeConfig.iconSize24,
                  color: ColorConfig.textColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: SizeConfig.padding20,
            right: SizeConfig.padding20,
            bottom: SizeConfig.padding20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: chatController.isSendButtonPressed
                    ? chatController.listViewPhysics
                    : const NeverScrollableScrollPhysics(),
                children: chatController.isSendButtonPressed
                    ? buildUpdatedChatContent()
                    : buildInitialChatDescriptionContent(),
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Visibility(
                      visible: chatController.isSendButtonPressed,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: SizeConfig.padding10,
                            bottom: SizeConfig.padding10),
                        child: GestureDetector(
                          onTap: () {
                            toggleTextAndImage();
                          },
                          child: Container(
                            width: containerWidth,
                            height: SizeConfig.height27,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.borderRadius06),
                              border: Border.all(
                                color: ColorConfig.textFieldBorderColor,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: image,
                                  width: SizeConfig.width12,
                                ),
                                const SizedBox(
                                  width: SizeConfig.width04,
                                ),
                                Text(
                                  buttonText,
                                  style: const TextStyle(
                                    fontFamily: FontFamilyConfig.outfitRegular,
                                    fontWeight: FontWeight.w400,
                                    fontSize: FontSizeConfig.body2Text,
                                    color: ColorConfig.textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: SizeConfig.padding05),
                            child: TextFormField(
                              controller: chatController.askController,
                              cursorColor: ColorConfig.primaryColor,
                              focusNode: chatController.focusNode,
                              onChanged: (text) {
                                chatController.isTextEntered.value =
                                    text.isNotEmpty;
                              },
                              style: TextStyle(
                                fontFamily: FontFamilyConfig.outfitRegular,
                                fontSize: FontSizeConfig.body1Text,
                                fontWeight: FontWeight.w400,
                                color: chatController.isFocused
                                    ? ColorConfig.primaryColor
                                    : ColorConfig.textColor,
                              ),
                              decoration: InputDecoration(
                                hintText: StringConfig.askMeAnything,
                                hintStyle: const TextStyle(
                                  fontFamily: FontFamilyConfig.outfitRegular,
                                  fontSize: FontSizeConfig.body1Text,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConfig.textLightColor,
                                ),
                                isDense: true,
                                filled: true,
                                fillColor: chatController.isFocused
                                    ? ColorConfig.backgroundLightColor
                                    : ColorConfig.backgroundColor,
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.borderRadius10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: ColorConfig.primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.borderRadius10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: ColorConfig.backgroundColor,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.borderRadius10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: SizeConfig.width08,
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: chatController.isTextEntered,
                          builder: (context, textEntered, child) {
                            return textEntered
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        chatController.isSendButtonPressed =
                                            true;
                                      });
                                      chatController.askController.clear();
                                    },
                                    child: const Image(
                                      image: AssetImage(ImageConfig.sendChat),
                                      width: SizeConfig.width42,
                                    ),
                                  )
                                : const Image(
                                    image:
                                        AssetImage(ImageConfig.voiceAssistant),
                                    width: SizeConfig.width42,
                                  );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Material customDeleteChatDialouge() {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.only(
            left: SizeConfig.padding20,
            right: SizeConfig.padding20,
            bottom: SizeConfig.padding20,
            top: SizeConfig.padding20),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: SizeConfig.width335,
            height: SizeConfig.height204,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      ImageConfig.deleteChatRound,
                      width: SizeConfig.width29,
                    ),
                    const SizedBox(
                      width: SizeConfig.width08,
                    ),
                    const Expanded(
                      child: Text(
                        StringConfig.deleteChats,
                        style: TextStyle(
                          fontSize: FontSizeConfig.heading4Text,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitMedium,
                          color: ColorConfig.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: ColorConfig.dividerColor,
                  height: SizeConfig.height30,
                ),
                const SizedBox(
                  height: SizeConfig.height08,
                ),
                const Text(
                  StringConfig.areYouSureDeleteChats,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamilyConfig.outfitRegular,
                    fontSize: FontSizeConfig.heading4Text,
                    color: ColorConfig.textColor,
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: SizeConfig.height52,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: ColorConfig.backgroundLightColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.borderRadius52),
                            ),
                          ),
                          child: const Text(
                            StringConfig.buttonCancel,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: FontFamilyConfig.outfitSemiBold,
                              fontSize: FontSizeConfig.heading3Text,
                              color: ColorConfig.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: SizeConfig.width16),
                    Expanded(
                      child: SizedBox(
                        height: SizeConfig.height52,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: ColorConfig.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.borderRadius52),
                            ),
                          ),
                          child: const Text(
                            StringConfig.buttonDelete,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: FontFamilyConfig.outfitSemiBold,
                              fontSize: FontSizeConfig.heading3Text,
                              color: ColorConfig.textWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildInitialChatDescriptionContent() {
    return [
      const SizedBox(
        height: SizeConfig.height30,
      ),
      Container(
        width: SizeConfig.width335,
        height: SizeConfig.width263,
        color: ColorConfig.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(SizeConfig.padding16),
          child: Column(
            children: [
              Image(
                image: const AssetImage(ImageConfig.capabilities),
                width: SizeConfig.width20,
                color: ColorConfig.secondaryColor
                    .withOpacity(SizeConfig.opacityPoint06),
              ),
              const SizedBox(
                height: SizeConfig.height06,
              ),
              Text(
                StringConfig.capabilities,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamilyConfig.outfitRegular,
                  fontSize: FontSizeConfig.heading4Text,
                  fontWeight: FontWeight.w400,
                  color: ColorConfig.textMediumColor
                      .withOpacity(SizeConfig.opacityPoint06),
                ),
              ),
              const Divider(
                color: ColorConfig.dividerColor,
                height: SizeConfig.height30,
              ),
              Text(
                StringConfig.rememberConversation,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamilyConfig.outfitRegular,
                  fontSize: FontSizeConfig.body1Text,
                  fontWeight: FontWeight.w400,
                  color: ColorConfig.textMediumColor
                      .withOpacity(SizeConfig.opacityPoint05),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height16,
              ),
              Text(
                StringConfig.allowCorrections,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamilyConfig.outfitRegular,
                  fontSize: FontSizeConfig.body1Text,
                  fontWeight: FontWeight.w400,
                  color: ColorConfig.textMediumColor
                      .withOpacity(SizeConfig.opacityPoint05),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height16,
              ),
              Text(
                StringConfig.trainedRequests,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamilyConfig.outfitRegular,
                  fontSize: FontSizeConfig.body1Text,
                  fontWeight: FontWeight.w400,
                  color: ColorConfig.textMediumColor
                      .withOpacity(SizeConfig.opacityPoint05),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: SizeConfig.height24,
      ),
      Container(
        width: SizeConfig.width335,
        height: SizeConfig.width263,
        color: ColorConfig.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(SizeConfig.padding16),
          child: Column(
            children: [
              Image(
                image: const AssetImage(ImageConfig.limitations),
                width: SizeConfig.width20,
                color: ColorConfig.secondaryColor
                    .withOpacity(SizeConfig.opacityPoint06),
              ),
              const SizedBox(
                height: SizeConfig.height06,
              ),
              Text(
                StringConfig.limitations,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamilyConfig.outfitRegular,
                  fontSize: FontSizeConfig.heading4Text,
                  fontWeight: FontWeight.w400,
                  color: ColorConfig.textMediumColor
                      .withOpacity(SizeConfig.opacityPoint06),
                ),
              ),
              const Divider(
                color: ColorConfig.dividerColor,
                height: SizeConfig.height30,
              ),
              Text(
                StringConfig.occasionallyInform,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamilyConfig.outfitRegular,
                  fontSize: FontSizeConfig.body1Text,
                  fontWeight: FontWeight.w400,
                  color: ColorConfig.textMediumColor
                      .withOpacity(SizeConfig.opacityPoint05),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height16,
              ),
              Text(
                StringConfig.occasionallyInstruction,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamilyConfig.outfitRegular,
                  fontSize: FontSizeConfig.body1Text,
                  fontWeight: FontWeight.w400,
                  color: ColorConfig.textMediumColor
                      .withOpacity(SizeConfig.opacityPoint05),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height16,
              ),
              Text(
                StringConfig.limitedKnowledge,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamilyConfig.outfitRegular,
                  fontSize: FontSizeConfig.body1Text,
                  fontWeight: FontWeight.w400,
                  color: ColorConfig.textMediumColor
                      .withOpacity(SizeConfig.opacityPoint05),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  List<Widget> buildUpdatedChatContent() {
    return [
      const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MessageContainer(
            width: SizeConfig.width255,
            height: SizeConfig.height46,
            isRight: true,
            text: StringConfig.helloThere,
          ),
          MessageContainer(
            width: SizeConfig.width255,
            height: SizeConfig.height68,
            isRight: false,
            text: StringConfig.howCanIHelpYou,
          ),
          MessageContainer(
            width: SizeConfig.width255,
            height: SizeConfig.height122,
            isRight: false,
            text: StringConfig.iAIPreviewMessage,
          ),
          MessageContainer(
            width: SizeConfig.width255,
            height: SizeConfig.height46,
            isRight: true,
            text: StringConfig.showMeWhatYouDo,
          ),
          MessageContainer(
            width: SizeConfig.width255,
            height: SizeConfig.height224,
            isRight: false,
            text: StringConfig.iAIPreviewMessage2String,
          ),
        ],
      )
    ];
  }
}

class MessageContainer extends StatelessWidget {
  final bool isRight;
  final String text;
  final double width;
  final double height;

  const MessageContainer(
      {required this.isRight,
      required this.text,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isRight ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: width,
          height: height,
          padding: const EdgeInsets.only(
              left: SizeConfig.padding20, right: SizeConfig.padding15),
          margin: const EdgeInsets.symmetric(vertical: SizeConfig.margin07),
          decoration: BoxDecoration(
            color: isRight
                ? ColorConfig.primaryColor
                : ColorConfig.backgroundColor,
            borderRadius: isRight
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(04),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(04),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment:
                    isRight ? Alignment.centerLeft : Alignment.centerLeft,
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: FontFamilyConfig.outfitRegular,
                    fontWeight: FontWeight.w400,
                    fontSize: FontSizeConfig.body1Text,
                    color: isRight
                        ? ColorConfig.textWhiteColor
                        : ColorConfig.textColor,
                  ),
                ),
              ),
              if (!isRight)
                Padding(
                  padding: const EdgeInsets.only(top: SizeConfig.padding10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(const ClipboardData(
                              text: StringConfig.iAIPreviewMessage));
                          Fluttertoast.showToast(
                            msg: StringConfig.textCopied,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                          );
                        },
                        child: const Image(
                          image: AssetImage(ImageConfig.copyChat),
                          width: SizeConfig.width12,
                        ),
                      ),
                      const SizedBox(
                        width: SizeConfig.width08,
                      ),
                      GestureDetector(
                        onTap: () {
                          Share.share(StringConfig.iAIPreviewMessage);
                        },
                        child: const Image(
                          image: AssetImage(ImageConfig.shareChat),
                          width: SizeConfig.width12,
                        ),
                      ),
                      const SizedBox(
                        width: SizeConfig.width08,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CustomLikeDialog();
                            },
                          );
                        },
                        child: const Image(
                          image: AssetImage(ImageConfig.likeChat),
                          width: SizeConfig.width12,
                        ),
                      ),
                      const SizedBox(
                        width: SizeConfig.width08,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CustomDislikeDialog();
                            },
                          );
                        },
                        child: const Image(
                          image: AssetImage(ImageConfig.dislikeChat),
                          width: SizeConfig.width12,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomLikeDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.only(
            left: SizeConfig.padding20,
            right: SizeConfig.padding20,
            bottom: SizeConfig.padding20,
            top: SizeConfig.padding20),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: SizeConfig.width335,
            height: 286,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      ImageConfig.feedbackLike,
                      width: SizeConfig.width29,
                    ),
                    const SizedBox(
                      width: SizeConfig.width08,
                    ),
                    const Expanded(
                      child: Text(
                        StringConfig.provideAdditionalFeedback,
                        style: TextStyle(
                          fontSize: FontSizeConfig.heading4Text,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitMedium,
                          color: ColorConfig.textColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        ImageConfig.close,
                        width: SizeConfig.width16,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: ColorConfig.dividerColor,
                  height: SizeConfig.height30,
                ),
                const SizedBox(
                  height: SizeConfig.height14,
                ),
                TextField(
                  cursorColor: ColorConfig.primaryColor,
                  maxLines: 4,
                  style: const TextStyle(
                    fontFamily: FontFamilyConfig.outfitRegular,
                    fontWeight: FontWeight.w400,
                    fontSize: FontSizeConfig.body1Text,
                    color: ColorConfig.textColor,
                  ),
                  decoration: InputDecoration(
                    hintText: StringConfig.whatAboutLikeResponse,
                    hintStyle: const TextStyle(
                      fontFamily: FontFamilyConfig.outfitRegular,
                      fontWeight: FontWeight.w400,
                      fontSize: FontSizeConfig.body1Text,
                      color: ColorConfig.textLightColor,
                    ),
                    filled: true,
                    fillColor: ColorConfig.backgroundColor,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height20,
                ),
                SizedBox(
                  height: SizeConfig.height52,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: ColorConfig.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.borderRadius52),
                      ),
                    ),
                    child: const Text(
                      StringConfig.buttonSubmit,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: FontFamilyConfig.outfitSemiBold,
                        fontSize: FontSizeConfig.heading3Text,
                        color: ColorConfig.textWhiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDislikeDialog extends StatefulWidget {
  @override
  State<CustomDislikeDialog> createState() => _CustomDislikeDialogState();
}

class _CustomDislikeDialogState extends State<CustomDislikeDialog> {
  ChatController controller = Get.put(ChatController());

  void toggleImage1() {
    setState(() {
      controller.isUpdatedImage1 = !controller.isUpdatedImage1;
    });
  }

  void toggleImage2() {
    setState(() {
      controller.isUpdatedImage2 = !controller.isUpdatedImage2;
    });
  }

  void toggleImage3() {
    setState(() {
      controller.isUpdatedImage3 = !controller.isUpdatedImage3;
    });
  }

  @override
  Widget build(BuildContext context) {
    AssetImage image1 = controller.isUpdatedImage1
        ? const AssetImage(ImageConfig.checkFeedback)
        : const AssetImage(ImageConfig.checkBoxSquare);
    AssetImage image2 = controller.isUpdatedImage2
        ? const AssetImage(ImageConfig.checkFeedback)
        : const AssetImage(ImageConfig.checkBoxSquare);
    AssetImage image3 = controller.isUpdatedImage3
        ? const AssetImage(ImageConfig.checkFeedback)
        : const AssetImage(ImageConfig.checkBoxSquare);
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.only(
            left: SizeConfig.padding20,
            right: SizeConfig.padding20,
            bottom: SizeConfig.padding20,
            top: SizeConfig.padding20),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: SizeConfig.width335,
            height:SizeConfig. height380,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      ImageConfig.feedbackDislike,
                      width: SizeConfig.width29,
                    ),
                    const SizedBox(
                      width: SizeConfig.width08,
                    ),
                    const Expanded(
                      child: Text(
                        StringConfig.provideAdditionalFeedback,
                        style: TextStyle(
                          fontSize: FontSizeConfig.heading4Text,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamilyConfig.outfitMedium,
                          color: ColorConfig.textColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        controller.isUpdatedImage1 = false;
                        controller.isUpdatedImage2 = false;
                        controller.isUpdatedImage3 = false;
                      },
                      child: Image.asset(
                        ImageConfig.close,
                        width: SizeConfig.width16,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: ColorConfig.dividerColor,
                  height: SizeConfig.height30,
                ),
                const SizedBox(
                  height: SizeConfig.height14,
                ),
                TextField(
                  cursorColor: ColorConfig.primaryColor,
                  maxLines: 4,
                  style: const TextStyle(
                    fontFamily: FontFamilyConfig.outfitRegular,
                    fontWeight: FontWeight.w400,
                    fontSize: FontSizeConfig.body1Text,
                    color: ColorConfig.textColor,
                  ),
                  decoration: InputDecoration(
                    hintText: StringConfig.whatAboutLikeResponse,
                    hintStyle: const TextStyle(
                      fontFamily: FontFamilyConfig.outfitRegular,
                      fontWeight: FontWeight.w400,
                      fontSize: FontSizeConfig.body1Text,
                      color: ColorConfig.textLightColor,
                    ),
                    filled: true,
                    fillColor: ColorConfig.backgroundColor,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height15,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            toggleImage1();
                          },
                          child: Image(
                            image: image1,
                            width: SizeConfig.width12,
                          ),
                        ),
                        const SizedBox(
                          width: SizeConfig.width06,
                        ),
                        const Text(
                          StringConfig.iDontLikeIt,
                          style: TextStyle(
                            fontFamily: FontFamilyConfig.outfitRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: FontSizeConfig.body1Text,
                            color: ColorConfig.textColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: SizeConfig.height10,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            toggleImage2();
                          },
                          child: Image(
                            image: image2,
                            width: SizeConfig.width12,
                          ),
                        ),
                        const SizedBox(
                          width: SizeConfig.width06,
                        ),
                        const Text(
                          StringConfig.iCantBear,
                          style: TextStyle(
                            fontFamily: FontFamilyConfig.outfitRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: FontSizeConfig.body1Text,
                            color: ColorConfig.textColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: SizeConfig.height10,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            toggleImage3();
                          },
                          child: Image(
                            image: image3,
                            width: SizeConfig.width12,
                          ),
                        ),
                        const SizedBox(
                          width: SizeConfig.width06,
                        ),
                        const Text(
                          StringConfig.iAmNotKeepOn,
                          style: TextStyle(
                            fontFamily: FontFamilyConfig.outfitRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: FontSizeConfig.body1Text,
                            color: ColorConfig.textColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: SizeConfig.height20,
                ),
                SizedBox(
                  height: SizeConfig.height52,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      controller.isUpdatedImage1 = false;
                      controller.isUpdatedImage2 = false;
                      controller.isUpdatedImage3 = false;
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: ColorConfig.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.borderRadius52),
                      ),
                    ),
                    child: const Text(
                      StringConfig.buttonSubmit,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: FontFamilyConfig.outfitSemiBold,
                        fontSize: FontSizeConfig.heading3Text,
                        color: ColorConfig.textWhiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

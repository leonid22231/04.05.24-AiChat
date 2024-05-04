import 'package:flutter/material.dart';

import '../../config/color_config.dart';
import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';
import '../../config/image_config.dart';
import '../../config/size_config.dart';
import '../../config/string_config.dart';

class NoHistoryFoundView extends StatelessWidget {
  const NoHistoryFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: SizeConfig.padding15, right: SizeConfig.padding15, top: SizeConfig.padding50),
            child: Image.asset(
              ImageConfig.aiImageGenerator,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: SizeConfig.height48,
          ),
          const Text(
            StringConfig.noHistoryFound,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: FontSizeConfig.heading4Text,
              fontFamily: FontFamilyConfig.outfitRegular,
              fontWeight: FontWeight.w400,
              color: ColorConfig.textMediumColor,
            ),
          ),
        ],
      ),
    );
  }
}

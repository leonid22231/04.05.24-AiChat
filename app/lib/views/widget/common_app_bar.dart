import 'package:flutter/material.dart';

import '../../config/color_config.dart';
import '../../config/font_family_config.dart';
import '../../config/font_size_config.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;
  final String? title;
  final bool centerTitle;
  final Color? backgroundColor;
  final double? toolBarHeight;
  final Widget? bottom;

  // ignore: use_key_in_widget_constructors
  const CommonAppBar({
    this.leading,
    this.actions,
    this.title,
    this.centerTitle = false,
    this.backgroundColor,
    this.toolBarHeight,
    this.bottom,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      elevation: 0,
      leading: leading,
      actions: actions,
      toolbarHeight: toolBarHeight,
      bottom: bottom != null ? PreferredSize(preferredSize: Size.zero, child: bottom!) : null,
      title: Text(
        title ?? '',
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontFamily: FontFamilyConfig.outfitMedium,
          fontSize: FontSizeConfig.heading2Text,
          fontWeight: FontWeight.w500,
          color: ColorConfig.textColor,
        ),
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
    );
  }
}

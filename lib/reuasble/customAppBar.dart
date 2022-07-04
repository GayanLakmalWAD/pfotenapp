import 'package:flutter/material.dart';
import 'package:pfoten/utils/colors.dart';
import 'package:pfoten/utils/dimensions.dart';
import 'package:pfoten/utils/textStyles.dart';
import 'customCircleButton.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonExist;
  final bool isAction;
  final IconData iconData;
  final Function() iconOnTap;
  final Function() backOnTap;
  final bool isHome;
  final bool isBackButtonOverride;

  // ignore: use_key_in_widget_constructors
  const CustomAppBar({
    required this.title,
    required this.backOnTap,
    this.isBackButtonExist = false,
    required this.isAction,
    this.iconData = Icons.close,
    required this.iconOnTap,
    this.isHome = false,
    this.isBackButtonOverride = false
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.red.withOpacity(0),
      centerTitle: true,
      title: Text(
        title,
        style: robotoBoldTextStyle.copyWith(
            fontSize: Dimensions.fontSizeLarge,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5
        ),
      ),
      leading: (!isHome && isBackButtonExist)
          ? Padding(
        padding: const EdgeInsets.only(
            left: Dimensions.paddingDefault
        ),
        child: CustomCircleButton(
          iconData: Icons.arrow_back_ios,
          iconOnTap: backOnTap
        ),
      )
          : Container(),
      actions: [
        isAction
            ? Padding(
                padding: const EdgeInsets.only(right: Dimensions.paddingOverLarge),
                child: CustomCircleButton(
                  iconOnTap: iconOnTap,
                  iconData: iconData,
                )
              )
            : const SizedBox.shrink()
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 55);
}

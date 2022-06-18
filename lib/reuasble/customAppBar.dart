import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vega_power/utils/colors.dart';
import 'package:vega_power/utils/dimensions.dart';

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
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: kColorWhite, letterSpacing: 1.5),
      ),
      leading: (!isHome && isBackButtonExist)
          ? GestureDetector(
        onTap: backOnTap,
            child: Container(
             color: Colors.transparent,
              child: const Icon(Icons.arrow_back_ios, color: Colors.white, ),
            ),
          )
          : Container(),
      actions: [
        isAction
            ? Padding(
                padding: const EdgeInsets.only(right: Dimensions.paddingOverLarge),
                child: GestureDetector(
                  onTap: iconOnTap,
                  child: Icon(
                    iconData,
                    color: kColorWhite,
                  ),
                ),
              )
            : const SizedBox.shrink()
      ],
      flexibleSpace: Padding(
        padding: const EdgeInsets.fromLTRB(
          Dimensions.paddingSmall,
          40,
          Dimensions.paddingOverLarge,
          0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //title underlined image
            Padding(
              padding: EdgeInsets.only(top: 5.sp),
              child: Image.asset(
                "assets/images/blue_line.png",
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 70);
}

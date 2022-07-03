import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomCircleButton extends StatelessWidget {

  final IconData iconData;
  final Function() iconOnTap;

  const CustomCircleButton({Key? key, required this.iconOnTap, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: iconOnTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(blurRadius: 3, color: Colors.black, spreadRadius: 1)],
        ),
        child: CircleAvatar(
          backgroundColor: primaryColor,
          child: Center(
            child: Icon(
              iconData,
              color: kColorWhite,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}

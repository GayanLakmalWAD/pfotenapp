import 'package:flutter/material.dart';
import 'package:pfoten/utils/colors.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Pfoten",
                style: TextStyle(
                  fontFamily: "IndieFlower",
                  fontSize: 75.sp,
                  color: primaryColor
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

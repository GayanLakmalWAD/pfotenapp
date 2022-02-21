import 'package:flutter/material.dart';
import 'package:pfoten/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorWhite,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Pfoten",
                style: TextStyle(
                  fontFamily: "IndieFlower",
                  fontSize: 85,
                  color: primaryColor
                ),
              ),
              // Container(
              //   height: 100,
              //   width: 100,
              //   color: primaryColor,
              // ),
              // Container(
              //   height: 100,
              //   width: 100,
              //   color: secondaryColor,
              // ),
              // Container(
              //   height: 100,
              //   width: 100,
              //   color: accentColor,
              // ),
              // Container(
              //   height: 100,
              //   width: 100,
              //   color: secondaryAccentColor,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

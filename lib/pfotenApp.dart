import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:pfoten/splash_screen.dart';
import 'package:pfoten/utils/colors.dart';
import 'package:pfoten/screens/onboarding_screen.dart';
import 'package:sizer/sizer.dart';

class PfotenApp extends StatelessWidget {
  const PfotenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizerUtil.setScreenSize(constraints, orientation);
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                  primaryColor: primaryColor,
                  scaffoldBackgroundColor: scaffoldBackgroundColor,
                  canvasColor: primaryColor,
                  fontFamily: "Roboto",
                  pageTransitionsTheme: const PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android: SharedAxisPageTransitionsBuilder(
                      transitionType: SharedAxisTransitionType.horizontal,
                    ),
                    TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
                      transitionType: SharedAxisTransitionType.horizontal,
                    ),
                  },
                ),
              ),
              home: const OnboardingScreen(),
            );
          }
        );
      }
    );
  }
}
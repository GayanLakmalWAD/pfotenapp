import 'package:flutter/material.dart';
import 'package:pfoten/splash_screen.dart';
import 'package:pfoten/utils/colors.dart';
import 'package:pfoten/utils/onboarding_screen.dart';

class PfotenApp extends StatelessWidget {
  const PfotenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          // textTheme: GoogleFonts.robotoSlabTextTheme(
          //     Theme.of(context).textTheme.apply(bodyColor: colorWhite)
          // ),
          canvasColor: secondaryColor
      ),
      home: const OnboardingScreen(),
    );
  }
}
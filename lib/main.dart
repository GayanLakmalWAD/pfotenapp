import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pfoten/pfotenApp.dart';
import 'package:pfoten/utils/colors.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  //orientation - portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: primaryColor,
    statusBarIconBrightness: Brightness.light
  ));

  runApp(const PfotenApp());
}

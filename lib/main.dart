import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pfoten/pfotenApp.dart';
import 'package:pfoten/utils/colors.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  //orientation - portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //status bar customization
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark
  ));

  runApp(const PfotenApp());
}

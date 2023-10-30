import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/screens/main_screen.dart';

void main() {
  
  runApp(GetMaterialApp(theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.black))
  ,home: MainPage()));
}

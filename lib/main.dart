import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:satutitik/Screens/home/home.dart';
import 'package:satutitik/Screens/qr/scan.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      home: ScanPage(),
    );
  }
}

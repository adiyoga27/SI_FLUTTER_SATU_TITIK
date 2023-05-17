import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:satutitik/Screens/home/home.dart';
import 'package:satutitik/Screens/qr/scan.dart';
import 'package:satutitik/controllers/HomeController.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  final cookies = GetStorage();

  @override
  void initState() {
    super.initState();

    _initialize();
  }

  _initialize() async {
    Timer(Duration(seconds: 3), () async {
      final uuid = await cookies.read('uuid');

      if (uuid == null) {
        Get.to(ScanPage());
      } else {
        final homeController = Get.put(HomeController());
        homeController.getOrder();
        Get.to(HomePage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 50.0,
          width: 50.0,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

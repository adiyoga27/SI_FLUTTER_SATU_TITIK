import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:satutitik/Screens/home/home.dart';
import 'package:satutitik/Screens/qr/scan.dart';
import 'package:satutitik/config/app_config.dart';
import 'package:satutitik/controllers/HomeController.dart';
import 'package:satutitik/models/order.dart';

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

      print(uuid);
      if (uuid == null) {
        return Get.off(ScanPage());
      }
      try {
        final dio = Dio();
        final response = await dio.get(AppConfig().baseUrl + "/order/$uuid");
        print(AppConfig().baseUrl + "/order/" + uuid);
        if (response.statusCode == 200) {
          // ignore: unrelated_type_equality_checks
          if (response.data['status'] == true) {
            return Get.off(HomePage());
          } else {
            return Get.off(ScanPage());
          }
        }
      } catch (e) {
        if (e is DioError) {
          //handle DioError here by error type or by error code
          if (e.response!.statusCode == 400) {
            return Get.off(ScanPage());
          }
        }
        // return Get.off(ScanPage());
      }

      // if (uuid == null) {
      //   Get.off(ScanPage());
      // } else {
      //   // final homeController = Get.put(HomeController());
      //   // homeController.getOrder();
      //   Get.off(HomePage());
      // }
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

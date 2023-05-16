import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:satutitik/Screens/auth/login.dart';
import 'package:satutitik/Screens/home/home.dart';
import 'package:satutitik/Screens/reservasi.dart';
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
    // TODO: implement initState
    super.initState();

    _initialize();
  }

  _initialize() async {
    print('adad');
    Timer(Duration(seconds: 3), () async {
      final uuid = await cookies.read('uuid');

      print(uuid);
      if (uuid == null) {
        Get.to(LoginPage());
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

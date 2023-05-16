import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:satutitik/Screens/cart/invoice.dart';
import 'package:get/get.dart';
import 'package:satutitik/Screens/home/home.dart';
import 'package:satutitik/Screens/qr/scan.dart';
import 'package:dio/dio.dart';
import 'package:satutitik/config/app_config.dart';
import 'package:satutitik/controllers/HomeController.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:satutitik/models/reservasi.dart';
import 'package:satutitik/models/user.dart';

class AuthController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  final cookies = GetStorage();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void verify() async{
 final dio = Dio();
    try {
      final response = await dio.post(AppConfig().baseUrl + "/login", data: {
        'username': '${usernameController.value}',
        'password': '${passwordController.value}'
      });


      if (response.statusCode == 200) {
        final userModel = UserModel.fromJson(response.data['data']);
        cookies.write('token', userModel.token);
        Get.to(HomePage());
      }else{
           Fluttertoast.showToast(msg: '${response.data['message']}');

      }
    } catch (e) {
           Fluttertoast.showToast(msg: 'Gagal Login');

    }    
  }

  
}

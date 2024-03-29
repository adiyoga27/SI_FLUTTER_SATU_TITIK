import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:satutitik/Screens/auth/login.dart';
import 'package:get/get.dart';
import 'package:satutitik/Screens/home/home.dart';
import 'package:dio/dio.dart';
import 'package:satutitik/config/app_config.dart';

import 'package:satutitik/models/user.dart';

class AuthController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController hpController = TextEditingController();

  final cookies = GetStorage();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void verify() async {
    final dio = Dio();
    try {
      final response = await dio.post(AppConfig().baseUrl + "/login", data: {
        'username': '${usernameController.text}',
        'password': '${passwordController.text}'
      });

      if (response.statusCode == 200) {
        final userModel = UserModel.fromJson(response.data['data']);
        cookies.write('token', userModel.token);
        Get.to(HomePage());
      } else {
        Fluttertoast.showToast(msg: '${response.data['message']}');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Gagal Login');
    }
  }

  void registration() async {
    final dio = Dio();
    // print({
    //   'username': '${usernameController.text}',
    //   'password': '${passwordController.text}',
    //   'name': '${nameController.text}',
    //   'email': '${emailController.text}',
    //   'hp': '${hpController.text}'
    // }.toString());

    try {
      final response =
          await dio.post(AppConfig().baseUrl + "/registration", data: {
        'username': '${usernameController.text}',
        'password': '${passwordController.text}',
        'name': '${nameController.text}',
        'email': '${emailController.text}',
        'hp': '${hpController.text}'
      });

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: '${response.data['message']}');
        Get.offAll(LoginPage());
      } else {
        Fluttertoast.showToast(msg: '${response.data['message']}');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Gagal Login' + e.toString());
    }
  }
}

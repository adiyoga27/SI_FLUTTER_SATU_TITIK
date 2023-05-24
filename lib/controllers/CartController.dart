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

class CartController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? uuid;
  final homeController = Get.put(HomeController());
  final cookies = GetStorage();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    Get.put(HomeController());
  }

  var count = 0;
  double amount = 0;
  void increment() {
    count++;
    amount = amount * count;
    update();
  }

  void decrement() {
    if (count > 0) {
      count--;
      amount = amount * count;
      update();
    }
  }

  void showInvoice() {
    Get.to(InvoicePage());
  }

  void gotToScan() async {
    cookies.write('name', nameController.text);
    cookies.write('phone', phoneController.text);
    cookies.write('dining_table_uuid', phoneController.text);

    var status = await Permission.camera.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
    }

// You can can also directly ask the permission about its status.
    if (await Permission.location.isRestricted) {
      // The OS restricts access, for example because of parental controls.
    }

    Get.to(ScanPage());
  }

  void addToCart(int productId) async {
    isLoading.value = true;
    final dio = Dio();
    final response = await dio.post(AppConfig().baseUrl + "/add-cart",
        data: {
          'uuid': cookies.read('uuid'),
          'product_id': '$productId',
          'quantity': count
        },
        options: Options(headers: {
          "Content-Type": "application/json",
        }));
    // print(response.data);

    if (response.statusCode == 200) {
      homeController.getOrder();

      Fluttertoast.showToast(msg: response.data['message']);
      count = 0;
    }
    isLoading.value = false;

    update();

    // ignore: unused_element
  }

  void checkout() async {
    final dio = Dio();
    try {
      final response = await dio
          .post(AppConfig().baseUrl + "/checkout/${cookies.read('uuid')}");
      print("/checkout/${cookies.read('uuid')}");
      if (response.statusCode == 200) {
        final ctrlHome = Get.put(HomeController());
        ctrlHome.getOrder();
        Get.to(InvoicePage());
      }
    } catch (e) {
      // print("error : ${e.toString()}");
      Fluttertoast.showToast(msg: 'Ulangi Scan Barcode');
    }
  }

  void deleteCart(id) async {
    final dio = Dio();
    try {
      final response =
          await dio.delete(AppConfig().baseUrl + "/delete-cart/$id");
      if (response.statusCode == 200) {
        final ctrlHome = Get.put(HomeController());
        ctrlHome.getOrder();
        Get.to(InvoicePage());
      }
    } catch (e) {
      // print("error : ${e.toString()}");
      Fluttertoast.showToast(msg: 'Gagal menghapus pesanan !');
    }
  }
}

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:satutitik/Screens/home/home.dart';
import 'package:satutitik/config/app_config.dart';
import 'package:satutitik/models/tablebook.dart';

class ReservasiController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<BookTableModel> bookTableModel = <BookTableModel>[].obs;

  final cookies = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getBookTable();
  }

  void getBookTable() async {
    isLoading.value = true;
    final dio = Dio();
    final response = await dio.get(
      AppConfig().baseUrl + "/book-table",
    );

    if (response.statusCode == 200) {
      bookTableModel.value = (response.data['data'] as List)
          .map((e) => BookTableModel.fromJson(e))
          .toList();
    }

    isLoading.value = false;
    update();
  }

  void reservasi(String uuid) async {
    // cookies.remove('uuid');
    final dio = Dio();
    try {
      // print({
      //   'table_uuid': uuid,
      //   'customer_name': 'Customer',
      //   'customer_phone': '0841683'
      // }.toString());
      final response = await dio.post(AppConfig().baseUrl + "/reservasi",
          data: {
            'table_uuid': uuid,
            'customer_name': "Customer",
            'customer_phone': "085792486889"
          },
          options: Options(headers: {
            "Content-Type": "application/json",
          }));

      if (response.statusCode == 200) {
        cookies.write('uuid', response.data['data']['uuid']);
        Get.to(HomePage());
      } else {
        Fluttertoast.showToast(msg: response.data['message']);
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: 'Ulangi Scan Barcode');
    }
  }
}

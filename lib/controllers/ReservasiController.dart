import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
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
    print('category');
    isLoading.value = true;
    final dio = Dio();
    final response = await dio.get(AppConfig().baseUrl + "/book-table",
          );

    if (response.statusCode == 200) {
       bookTableModel.value = (response.data['data'] as List)
          .map((e) => BookTableModel.fromJson(e))
          .toList();
    }
    print(response.data['data']);

    isLoading.value = false;
    update();
  }

}

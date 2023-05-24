import 'dart:html';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:satutitik/Screens/qr/scan.dart';
import 'package:satutitik/config/app_config.dart';
import 'package:satutitik/models/category.dart';
import 'package:satutitik/models/order.dart';
import 'package:satutitik/models/product.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  var count = 0;
  RxList<ProductModel> productModel = <ProductModel>[].obs;
  RxList<CategoryModel> categoryModel = <CategoryModel>[].obs;
  RxBool isLoadingCategory = true.obs;
  RxBool isLoadingProduct = true.obs;
  RxBool isLoadingCart = true.obs;
  RxBool isLoadingProductByCategory = true.obs;
  RxInt selectedCategory = 0.obs;
  OrderModel? orderModel;
  final cookies = GetStorage();

  @override
  void onInit() {
    getOrder();
    getCategory();
    super.onInit();
  }

  @override
  void onReady() {
    getAll();
    super.onReady();
  }

  void increment() {
    count++;
    update();
  }

  void getAll() {
    getOrder();
    getCategory();
  }

  void getCategory() async {
    isLoadingCategory.value = true;
    final dio = Dio();
    final response = await dio.get(
      AppConfig().baseUrl + "/category",
    );

    if (response.statusCode == 200) {
      categoryModel.value = (response.data['data'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();

      selectedCategory.value = categoryModel[0].id!;
      getProductByCategory(categoryModel[0].id!);
    }
    // print(response.data['data']);

    isLoadingCategory.value = false;
    update();
  }

  void getProduct() async {
    isLoadingProduct.value = true;
    final dio = Dio();
    final response = await dio.get(
      AppConfig().baseUrl + "/product/" + selectedCategory.value.toString(),
    );

    if (response.statusCode == 200) {
      productModel.value = (response.data['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    }

    isLoadingProduct.value = false;
    update();
  }

  void getProductByCategory(int categoryId) async {
    isLoadingProductByCategory.value = true;
    selectedCategory.value = categoryId;
    final dio = Dio();
    final response = await dio.get(
      AppConfig().baseUrl + "/product/" + categoryId.toString(),
    );

    if (response.statusCode == 200) {
      productModel.value = (response.data['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    }

    isLoadingProductByCategory.value = false;
    update();
  }

  void getOrder() async {
    isLoadingCart.value = true;
    try {
      if (cookies.read('uuid') != null) {
        final dio = Dio();
        final response = await dio.get(
          AppConfig().baseUrl + "/order/" + cookies.read('uuid'),
        );
        if (response.data['status'] == true) {
          print("Lolos :" + response.toString());

          orderModel = OrderModel.fromJson(response.data['data']);
          isLoadingCart.value = false;
          update();
        } else {
          print("Tidak Lolos :" + response.toString());

          cookies.remove('uuid');
          isLoadingCart.value = false;
          update();

          Get.to(ScanPage());
        }
      }
    } catch (e) {
      isLoadingCart.value = false;
      update();
    }
  }
}

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:satutitik/config/app_config.dart';
import 'package:satutitik/models/category.dart';
import 'package:satutitik/models/product.dart';

class HomeController extends GetxController {
  var count = 0;
  ProductModel? productModel;
  CategoryModel? categoryModel;
  RxBool isLoadingCategory = false.obs;
  RxBool isLoadingProduct = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getCategory();
    // getProduct();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // getCategory();
    // getProduct();
  }

  void increment() {
    count++;
    update();
  }

  void getCategory() async {
    isLoadingCategory = true.obs;
    final dio = Dio();
    final response = await dio.get(AppConfig().baseUrl + "/category");
    print(response.data);

    if (response.statusCode == 200) {
      categoryModel = CategoryModel.fromJson(response.data);
    }
    isLoadingCategory = false.obs;
  }

  void getProduct() async {
    isLoadingProduct = true.obs;

    final dio = Dio();
    final response = await dio.get(AppConfig().baseUrl + "/product");
    print(response.data);

    if (response.statusCode == 200) {
      productModel = ProductModel.fromJson(response.data);
    }
    isLoadingProduct = false.obs;
  }
}

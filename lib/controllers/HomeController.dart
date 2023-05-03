import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:satutitik/config/app_config.dart';
import 'package:satutitik/models/category.dart';
import 'package:satutitik/models/product.dart';

class HomeController extends GetxController {
  var count = 0;
  RxList<ProductModel> productModel = <ProductModel>[].obs;
  RxList<CategoryModel> categoryModel = <CategoryModel>[].obs;
  RxBool isLoadingCategory = false.obs;
  RxBool isLoadingProduct = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getCategory();
    getProduct();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    getCategory();
    getProduct();
    super.onReady();
  }

  void increment() {
    count++;
    update();
  }

  void getCategory() async {
    print('category');
    isLoadingCategory.value = true;
    final dio = Dio();
    final response = await dio.get(AppConfig().baseUrl + "/category");

    if (response.statusCode == 200) {
      categoryModel.value = (response.data['data'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
    }
    print(response.data['data']);

    isLoadingCategory.value = false;
    update();
  }

  void getProduct() async {
    print('product');

    isLoadingProduct.value = true;

    final dio = Dio();
    final response = await dio.get(AppConfig().baseUrl + "/product");

    if (response.statusCode == 200) {
      productModel.value = (response.data['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    }
    print(response.data['data']);

    isLoadingProduct.value = false;
    update();
  }
}

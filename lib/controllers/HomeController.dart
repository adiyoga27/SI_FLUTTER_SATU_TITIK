import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:satutitik/Screens/reservasi.dart';
import 'package:satutitik/config/app_config.dart';
import 'package:satutitik/models/category.dart';
import 'package:satutitik/models/order.dart';
import 'package:satutitik/models/product.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  var count = 0;
  RxList<ProductModel> productModel = <ProductModel>[].obs;
  RxList<CategoryModel> categoryModel = <CategoryModel>[].obs;
  RxBool isLoadingCategory = false.obs;
  RxBool isLoadingProduct = false.obs;
  RxBool isLoadingCart = false.obs;
  RxBool isLoadingProductByCategory = false.obs;
  RxInt selectedCategory = 0.obs;
   late OrderModel orderModel;
  final cookies = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit

    getCategory();
    super.onInit();
  }

  @override
  void onReady() {

    // TODO: implement onReady
    getCategory();
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

          selectedCategory.value = categoryModel[0].id!;
          getProductByCategory(categoryModel[0].id!);
        getOrder();

    }
    print(response.data['data']);

    isLoadingCategory.value = false;
    update();
  }

  void getProduct() async {
    print('product');

    isLoadingProduct.value = true;
    final dio = Dio();
    final response = await dio.get(AppConfig().baseUrl + "/product/"+selectedCategory.value.toString());

    if (response.statusCode == 200) {
      productModel.value = (response.data['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    }
    print(response.data['data']);

    isLoadingProduct.value = false;
    update();
  }

  void getProductByCategory(int category_id) async {
    print('product');

    isLoadingProductByCategory.value = true;

    final dio = Dio();
    final response = await dio.get(AppConfig().baseUrl + "/product/"+category_id.toString());

    if (response.statusCode == 200) {
      productModel.value = (response.data['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    }
    print(response.data['data']);

    isLoadingProductByCategory.value = false;
    update();
  }

  void getOrder() async {
    isLoadingCart.value = true;
    try {
      if(cookies.read('uuid') != null){
      final dio = Dio();
      final response = await dio.get(AppConfig().baseUrl + "/order/"+cookies.read('uuid'));

      if (response.statusCode == 200) {
        orderModel = OrderModel.fromJson(response.data['data']);
      }else{
        cookies.remove('uuid');
        Get.to(ReservasiPage());
      }
      print(response.data['data']);
      isLoadingCart.value = false;

    }
    } catch (e) {
         cookies.remove('uuid');
        Get.to(ReservasiPage());
    }
      
   
    update();
  }
}

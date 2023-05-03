import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:satutitik/Screens/cart/invoice.dart';
import 'package:satutitik/Screens/details/widget/food_detail.dart';
import 'package:satutitik/Screens/details/widget/food_image.dart';
import 'package:satutitik/constants/colors.dart';
import 'package:satutitik/controllers/CartController.dart';
import 'package:satutitik/controllers/HomeController.dart';

import 'package:satutitik/models/food.dart';
import 'package:satutitik/models/order.dart';
import 'package:satutitik/models/product.dart';
import 'package:satutitik/widgets/custom_app_bar.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final ProductModel productModel;
  final OrderModel orderModel;

  const DetailPage({
    Key? key,
    required this.productModel,
    required this.orderModel,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartCtrl = Get.put(CartController());
    final homeCtrl = Get.put(HomeController());
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                leftIcon: Icons.arrow_back,
                rightIcon: Icons.favorite_outline,
                leftCallback: () => Navigator.pop(context),
              ),
              FoodImg(
                food: productModel,
              ),
              FoodDetail(
                food: productModel,
              )
            ],
          ),
        ),
        floatingActionButton: Obx(() {
        return  cartCtrl.isLoading.value ? RawMaterialButton(
                onPressed: () => Get.to(InvoicePage()),
                fillColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                elevation: 2,
                child:  Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
             
 
    ) : Container(
            width: 100,
            height: 56,
            child: homeCtrl.orderModel.cart.length.obs > 0 ? RawMaterialButton(
              onPressed: () => Get.to(InvoicePage()),
              fillColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              elevation: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Text(
                      homeCtrl.orderModel.cart.length.obs.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ) : Icon(
          Icons.shopping_bag_outlined,
          color: Colors.black,
          size: 30,
        ));}));
  }
}

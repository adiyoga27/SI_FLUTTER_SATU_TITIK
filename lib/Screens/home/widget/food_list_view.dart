import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satutitik/Screens/details/detail.dart';
import 'package:satutitik/Screens/home/widget/food_item.dart';
import 'package:satutitik/models/order.dart';
import 'package:satutitik/models/product.dart';

import 'package:satutitik/models/restaurant.dart';

class FoodListView extends StatelessWidget {
  final int? selected;
  final Function? callback;
  final List<ProductModel>? productModel;
  final OrderModel? orderModel;
  const FoodListView({
    Key? key,
    this.selected,
    this.callback,
    this.productModel,
    required this.orderModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (productModel!.isEmpty) {
      return Center(child: Text('Tidak Ada Produk di Kategori ini'));
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: PageView(
        onPageChanged: (index) => callback!(index),
        children: productModel!
            .map((e) => ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Get.to(DetailPage(productModel: productModel![index], orderModel: orderModel!));
                      
                      },
                      child: FoodItem(
                        productModel: productModel![index],
                      ),
                    ),
                separatorBuilder: (_, index) => SizedBox(
                      height: 15,
                    ),
                itemCount: productModel!.length))
            .toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:satutitik/Screens/details/detail.dart';
import 'package:satutitik/Screens/home/widget/food_item.dart';
import 'package:satutitik/models/product.dart';

import 'package:satutitik/models/restaurant.dart';

class FoodListView extends StatelessWidget {
  final int? selected;
  final Function? callback;
  final PageController? pageController;
  final Restaurant? restaurant;
  final List<ProductModel>? productModel;
  const FoodListView({
    Key? key,
    this.selected,
    this.callback,
    this.pageController,
    this.restaurant,
    this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = restaurant!.menu.keys.toList();
    if (productModel!.isEmpty) {
      return Text('Tidak Ada Category');
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback!(index),
        children: productModel!
            .map((e) => ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => DetailPage(
                        //               food: restaurant!
                        //                   .menu[category[selected!]]![index],
                        //             )));
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

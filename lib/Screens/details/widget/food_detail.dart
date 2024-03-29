import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:satutitik/Screens/details/widget/food_quantity.dart';
import 'package:satutitik/constants/colors.dart';
import 'package:satutitik/controllers/CartController.dart';
import 'package:satutitik/controllers/HomeController.dart';
import 'package:satutitik/helpers/formating_helper.dart';
import 'package:get/get.dart';
import 'package:satutitik/models/product.dart';

class FoodDetail extends StatelessWidget {
  final controller = Get.put(CartController());
  final ctrlHome = Get.put(HomeController());
  final ProductModel? food;
  FoodDetail({this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(25),
        color: kBackground,
        child: Column(
          children: [
            Text(
              food!.name!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              CurrencyFormat.convertToIdr(food!.price, 0).toString(),
              style: TextStyle(
                fontSize: 18,
              ),
            ),

            SizedBox(
              height: 39,
            ),

            Obx(() {
              return ctrlHome.isLoadingCart.value ||
                      ctrlHome.orderModel!.status != 'pending'
                  ? SizedBox()
                  : GetBuilder<CartController>(builder: (context) {
                      return FoodQuantity(food: food, qty: controller.count);
                    });
            }),

            // Row(
            //   children: [
            //     Text(
            //       'Ingredienta',
            //       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            //     )
            //   ],
            // ),
            // SizedBox(height: 10),
            // Container(
            //   height: 100,
            //   child: ListView.separated(
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (context, index) => Container(
            //             padding: EdgeInsets.all(10),
            //             decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.circular(40),
            //             ),
            //             child: Column(
            //               children: [
            //                 Image.asset(food!.ingredients![index].values.first,
            //                     width: 52),
            //                 Text(food!.ingredients![index].keys.first),
            //               ],
            //             ),
            //           ),
            //       separatorBuilder: (_, index) => SizedBox(
            //             width: 15,
            //           ),
            //       itemCount: food!.ingredients!.length),
            // ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  'About',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              food!.description!,
              style: TextStyle(fontSize: 16, wordSpacing: 1.2, height: 1.5),
            ),
            SizedBox(height: 400),
          ],
        ));
  }

  // _buildIconText(IconData icon, Color color, String text) {
  //   return Row(
  //     children: [
  //       Icon(
  //         icon,
  //         color: color,
  //       ),
  //       Text(
  //         text,
  //         style: TextStyle(fontSize: 16),
  //       ),
  //     ],
  //   );
  // }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/cart/widget/product_card.dart';
import 'package:food_delivery_app/Screens/details/widget/food_detail.dart';
import 'package:food_delivery_app/Screens/details/widget/food_image.dart';
import 'package:food_delivery_app/constants/colors.dart';

import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/widgets/custom_app_bar.dart';
import 'package:get/get.dart';

class InvoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fd),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0),
          child: Stack(children: [
            Positioned(
                top: 60,
                left: 20,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Icon(Icons.arrow_back),
                )),
            Positioned(
                top: 60,
                left: 1.0,
                right: 1.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Transaction Out',
                      textAlign: TextAlign.center,
                    ),
                    Text('Detail of transaction'),
                  ],
                )),
            Positioned(
                top: 130.0,
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Satu Titik Coffee'),
                          Text('Total Pembayaran Anda'),
                          Text('Rp 1.000.000'),
                          Text('Jln Nenas No 16 Bungaya Kangin'),
                        ],
                      ),
                      height: 100,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Transaction Detail'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Date'),
                                Text('Date'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Nama'),
                                Text('asdasd'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Transaction ID'),
                                Text('34234'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      height: Get.height / 1.2,
                      width: Get.width,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text('Transaction Detailaaaaaaaa'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Date'),
                                Text('Date'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Nama'),
                                Text('asdasd'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Transaction ID'),
                                Text('34234'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      color: Colors.white,
                    ),
                  ],
                ))
          ])),
    );
  }

  _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

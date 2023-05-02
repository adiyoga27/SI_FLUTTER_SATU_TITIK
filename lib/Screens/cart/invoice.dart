import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:satutitik/Screens/cart/widget/product_card.dart';
import 'package:satutitik/Screens/details/widget/food_detail.dart';
import 'package:satutitik/Screens/details/widget/food_image.dart';
import 'package:satutitik/constants/colors.dart';

import 'package:satutitik/models/food.dart';
import 'package:satutitik/widgets/custom_app_bar.dart';
import 'package:get/get.dart';

class InvoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fd),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Satu Titik Coffee'),
                            Text('Total Pembayaran Anda'),
                            Text(
                              'Rp 1.000.000',
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.bold),
                            ),
                            Text('Jln Nenas No 16 Bungaya Kangin'),
                          ],
                        ),
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
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 10.0, right: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Transaction Detail',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('No Meja'),
                                Text('5'),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Date'),
                                Text('30 April 2023'),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Nama'),
                                Text('Adiyoga'),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Transaction ID'),
                                Text('INV-34234'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      height: Get.height / 6,
                      width: Get.width,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 10.0,
                          left: 10.0,
                          right: 25.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order Detail',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              flex: 1,
                              child: ListView.separated(
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('Soba Soup'),
                                          Text('@12.000 x 5'),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                        ],
                                      ),
                                      Text('Rp 70.000'),
                                    ],
                                  );
                                },
                                separatorBuilder: (_, index) => SizedBox(
                                  width: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      height: Get.height,
                      width: Get.width,
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:satutitik/Screens/cart/widget/product_card.dart';
import 'package:satutitik/Screens/details/widget/food_detail.dart';
import 'package:satutitik/Screens/details/widget/food_image.dart';
import 'package:satutitik/constants/colors.dart';
import 'package:satutitik/controllers/HomeController.dart';
import 'package:satutitik/helpers/formating_helper.dart';

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
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Icon(Icons.arrow_back),
                  ),
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
                    GetBuilder<HomeController>(
                      builder: (ctrl) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Satu Titik Coffee'),
                                SizedBox(height: 5.0,),
                                Text('Total Pembayaran Anda'),
                                SizedBox(height: 10.0,),

                                Text(
                                  CurrencyFormat.convertToIdr(ctrl.orderModel.totalPrice, 0).toString(),
                                  style: TextStyle(
                                      fontSize: 30.0, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10.0,),

                                Text('Jln Nenas No 16 Bungaya Kangin'),
                              ],
                            ),
                          ),
                          height: Get.height / 4.5,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                        );
                      }
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    GetBuilder<HomeController>(
                      builder: (ctrl) {
                        return Container(
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
                                        Text('${ctrl.orderModel.diningTable}'),
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
                                        Text('${ctrl.orderModel.customerName}'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Phone'),
                                        Text('${ctrl.orderModel.customerHp}'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Transaction ID'),
                                        Text('${ctrl.orderModel.orderNumber}'),
                                      ],
                                    ),
                              ],
                            ),
                          ),
                          height: Get.height / 6,
                          width: Get.width,
                          color: Colors.white,
                        );
                      }
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                     GetBuilder<HomeController>(
                      builder: (ctrl) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10.0, left: 10.0, right: 25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(
                                      'Payment',
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
                                        Text('Discount'),
                                        Text('${ctrl.orderModel.diningTable}'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Tax'),
                                        Text('30 April 2023'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Total Price'),
                                        Text('${ctrl.orderModel.customerName}'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Payment Method'),
                                        Text('${ctrl.orderModel.customerHp}'),
                                      ],
                                    ),
                                  
                              ],
                            ),
                          ),
                          height: Get.height / 7,
                          width: Get.width,
                          color: Colors.white,
                        );
                      }
                    ),

                    SizedBox(
                      height: 10.0,
                    ),
                    GetBuilder<HomeController>(
                      builder: (ctrl) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
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
                                    itemCount: ctrl.orderModel.cart.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(bottom:8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text('${ctrl.orderModel.cart[index].name}', style: TextStyle(fontWeight: FontWeight.bold),),
                                                Text('${CurrencyFormat.convertToIdr(ctrl.orderModel.cart[index].price, 0) } x ${ctrl.orderModel.cart[index].quantity}'),
                                              
                                              ],
                                            ),
                                            Text('${CurrencyFormat.convertToIdr(ctrl.orderModel.cart[index].totalPrice, 0) }'),
                                          ],
                                        ),
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
                        );
                      }
                    ),
                     SizedBox(
                      height: 10.0,
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

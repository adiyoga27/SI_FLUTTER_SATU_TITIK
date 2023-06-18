import 'package:flutter/material.dart';
import 'package:satutitik/constants/colors.dart';
import 'package:satutitik/controllers/CartController.dart';

import 'package:get/get.dart';
import 'package:satutitik/models/product.dart';

class FoodQuantity extends StatelessWidget {
  final ProductModel? food;
  final int? qty;
  const FoodQuantity({
    Key? key,
    this.food,
    this.qty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    controller.amount = food!.price!.toDouble();
    return Container(
        width: double.maxFinite,
        height: 40,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0.4, 0),
              child: InkWell(
                onTap: () => showAlertDialog(context, food!),
                child: Container(
                  height: double.maxFinite,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add to Cart',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.3, 0),
              child: Container(
                height: double.maxFinite,
                width: 100,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => controller.decrement(),
                      child: Text(
                        '-',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Text(
                        qty!.toString(),
                      ),
                    ),
                    InkWell(
                      onTap: () => controller.increment(),
                      child: Text(
                        '+',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  showAlertDialog(BuildContext context, ProductModel productModel) {
    final controller = Get.put(CartController());

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Batal Pesan"),
      onPressed: () => Navigator.of(context).pop(),
    );
    Widget continueButton = TextButton(
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(color: Colors.white)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
      child: Text("Lanjutkan"),
      onPressed: () {
        controller.addToCart(productModel.id!.toInt());
        Get.back();
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Apakah anda yakin ?"),
      content: Text(
          "Pesanan : \n\n${food!.name} x ${controller.count}\n\nPastikan jumlah pesanan anda sudah benar "),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

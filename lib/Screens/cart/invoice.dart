import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:satutitik/controllers/CartController.dart';
import 'package:satutitik/controllers/HomeController.dart';
import 'package:satutitik/helpers/formating_helper.dart';

import 'package:get/get.dart';

class InvoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ctrlHome = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Color(0xfff8f9fd),
      body: Obx(() {
        bool isLoading = ctrlHome.isLoadingCart.value;
        return isLoading
            ? Center(
                child: SizedBox(
                    width: 50, height: 50, child: CircularProgressIndicator()),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: GetBuilder<HomeController>(builder: (ctrl) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      ctrlHome.getAll();
                    },
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () => Get.back(),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                                child: Icon(Icons.arrow_back),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Transaction Out',
                                  textAlign: TextAlign.center,
                                ),
                                Text('Detail of transaction'),
                              ],
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Satu Titik Coffee'),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text('Total Pembayaran Anda'),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  CurrencyFormat.convertToIdr(
                                          ctrl.orderModel!.totalPrice, 0)
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
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
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        GetBuilder<HomeController>(builder: (ctrl) {
                          return Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 25.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('No Meja'),
                                      Text('${ctrl.orderModel!.diningTable}'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Date'),
                                      Text('30 April 2023'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),

                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Text('Nama'),
                                  //     Text('${ctrl.orderModel.customerName}'),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: 5.0,
                                  // ),  Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Text('Phone'),
                                  //     Text('${ctrl.orderModel.customerHp}'),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: 5.0,
                                  // ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Transaction ID'),
                                      Text('${ctrl.orderModel!.orderNumber}'),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 5.0,
                                  // ),
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Text('Status Pesanan'),
                                  //     Text(
                                  //       ctrl.orderModel!.status == 'pending'
                                  //           ? 'Belum Di Pesan'
                                  //           : "Sedang di Proses",
                                  //       style: TextStyle(
                                  //           color:
                                  //               ctrl.orderModel!.status == 'pending'
                                  //                   ? Colors.red
                                  //                   : Colors.green),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                            height: Get.height / 8,
                            width: Get.width,
                            color: Colors.white,
                          );
                        }),
                        SizedBox(
                          height: 10.0,
                        ),
                        GetBuilder<HomeController>(builder: (ctrl) {
                          return Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 25.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Discount'),
                                      Text('Rp ${ctrl.orderModel!.discount}'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Tax'),
                                      Text('Rp ${ctrl.orderModel!.tax}'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Text('Total Price'),
                                  //     Text('${ctrl.orderModel.customerName}'),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: 5.0,
                                  // ),  Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Text('Payment Method'),
                                  //     Text('${ctrl.orderModel.customerHp}'),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                            height: Get.height / 10,
                            width: Get.width,
                            color: Colors.white,
                          );
                        }),
                        SizedBox(
                          height: 10.0,
                        ),
                        GetBuilder<HomeController>(builder: (ctrl) {
                          return Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 10.0,
                                right: 25.0,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Order Detail',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemCount: ctrl.orderModel!.cart.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
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
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${ctrl.orderModel!.cart[index].name}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 2.0),
                                                      child: statusCart(
                                                          '${ctrl.orderModel!.cart[index].status}'),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Text(
                                                    '${CurrencyFormat.convertToIdr(ctrl.orderModel!.cart[index].price - ctrl.orderModel!.cart[index].discount, 0)} x ${ctrl.orderModel!.cart[index].quantity}'),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                    '${CurrencyFormat.convertToIdr(ctrl.orderModel!.cart[index].totalPrice, 0)}'),
                                                ctrl.orderModel!.cart[index]
                                                            .status ==
                                                        'pending'
                                                    ? InkWell(
                                                        onTap: () {
                                                          final ctrlCart = Get.put(
                                                              CartController());
                                                          // set up the buttons
                                                          Widget cancelButton =
                                                              TextButton(
                                                            child:
                                                                Text("Cancel"),
                                                            onPressed: () =>
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(),
                                                          );
                                                          Widget
                                                              continueButton =
                                                              TextButton(
                                                            style: ButtonStyle(
                                                                textStyle: MaterialStateProperty.all<
                                                                        TextStyle>(
                                                                    TextStyle(
                                                                        color: Colors
                                                                            .white)),
                                                                backgroundColor:
                                                                    MaterialStateProperty.all<Color>(
                                                                        Colors
                                                                            .red),
                                                                foregroundColor:
                                                                    MaterialStateProperty.all<
                                                                            Color>(
                                                                        Colors.white)),
                                                            child: Text(
                                                                "Lanjutkan"),
                                                            onPressed: () {
                                                              ctrlCart.deleteCart(
                                                                  ctrl
                                                                      .orderModel!
                                                                      .cart[
                                                                          index]
                                                                      .id);
                                                              Get.back();
                                                            },
                                                          );

                                                          AlertDialog alert =
                                                              AlertDialog(
                                                            title: Text(
                                                                "Apakah anda yakin ?"),
                                                            content: Text(
                                                                "Anda akan menghapus pesanan ini ${ctrl.orderModel!.cart[index].name}?"),
                                                            actions: [
                                                              cancelButton,
                                                              continueButton,
                                                            ],
                                                          );
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return alert;
                                                            },
                                                          );
                                                        },
                                                        child: Icon(
                                                          Icons.delete,
                                                          color: Colors.red,
                                                          size: 18.0,
                                                        ),
                                                      )
                                                    : SizedBox()
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            height: Get.height,
                            width: Get.width,
                            color: Colors.white,
                          );
                        }),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  );
                }));
      }),
      floatingActionButton: Obx(() {
        return ctrlHome.isLoadingCart.value ||
                ctrlHome.orderModel!.status == 'pending'
            ? FloatingActionButton.extended(
                onPressed: () {
                  final ctrlCart = Get.put(CartController());
                  // set up the buttons
                  Widget cancelButton = TextButton(
                    child: Text("Cancel"),
                    onPressed: () => Navigator.of(context).pop(),
                  );
                  Widget continueButton = TextButton(
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(color: Colors.white)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    child: Text("Lanjutkan"),
                    onPressed: () {
                      ctrlCart.checkout();
                      Get.back();
                    },
                  );

                  AlertDialog alert = AlertDialog(
                    title: Text("Apakah anda yakin ?"),
                    content: Text(
                        "Orderan tidak dapat dibatalkan jika telah di pesan !"),
                    actions: [
                      cancelButton,
                      continueButton,
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
                label: const Text('Pesan'),
                icon: const Icon(Icons.thumb_up),
                backgroundColor: Colors.pink,
              )
            : SizedBox();
      }),
    );
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

statusCart(String params) {
  if (params == 'pending') {
    return InkWell(
      onTap: () => Fluttertoast.showToast(
          msg: 'Pesanan belum masuk antrian, silahkan klik tombol Pesan !!!'),
      child: Icon(
        Icons.help,
        color: Colors.red,
        size: 15.0,
      ),
    );
  } else if (params == 'waiting') {
    return InkWell(
      onTap: () => Fluttertoast.showToast(
          msg: 'Pesanan sedang di check dari bagian dapur, Mohon Menunggu!!'),
      child: Icon(
        Icons.pending,
        color: Colors.blue,
        size: 15.0,
      ),
    );
  } else if (params == 'proses') {
    return InkWell(
      onTap: () => Fluttertoast.showToast(
          msg: 'Pesanan sedang disiapkan oleh Chief, Mohon menunggu !!'),
      child: Icon(
        Icons.change_circle,
        color: Colors.orange,
        size: 15.0,
      ),
    );
  } else {
    return InkWell(
      onTap: () => Fluttertoast.showToast(
          msg: 'Pesanan anda telah diantarakan ke meja pelanggan'),
      child: Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 15.0,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:satutitik/Screens/qr/scan.dart';
import 'package:satutitik/controllers/CartController.dart';

class ReservasiPage extends StatefulWidget {
  const ReservasiPage({Key? key}) : super(key: key);

  @override
  State<ReservasiPage> createState() => _ReservasiPageState();
}

class _ReservasiPageState extends State<ReservasiPage> {
  final controller = Get.put(CartController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fd),
      body: Stack(
        children: [
          Positioned(
              top: 200,
              right: Get.width / 3,
              left: Get.width / 3,
              child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.white,
                  child: Text('asdasdasd'))),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: Get.height / 2.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const Spacer(),
                        Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: controller.nameController,
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(19),
                                ],
                                decoration: InputDecoration(hintText: "Name"),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: TextFormField(
                                keyboardType: TextInputType.number,

                                controller: controller.phoneController,

                                    inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,

                                  LengthLimitingTextInputFormatter(14),
                                ],
                                  decoration:
                                      const InputDecoration(hintText: "Phone"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: ElevatedButton(
                            child: const Text("Scan QR Meja"),
                            onPressed: () => controller.gotToScan(),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
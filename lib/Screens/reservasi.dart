import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:satutitik/config/app_config.dart';
import 'package:satutitik/controllers/CartController.dart';
import 'package:satutitik/models/dropdownoption.dart';

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
      // backgroundColor: Color(0xfff8f9fd),
      backgroundColor: Colors.orange[200],
      body: Stack(
        children: [
          Positioned(
              top: Get.width / 2,
              right: Get.width / 3,
              left: Get.width / 3,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  width: 100.0,
                  height: 100.0,
                  child: Image.asset('assets/images/res_logo.png'))),
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: Get.height / 2.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Obx(() {
                        return Column(
                          children: [
                            const Spacer(),
                            Form(
                              child: Column(
                                children: [
                                  controller.isLoadingDrop.value
                                      ? SizedBox()
                                      : DropdownButtonFormField(
                                          value: controller.dinningTableSelect,
                                          items: controller.dinningModel != null
                                              ? controller.dinningModel
                                                  .map((element) =>
                                                      DropdownMenuItem<String>(
                                                          value: element.uuid,
                                                          child: Text(
                                                              element.name)))
                                                  .toList()
                                              : [],
                                          decoration: InputDecoration(
                                            labelText: 'Select a table',
                                          ),
                                          onChanged: (value) {
                                            print(value);
                                            controller.dinningTableSelect =
                                                value as String?;
                                          }),
                                  TextFormField(
                                    controller: controller.nameController,
                                    keyboardType: TextInputType.text,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(19),
                                    ],
                                    decoration:
                                        InputDecoration(hintText: "Name"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: controller.phoneController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(14),
                                      ],
                                      decoration: const InputDecoration(
                                          hintText: "Phone"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.orange),
                                ),
                                child: const Text("Reservasi"),
                                onPressed: () =>
                                    controller.goToReservasiTable(),
                              ),
                            ),
                            const Spacer(),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satutitik/controllers/CartController.dart';
import 'package:satutitik/controllers/ReservasiController.dart';
import 'package:get_storage/get_storage.dart';

class DinningTablePage extends StatefulWidget {
  const DinningTablePage({Key? key}) : super(key: key);

  @override
  State<DinningTablePage> createState() => _DinningTablePageState();
}

class _DinningTablePageState extends State<DinningTablePage> {
  final controller = Get.put(ReservasiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xfff8f9fd),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Center(child: Text("Meja Satu Titik")),
          automaticallyImplyLeading: false,
        ),
        body: Obx(() => controller.isLoading.value
            ? Center(
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  child: RefreshProgressIndicator(),
                ),
              )
            : GridView.builder(
                itemCount: controller.bookTableModel.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      if (controller.bookTableModel[i].isActive) {
                        final ctrlCart = Get.put(CartController());

                        final cookies = GetStorage();
                        cookies.write(
                            'uuid', controller.bookTableModel[i].uuid);
                        cookies.write(
                            'name',
                            "Customer " +
                                controller.bookTableModel[i].name.toString());
                        cookies.write('phone', "085792486889");
                        ctrlCart.reservasi(controller.bookTableModel[i].uuid);
                      }
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${controller.bookTableModel[i].name}',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              controller.bookTableModel[i].isActive
                                  ? "( Kosong )"
                                  : "( Penuh )",
                              style: TextStyle(
                                  color: controller.bookTableModel[i].isActive
                                      ? Colors.green
                                      : Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
              )));
  }
}

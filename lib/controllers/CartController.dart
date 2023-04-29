import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_app/Screens/cart/invoice.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var count = 0;
  double amount = 0;
  void increment() {
    count++;
    amount = amount * count;
    update();
  }

  void decrement() {
    if (count > 0) {
      count--;
      amount = amount * count;
      update();
    }
  }

  void addToCart() {}

  void showInvoice() {
    Get.to(InvoicePage());
  }
}

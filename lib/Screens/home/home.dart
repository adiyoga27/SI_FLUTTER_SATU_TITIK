import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:satutitik/Screens/cart/invoice.dart';
import 'package:satutitik/Screens/home/widget/food_list.dart';
import 'package:satutitik/Screens/home/widget/food_list_view.dart';
import 'package:satutitik/Screens/home/widget/restaurant_info.dart';
import 'package:satutitik/constants/colors.dart';
import 'package:satutitik/controllers/HomeController.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController = PageController();
  final homeCtrl = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    homeCtrl.getProduct();
    homeCtrl.getOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        body: Obx(() {
          bool isLoadingCategory = homeCtrl.isLoadingProduct.value;
          bool isLoadingProduct = homeCtrl.isLoadingProductByCategory.value;
          bool isLoadingCart = homeCtrl.isLoadingCart.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomAppBar(
              //   leftIcon: Icons.arrow_back,
              //   rightIcon: Icons.search,
              // ),
              SizedBox(
                height: 20.0,
              ),
              RestaurantInfo(),
              isLoadingCategory
                  ? SizedBox()
                  : FoodList(
                      category: homeCtrl.categoryModel,
                      selected: homeCtrl.selectedCategory.value,
                      callback: (int index, int categoryId) {
                        // Fluttertoast.showToast(msg: categoryId.toString());
                        homeCtrl.getProductByCategory(categoryId);
                      },
                    ),
              isLoadingProduct
                  ? Center(
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Expanded(
                      child: FoodListView(
                      orderModel: homeCtrl.orderModel,
                      selected: homeCtrl.selectedCategory.value,
                      // callback: (int index) {
                      //   setState(() {
                      //     homeCtrl.selectedCategory.value = index;
                      //   });
                      // },
                      productModel: homeCtrl.productModel,
                    )),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 25),
              //   height: 60,
              //   child: SmoothPageIndicator(
              //     controller: pageController,
              //     count: homeCtrl.categoryModel.length,
              //     effect: CustomizableEffect(
              //       dotDecoration: DotDecoration(
              //         width: 8,
              //         height: 8,
              //         color: Colors.grey.withOpacity(0.5),
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //       activeDotDecoration: DotDecoration(
              //         width: 10,
              //         height: 10,
              //         color: kBackground,
              //         borderRadius: BorderRadius.circular(10),
              //         dotBorder: DotBorder(
              //           color: kPrimaryColor,
              //           padding: 2,
              //           width: 2,
              //         ),
              //       ),
              //     ),
              //     // onDotClicked: (index) => pageController.jumpToPage(index),
              //   ),
              // )
            ],
          );
        }),
        floatingActionButton: Obx(() => homeCtrl.isLoadingCart.value
            ? RawMaterialButton(
                onPressed: () => {},
                fillColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                elevation: 2,
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                  size: 30,
                ),
              )
            : Container(
                width: 100,
                height: 56,
                child: RawMaterialButton(
                  onPressed: () => {
                    if (homeCtrl.orderModel!.cart.length > 0)
                      {Get.to(InvoicePage())}
                    else
                      {
                        Fluttertoast.showToast(
                            msg:
                                'Silahkan pilih produk yang dibeli terlebih dahulu!!')
                      }
                  },
                  fillColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  elevation: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Text(
                          '${homeCtrl.orderModel!.cart.length.toString()}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ))));
  }
}

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:satutitik/Screens/cart/invoice.dart';
import 'package:satutitik/Screens/home/widget/food_list.dart';
import 'package:satutitik/Screens/home/widget/food_list_view.dart';
import 'package:satutitik/Screens/home/widget/restaurant_info.dart';
import 'package:satutitik/constants/colors.dart';
import 'package:satutitik/controllers/HomeController.dart';
import 'package:satutitik/models/restaurant.dart';
import 'package:satutitik/widgets/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    // TODO: implement initState
    super.initState();
    homeCtrl.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Obx(() {
        bool isLoadingCategory = homeCtrl.isLoadingProduct.value;
        bool isLoadingProduct = homeCtrl.isLoadingProduct.value;
        bool isLoadingCart = homeCtrl.isLoadingCart.value;

        return isLoadingCategory || isLoadingProduct || isLoadingCart
            ? Center(
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
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
                  FoodList(
                    category: homeCtrl.categoryModel,
                    selected: homeCtrl.selectedCategory.value,
                    callback: (int index, int categoryId) {
                      homeCtrl.getProductByCategory(categoryId);
                      setState(() {
                        homeCtrl.selectedCategory.value = categoryId;
                        print(index);
                      });
                    },
                  ),
                  homeCtrl.isLoadingProductByCategory.value
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
                          callback: (int index) {
                            setState(() {
                              homeCtrl.selectedCategory.value = index;
                            });
                          },
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
    floatingActionButton: 
    Obx(() {
        return  homeCtrl.isLoadingCart.value ||  homeCtrl.isLoadingProduct.value || homeCtrl.isLoadingProduct.value ? RawMaterialButton(
                onPressed: () => Get.to(InvoicePage()),
                fillColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                elevation: 2,
                child:  Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
             
 
    ) :  Container(
              width: 100,
              height: 56,
              child:   RawMaterialButton(
                onPressed: () => Get.to(InvoicePage()),
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
                        homeCtrl.orderModel.cart.length.obs.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
             
 
    ));
    })
 );
  }
}

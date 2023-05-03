import 'package:flutter/material.dart';
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
  var selected = 0;
  final pageController = PageController();
  final restaurant = Restaurant.generateRestaurant();
  final homeCtrl = Get.put(HomeController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Obx(() {
        bool isLoadingCategory = homeCtrl.isLoadingCategory.value;
        bool isLoadingProduct = homeCtrl.isLoadingProduct.value;

        return isLoadingCategory || isLoadingProduct
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
                    selected: selected,
                    restaurant: restaurant,
                    callback: (int index) {
                      setState(() {
                        selected = index;
                      });
                      pageController.jumpToPage(index);
                    },
                  ),
                  Expanded(
                      child: FoodListView(
                    selected: selected,
                    callback: (int index) {
                      setState(() {
                        selected = index;
                      });
                    },
                    pageController: pageController,
                    restaurant: restaurant,
                    productModel: homeCtrl.productModel,
                  )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    height: 60,
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: restaurant.menu.length,
                      effect: CustomizableEffect(
                        dotDecoration: DotDecoration(
                          width: 8,
                          height: 8,
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        activeDotDecoration: DotDecoration(
                          width: 10,
                          height: 10,
                          color: kBackground,
                          borderRadius: BorderRadius.circular(10),
                          dotBorder: DotBorder(
                            color: kPrimaryColor,
                            padding: 2,
                            width: 2,
                          ),
                        ),
                      ),
                      onDotClicked: (index) => pageController.jumpToPage(index),
                    ),
                  )
                ],
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(InvoicePage()),
        elevation: 2,
        backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.shopping_bag_outlined,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}

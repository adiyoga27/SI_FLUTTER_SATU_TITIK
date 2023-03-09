import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:satutitik/app/data/colors.dart';
import 'package:satutitik/app/modules/product/views/food_card.dart';
import 'package:satutitik/app/widgets/clipper.dart';
import 'package:unicons/unicons.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> popularFood = [
      {
        'name': 'Tandoori Chicken',
        'price': '96.00',
        'rate': '4.9',
        'clients': '200',
        'image': 'assets/images/plate-001.png'
      },
      {
        'name': 'Salmon',
        'price': '40.50',
        'rate': '4.5',
        'clients': '168',
        'image': 'assets/images/plate-002.png'
      },
      {
        'name': 'Rice and meat',
        'price': '130.00',
        'rate': '4.8',
        'clients': '150',
        'image': 'assets/images/plate-003.png'
      },
      {
        'name': 'Vegan food',
        'price': '400.00',
        'rate': '4.2',
        'clients': '150',
        'image': 'assets/images/plate-007.png'
      },
      {
        'name': 'Rich food',
        'price': '1000.00',
        'rate': '4.6',
        'clients': '10',
        'image': 'assets/images/plate-006.png'
      }
    ];

    final List<Map<String, String>> foodOptions = [
      {
        'name': 'Proteins',
        'image': 'assets/images/Icon-001.png',
      },
      {
        'name': 'Burger',
        'image': 'assets/images/Icon-002.png',
      },
      {
        'name': 'Fastfood',
        'image': 'assets/images/Icon-003.png',
      },
      {
        'name': 'Salads',
        'image': 'assets/images/Icon-004.png',
      }
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorSiji,
        brightness: Brightness.light,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.center,
                width: 65,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      UniconsLine.shopping_cart,
                      color: Colors.white,
                    ),
                    SizedBox(width: 2),
                    Text(
                      '9',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  // custom app bar
                  ClipPath(
                    clipper: BottomClipper(),
                    child: Container(
                      width: Get.width,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),

                  ClipPath(
                    clipper: BottomClipper(),
                    child: Container(
                      width: Get.width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: colorSiji,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),

                  // custom app bar
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // heading text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Deliver to',
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Tulangan, ID',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // search field
                        SizedBox(height: 20),
                        SizedBox(
                          height: 55,
                          child: TextFormField(
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: colorSijiSetengah,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.only(top: 10),
                              hintText: 'Search for something tasty...',
                              hintStyle:
                                  GoogleFonts.poppins(color: Colors.grey),
                              prefixIcon: Icon(
                                UniconsLine.search,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),

                        // widget tengah
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: Text(
                  'Category Your Order',
                  style: TextStyle(fontSize: 21.0),
                ),
              ),
              Container(
                height: 105,
                margin: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 25.0,
                ),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    itemCount: foodOptions.length,
                    itemBuilder: (context, index) {
                      Map<String, String> option = foodOptions[index];
                      return Container(
                        margin: const EdgeInsets.only(right: 35.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 70,
                              height: 70,
                              margin: const EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    option['image']!,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10.0,
                                    color: Colors.grey[300]!,
                                    offset: Offset(6.0, 6.0),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              option['name']!,
                              style: TextStyle(fontSize: 17.0),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                child: Text(
                  'Popular Food',
                  style: TextStyle(fontSize: 21.0),
                ),
              ),
              Container(
                height: 220.0,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 10.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: popularFood.length,
                  itemBuilder: (context, index) {
                    Map<String, String> product = popularFood[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(
                        //   context,
                        //   'details',
                        //   arguments: {
                        //     'product': product,
                        //     'index': index,
                        //   },
                        // );
                      },
                      child: Hero(
                        tag: 'detail_food$index',
                        child: FoodCard(
                          width: Get.width / 2 - 30.0,
                          primaryColor: colorSiji,
                          productName: product['name']!,
                          productPrice: product['price']!,
                          productUrl: product['image']!,
                          productClients: product['clients']!,
                          productRate: product['rate']!,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  bottom: 10.0,
                  top: 35.0,
                ),
                child: Text(
                  'Best Food',
                  style: TextStyle(fontSize: 21.0),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Map<String, String> localProduct = {
                  //   'name': 'The number one!',
                  //   'price': '26.00',
                  //   'rate': '5.0',
                  //   'clients': '150',
                  //   'image': 'assets/images/plate-005.jpg'
                  // };
                  // Navigator.pushNamed(context, 'details', arguments: {
                  //   'product': localProduct,
                  //   'index': popularFood.length
                  // });
                },
                child: Hero(
                  tag: 'detail_food${popularFood.length}',
                  child: Container(
                    width: Get.width - 100,
                    color: Colors.white,
                    padding: const EdgeInsets.only(bottom: 10.0),
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 15.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              height: Get.width - 200,
                              width: Get.width - 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/plate-005.jpg'),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              margin: const EdgeInsets.all(10.0),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  size: 25.0,
                                  color: colorSiji,
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 4.0,
                            left: 10.0,
                            right: 10.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'The number one!',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[300]!,
                                        blurRadius: 4.0,
                                        offset: Offset(3.0, 3.0),
                                      )
                                    ]),
                                child: Icon(
                                  Icons.near_me,
                                  size: 22.0,
                                  color: colorSiji,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5.0,
                            left: 10.0,
                            right: 10.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '5.0 \(150\)',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Text(
                                '\$ 26.00',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

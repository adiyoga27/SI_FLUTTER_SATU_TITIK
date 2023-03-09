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

class ListProduct extends GetView<ProductController> {
  const ListProduct({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Homestay'),
          centerTitle: true,
        ),
        body: ListView(
            physics: BounceScroll(),
            padding: const EdgeInsets.all(20),
            children: List.generate(15, (i) {
              return Container(
                margin: EdgeInsets.only(b: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {},
                    focusColor: Colors.white,
                    padding: EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: Caa.start,
                      children: [
                        GetImage(
                          'https://images.tokopedia.net/blog-tokopedia-com/uploads/2020/01/traveling.jpg',
                          size: 100,
                          fit: BoxFit.cover,
                          radius: Const.radius,
                          margin: Ei.only(r: 15),
                        ),
                        Flexible(
                          child: Col(
                            children: [
                              Text(
                                'Cultural Experience',
                                style: Gfont.muted,
                              ),
                              Text(
                                'Art Buffet and Rug Tufting Experience in Singapore',
                                style: Gfont.bold,
                              ),
                              Textr(
                                '4,5',
                                style: Gfont.bold.fcolor(Colors.orange),
                                icon: La.star,
                                margin: Ei.only(t: 5, b: 15),
                              ),
                              Text(
                                'From ${Faker.price()}',
                                style: Gfont.bold,
                              ),
                              Container(
                                padding: Ei.sym(v: 2, h: 5),
                                margin: Ei.only(t: 10),
                                decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(.2),
                                    borderRadius: Br.radius(5)),
                                child: Text(
                                  'Up to 45% off',
                                  style: Gfont.color(Colors.orange).fsize(14),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            })));
  }
}

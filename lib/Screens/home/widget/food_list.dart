import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:satutitik/constants/colors.dart';
import 'package:satutitik/models/category.dart';

import 'package:satutitik/models/restaurant.dart';

class FoodList extends StatelessWidget {
  final int? selected;
  final Function? callback;
  final List<CategoryModel>? category;
  const FoodList({
    Key? key,
    this.selected,
    this.callback,
    this.category,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 30),
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => callback!(index, category![index].id),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: selected == category![index].id ? kPrimaryColor : Colors.white,
                  ),
                  child: Text(category![index].name!,
                      style: TextStyle(
                          color:
                              selected == category![index].id ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
          separatorBuilder: (_, index) => SizedBox(
                width: 20,
              ),
          itemCount: category!.length),
    );
  }
}

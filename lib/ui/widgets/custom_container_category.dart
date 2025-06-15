import 'package:flutter/material.dart';
import 'package:news/core/app_colors.dart';
import 'package:news/data/models/category_model.dart';
import 'package:news/ui/screens/home_screen.dart';

class CustomContainerCategory extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index;
  const CustomContainerCategory({
    super.key,
    required this.categoryModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    bool isEven = index % 2 == 0;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HomeScreen.routeName,
          arguments: categoryModel,
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        height: h * 0.25,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.blackColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          textDirection: isEven ? TextDirection.ltr : TextDirection.rtl,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: Image.asset(
                fit: BoxFit.cover,
                categoryModel.image,
                width: w * 0.45,
                height: h * 0.25,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 28,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      categoryModel.name,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  viewAllWidget(h: h, w: w, isEven: isEven),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget viewAllWidget({
  required double h,
  required double w,
  required bool isEven,
}) {
  return Container(
    height: h * 0.06,
    width: w * 0.40,
    decoration: BoxDecoration(
      color: AppColors.greyColor,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Row(
      textDirection: isEven ? TextDirection.ltr : TextDirection.rtl,
      children: [
        Spacer(),
        Text(
          "View All",
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.whiteColor,
          child: Icon(
            isEven
                ? Icons.arrow_forward_ios_rounded
                : Icons.arrow_back_ios_rounded,
            size: 20,
          ),
        ),
      ],
    ),
  );
}

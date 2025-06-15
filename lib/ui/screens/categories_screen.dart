import 'package:flutter/material.dart';
import 'package:news/data/models/category_model.dart';
import 'package:news/ui/widgets/custom_app_bar.dart';
import 'package:news/ui/widgets/custom_container_category.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/categories';
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var categoryModel = CategoryModel.categories
        .map(
          (categoryModel) => CustomContainerCategory(
            categoryModel: categoryModel,
            index: CategoryModel.categories.indexOf(categoryModel),
          ),
        )
        .toList();
    return Scaffold(
      drawer: Drawer(),
      appBar: CustomAppBar(title: "Home"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning\nHere is Some News For You",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              ...categoryModel,
            ],
          ),
        ),
      ),
    );
  }
}

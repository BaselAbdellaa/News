import 'package:news/core/app_assets.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  CategoryModel({required this.id, required this.name, required this.image});

  static List<CategoryModel> categories = [
    CategoryModel(id: "general", name: "General", image: AppAssets.general),
    CategoryModel(id: "business", name: "Business", image: AppAssets.business),
    CategoryModel(id: "sports", name: "Sports", image: AppAssets.sports),
    CategoryModel(id: "health", name: "Health", image: AppAssets.health),
    CategoryModel(
      id: "entertainment",
      name: "Entertainment",
      image: AppAssets.entertainment,
    ),
    CategoryModel(
      id: "technology",
      name: "Technology",
      image: AppAssets.technology,
    ),
    CategoryModel(id: "science", name: "Science", image: AppAssets.science),
  ];
}

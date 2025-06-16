import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/core/app_colors.dart';
import 'package:news/data/models/category_model.dart';
import 'package:news/ui/screens/news_sources_view.dart';
import 'package:news/ui/widgets/custom_app_bar.dart';
import 'package:news/ui/widgets/loading_widget.dart';
import 'package:news/ui/widgets/news_list_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late CategoryModel _categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: CustomAppBar(title: _categories.name),
      body: FutureBuilder(
        future: ApiManager.getInstance().getSources(_categories.id),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return LoadingWidget();
          }else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }
          var sources = snapshot.data?.sources;
          return NewsSourcesView(sources:sources ,);
        },
      ),
    );
  }

  @override
  void didChangeDependencies() {
    _categories = ModalRoute.of(context)!.settings.arguments as CategoryModel;
    super.didChangeDependencies();
  }
}

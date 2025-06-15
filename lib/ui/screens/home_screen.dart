import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news/core/app_colors.dart';
import 'package:news/data/dummy_data.dart';
import 'package:news/data/models/category_model.dart';
import 'package:news/data/models/news_model.dart';
import 'package:news/ui/widgets/custom_app_bar.dart';
import 'package:news/ui/widgets/news_list_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late CategoryModel categories;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: dummySources.length);
    if (!_tabController.indexIsChanging) {
      fetchNewDataForTab();
      setState(() {});
    }
    fetchNewDataForTab();
    setState(() {});
  }

  List<NewsArticle> fetchNewDataForTab() {
    var randomdata = Random().nextInt(dummyNews.length) + 1;
    return dummyNews.take(randomdata).toList();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    categories = ModalRoute.of(context)!.settings.arguments as CategoryModel;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: dummySources.length,
      child: Scaffold(
        drawer: Drawer(),
        appBar: CustomAppBar(
          height: 100,
          title: categories.name,
          tabBar: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: buildTabs(),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: dummySources
              .map((e) => NewsListView(news: fetchNewDataForTab()))
              .toList(),
        ),
      ),
    );
  }

  List<Tab> buildTabs() {
    return dummySources
        .map(
          (source) => Tab(
            child: Text(
              source.name ?? "",
              style: TextStyle(fontSize: 20, color: AppColors.blackColor),
            ),
          ),
        )
        .toList();
  }
}

//test
//test

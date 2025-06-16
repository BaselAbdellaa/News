import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/core/app_colors.dart';
import 'package:news/data/models/sourceReponse/Sources.dart';
import 'package:news/ui/widgets/loading_widget.dart';
import 'package:news/ui/widgets/news_list_view.dart';

class NewsSourcesView extends StatefulWidget {
  NewsSourcesView({super.key, this.sources});
  List<Source>? sources;

  @override
  State<NewsSourcesView> createState() => _NewsSourcesViewState();
}

class _NewsSourcesViewState extends State<NewsSourcesView>
    with SingleTickerProviderStateMixin {
  // late TabController _tabController;
  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(vsync: this, length: widget.sources!.length);
  //   // if (!_tabController.indexIsChanging) {
  //   //   fetchNewDataForTab();
  //   //   setState(() {});
  //   // }
  //   // fetchNewDataForTab();
  //   setState(() {});
  // }

  // List<NewsArticle> fetchNewDataForTab() {
  //   var randomdata = Random().nextInt(dummyNews.length) + 1;
  //   return dummyNews.take(randomdata).toList();
  // }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  @override
  void didChangeDependencies() {
    // categories = ModalRoute.of(context)!.settings.arguments as CategoryModel;
    super.didChangeDependencies();
  }
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources!.length,
      child: Column(
        children: [
          TabBar(
            // controller: _tabController,
            isScrollable: true,
            tabs: buildTabs(widget.sources!),
            onTap: (value) {
              setState(() {
                selectedIndex = value;

              });
            },
          ),
          // TabBarView(
          //   controller: _tabController,
          //   children: dummySources
          //       .map((e) => NewsListView(news: fetchNewDataForTab()))
          //       .toList(),
          // ),
          FutureBuilder(future: ApiManager.getInstance().getNews(widget.sources![selectedIndex].id??"")
              , builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return LoadingWidget();
              }else if(snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()),);
              }
              var newsList = snapshot.data?.articles ?? [];
              return Expanded(child: NewsListView(news: newsList));
              },)
        ],


      ),
    );
  }

  List<Tab> buildTabs(List<Source> sources) {
    return sources
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

import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/core/app_colors.dart';
import 'package:news/data/models/NewsResponse/Articles.dart';
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
  int page = 1;
  final _controller = ScrollController();
  List<NewsArticles> newsList = [];
  bool nextPage = false;
  @override
  void initState() {
    super.initState();

    // Setup the listener.
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (!isTop) {
          setState(() {
            nextPage = true;
            page++;
          });
        }
      }
    });
  }
@override
void dispose() {
    super.dispose();
    _controller.dispose();
  }
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
                page = 1;
                newsList.clear();
                nextPage = false;
              });
            },
          ),
          // TabBarView(
          //   controller: _tabController,
          //   children: dummySources
          //       .map((e) => NewsListView(news: fetchNewDataForTab()))
          //       .toList(),
          // ),
          FutureBuilder(
            future: ApiManager.getInstance().getNews(
              widget.sources![selectedIndex].id ?? "",
              page: page,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting &&
                  newsList.isEmpty) {
                return LoadingWidget();
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              if(newsList.isEmpty || nextPage){
                newsList.addAll(snapshot.data?.articles ?? []);
                nextPage=false;
              }

              print(newsList.length);
              print(page);
              return  Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      page = 1;
                      newsList.clear();
                    });

                    final response = await ApiManager.getInstance()
                        .getNews(widget.sources![selectedIndex].id ?? "", page: page);

                    setState(() {
                      newsList.addAll(response.articles ?? []);
                    });
                  },
                  child: NewsListView(news: newsList, controller: _controller),
                ),
              );

            },
          ),
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

import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/data/models/NewsResponse/Articles.dart';
import 'package:news/ui/widgets/loading_widget.dart';
import 'package:news/ui/widgets/news_list_view.dart';

class NewsSearchDelegate extends SearchDelegate{
  List<NewsArticles> newsList = [];


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => showResults(context), icon: Icon(Icons.search,size: 30,))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
   return IconButton(onPressed: () {
      Navigator.pop(context);
    }, icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {

    if(query.isEmpty){
      return Center(child: Text("No Data To Search Yet"),);
    }
    return FutureBuilder(
      future: ApiManager.getInstance().searchNews(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            newsList.isEmpty) {
          return LoadingWidget();
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        newsList.addAll(snapshot.data?.articles ?? []);
        return  Expanded(
          child: NewsListView(news: newsList),
        );

      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<NewsArticles> newsList = [];
    if(query.isEmpty){
      return Center(child: Text("No Data To Search Yet"),);
    }
    return FutureBuilder(
      future: ApiManager.getInstance().searchNews(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            newsList.isEmpty) {
          return LoadingWidget();
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

          newsList.addAll(snapshot.data?.articles ?? []);


        return  Expanded(
          child: NewsListView(news: newsList),
        );

      },
    );
  }

}
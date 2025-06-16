import 'package:flutter/material.dart';
import 'package:news/data/models/NewsResponse/Articles.dart';
import 'package:news/ui/widgets/news_item.dart';


class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.news});
  final List<NewsArticles> news;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => NewsItem(newsArticle: news[index]),
      itemCount: news.length,
    );
  }
}

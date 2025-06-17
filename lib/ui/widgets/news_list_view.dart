import 'package:flutter/material.dart';
import 'package:news/data/models/NewsResponse/Articles.dart';
import 'package:news/ui/widgets/custom_container_for_bottom_sheet.dart';
import 'package:news/ui/widgets/news_item.dart';


class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.news,  this.controller});
  final List<NewsArticles> news;
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller:controller ,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder:
                  (context) => CustomContainerForBottomSheet(
                    content: news[index].content??""
                    ,image: news[index].urlToImage??"",urlReq: news[index].url??"",));
        },
          child: NewsItem(newsArticle: news[index])
      ),
      itemCount: news.length,
    );
  }
}

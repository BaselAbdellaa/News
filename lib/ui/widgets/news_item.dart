import 'package:flutter/material.dart';
import 'package:news/core/app_colors.dart';
import 'package:news/data/models/news_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.newsArticle});
  final NewsArticle newsArticle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.blackColor, width: 1.5),
      ),
      child: Column(
        spacing: 12,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.3,
              "https://ichef.bbci.co.uk/news/1024/cpsprodpb/3d0e/live/0ced2c00-48d1-11f0-8feb-e38ae274979f.jpg.webp",
            ),
          ),
          Text(
            newsArticle.description,
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "By : ${newsArticle.author}",
                style: TextStyle(color: AppColors.greyColor),
              ),
              Text(
                timeago.format(DateTime.parse(newsArticle.publishedAt)),
                style: TextStyle(color: AppColors.greyColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

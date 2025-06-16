import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/app_colors.dart';
import 'package:news/data/models/NewsResponse/Articles.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.newsArticle});
  final NewsArticles newsArticle;
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
            child: CachedNetworkImage(
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageUrl: newsArticle.urlToImage ??"",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.3,

            ),
          ),
          Text(
            newsArticle.description??"",
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
                "By : ${newsArticle.author ?? "Unknown"}",
                style: TextStyle(color: AppColors.greyColor),
              ),
              Text(
                timeago.format(DateTime.parse(newsArticle.publishedAt??"")),
                style: TextStyle(color: AppColors.greyColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/app_colors.dart';
import 'package:news/ui/screens/web_view.dart';

class CustomContainerForBottomSheet extends StatelessWidget {
  const CustomContainerForBottomSheet({super.key, required this.image, required this.content, required this.urlReq});
  final String image;
  final String content;
  final String urlReq;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.blackColor,
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
              imageUrl: image,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.3,

            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                content,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => WebView(urlReq: urlReq),));
          }, child: Text("View Full Article",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),))
        ],
      ),
    );
  }
}

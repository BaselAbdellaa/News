import 'package:flutter/material.dart';
import 'package:news/ui/screens/news_search_delegate.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.tabBar,
    required this.title,
    this.height,
  });
  final TabBar? tabBar;
  final String title;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      bottom: tabBar,
      centerTitle: true,
      actions: [
        IconButton(onPressed: () => showSearch(context: context, delegate: NewsSearchDelegate()), icon: Icon(Icons.search, size: 30)),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, height ?? 50);
}

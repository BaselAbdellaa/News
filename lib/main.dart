import 'package:flutter/material.dart';
import 'package:news/ui/screens/categories_screen.dart';
import 'package:news/ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        CategoriesScreen.routeName: (context) => CategoriesScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      initialRoute: CategoriesScreen.routeName,
    );
  }
}

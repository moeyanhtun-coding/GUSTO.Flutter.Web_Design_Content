import 'package:flutter/material.dart';
import 'package:flutter_web_responsive/view/about_us.dart';
import 'package:flutter_web_responsive/view/category_page.dart';
import 'package:flutter_web_responsive/view/contact_us.dart';
import 'package:flutter_web_responsive/view/detail_page.dart';
import 'package:flutter_web_responsive/view/favorite_page.dart';
import 'package:flutter_web_responsive/view/home_page.dart';
import 'package:flutter_web_responsive/view/login_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = [
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/detail', page: () => const DetailPage()),
    GetPage(name: "/category", page: () => CategoryPage()),
    GetPage(name: "/contactUs", page: () => ContactUs()),
    GetPage(name: "/favorite", page: () => FavoritePage()),
    GetPage(name: "/home", page: () => HomePage()),
    GetPage(name: "/aboutUs", page: () => AboutUs()),
  ];
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: routes,
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

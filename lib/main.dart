import 'package:flutter/material.dart';
import 'package:flutter_web_responsive/view/category_page.dart';
import 'package:flutter_web_responsive/view/detail_page.dart';
import 'package:flutter_web_responsive/view/login_page.dart';
import 'package:flutter_web_responsive/view/register_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = [
    GetPage(name: '/register', page: () => const RegisterPage()),
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/detail', page: () => const DetailPage()),
    GetPage(name: "/category", page: () => CategoryPage())
  ];
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: routes,
      debugShowCheckedModeBanner: false,
      home: CategoryPage(),
    );
  }
}

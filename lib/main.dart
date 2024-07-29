import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_responsive/view/about_uss.dart';
import 'package:flutter_web_responsive/view/category_page.dart';
import 'package:flutter_web_responsive/view/contact_us.dart';
import 'package:flutter_web_responsive/view/detail_page.dart';
import 'package:flutter_web_responsive/view/favorite_page.dart';
import 'package:flutter_web_responsive/view/home_page.dart';
import 'package:flutter_web_responsive/view/login_page.dart';
import 'package:flutter_web_responsive/view/service_page.dart';
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
    GetPage(name: "/aboutUs", page: () => AboutUss()),
    GetPage(name: "/service", page: () => ServicePage())
  ];
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "H O M E _ H A V E N",
      getPages: routes,
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final List<String> items = [
    'For Buy',
    'For Rent',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              'Feature',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: items
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
              });
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 140,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}

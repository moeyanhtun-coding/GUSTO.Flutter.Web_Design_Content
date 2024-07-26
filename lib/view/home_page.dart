import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_responsive/constants.dart';

final List<String> imgList = [
  "https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/10628388/pexels-photo-10628388.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/5447712/pexels-photo-5447712.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/164558/pexels-photo-164558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/1105754/pexels-photo-1105754.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/4030036/pexels-photo-4030036.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/9459187/pexels-photo-9459187.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/4070968/pexels-photo-4070968.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/209315/pexels-photo-209315.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildUI());
  }

  Widget _buildUI() {
    return Row(
      children: [
        myDrawer,
        Expanded(child: _container()),
      ],
    );
  }

  Widget _container() {
    return Container(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          // Background image with opacity
          Opacity(
            opacity: 0.5, // Adjust the opacity as needed
            child: Image.network(
              'https://images.pexels.com/photos/280221/pexels-photo-280221.jpeg?auto=compress&cs=tinysrgb&w=800', // Replace with your image URL
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Text on top of the background image
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Margin(width: 0, height: 90),
                _homePageRow1(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _homePageRow1() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
      child: Row(
        children: [
          Expanded(child: _textColumn()),
          Expanded(child: _carouselImage()),
        ],
      ),
    );
  }

  Widget _textColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _homeText("Find Real Estate", 80, FontWeight.bold),
        _homeText("And Get Your", 80, FontWeight.bold),
        _homeText("Dream Space", 80, FontWeight.bold)
      ],
    );
  }

  Widget _homeText(String text, double size, FontWeight weight) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: Color.fromRGBO(214, 239, 216, 1),
          decoration: TextDecoration.none),
    );
  }

  Widget _carouselImage() {
    return Column(
      children: [
        CarouselSlider(
          items: imgList
              .map(
                (e) => Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      e,
                      height: MediaQuery.sizeOf(context).height * 0.6,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: const Duration(milliseconds: 2000),
              enlargeCenterPage: true,
              enlargeFactor: 0.5,
              onPageChanged: (value, _) {
                setState(() {
                  _currentPage = value;
                });
              }),
        ),
      ],
    );
  }
}

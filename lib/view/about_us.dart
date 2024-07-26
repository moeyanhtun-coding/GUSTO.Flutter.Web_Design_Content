import 'package:carousel_slider/carousel_options.dart';
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

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(214, 239, 216, 0.6), body: _buildUI());
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
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Margin(width: 0, height: 70),
              Row(
                children: [
                  Margin(width: 30, height: 0),
                  Expanded(child: _textRow2()),
                  Expanded(child: _carouselImage()),
                ],
              ),
              Margin(width: 0, height: 30),
              _textRow()
            ],
          ),
        ],
      ),
    );
  }

  Widget _textRow() {
    return Row(
      children: [
        Expanded(
            child: _aboutUsColumn("Our Mission", "assets/images/mission.png",
                "To provide high-quality rental homes that enhance the living experience of our tenants, ensuring comfort, safety, and community. We are dedicated to offering exceptional customer service, maintaining the highest standards of property management, and creating lasting relationships with our tenants.")),
        Expanded(
            child: _aboutUsColumn("Our Vision", "assets/images/vision.png",
                "To be the leading house renting agency renowned for transforming houses into homes, fostering vibrant communities, and setting a benchmark for excellence in the rental market. We aspire to grow sustainably, innovate continuously, and positively impact the lives of our tenants and the communities we serve.")),
        Expanded(
            child: _aboutUsColumn("Our Promise", "",
                " Implementing rigorous safety measures and maintaining secure, peaceful neighborhoods.Ensuring that each property is well-maintained, clean, and equipped with modern amenities.,Delivering prompt and effective customer service to address any issues or concerns you may have.")),
      ],
    );
  }

  Widget _textRow2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _text("About Us", 30, FontWeight.bold),
        Margin(width: 0, height: 20),
        _text(
          "Home Heaven, founded in 2005, started as a small local agency with a vision to revolutionize home renting and selling. Our dedication to customer satisfaction and innovative approach fueled our growth nationwide. Over the years, we've helped thousands find their perfect homes, earning a reputation for excellence and integrity. Today, we continue to embrace new technologies and trends, offering unparalleled service and support. Welcome to Home Heaven—where your dream home awaits.",
          15,
          FontWeight.bold,
        ),
      ],
    );
  }

  Widget _text(String text, double size, FontWeight fontW) {
    return Text(
      text,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: size,
        color: Colors.black,
        fontWeight: fontW,
      ),
    );
  }

  Widget _aboutUsColumn(
    String text,
    String img,
    String text1,
  ) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(img),
              radius: 50,
              backgroundColor: Colors.transparent,
            ),
            Text(
              text,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              text1,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
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
            },
          ),
        ),
      ],
    );
  }
}

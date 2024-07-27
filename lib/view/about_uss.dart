import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_responsive/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class AboutUss extends StatefulWidget {
  const AboutUss({super.key});

  @override
  State<AboutUss> createState() => _AboutUssState();
}

class _AboutUssState extends State<AboutUss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(214, 239, 216, 0.6),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Row(
      children: [
        myDrawer,
        Expanded(
          child: _conatiner(),
        )
      ],
    );
  }

  Widget _conatiner() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        children: [
          Column(
            children: [
              Margin(width: 0, height: 80),
              _homePageRow1(),
              Margin(width: 0, height: 40),
              _aboutRow2(),
              Margin(width: 0, height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Color.fromARGB(255, 139, 139, 139),
                ),
              ),
              Margin(width: 0, height: 10),
              _aboutRow5()
            ],
          ),
        ],
      ),
    );
  }

  Widget _aboutRow5() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Experience the serenity and comfort you deserve. Meet us at your perfect retreat today. Our team waiting you.',
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.facebook,
                color: Color.fromARGB(255, 1, 115, 209),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.instagram,
                color: Colors.redAccent,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.twitter,
                color: Colors.blueAccent,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _homePageRow1() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
      child: Row(
        children: [
          Margin(width: 100, height: 0),
          Expanded(child: _aboutTextColumn()),
          Expanded(child: _carouselImage()),
          Margin(width: 130, height: 0),
        ],
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
                setState(() {});
              }),
        ),
      ],
    );
  }

  Widget _aboutTextColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _aboutText("The Best ", Colors.grey.shade900, 20, FontWeight.w900),
            _aboutText("Choice ", Colors.green, 20, FontWeight.w900),
            _aboutText("For You!", Colors.grey.shade900, 20, FontWeight.w900),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _aboutText("Your ", Colors.grey.shade900, 70, FontWeight.bold),
            _aboutText("Trusted, ", Colors.green, 70, FontWeight.bold),
          ],
        ),
        _aboutText(
            "Housing Partner", Colors.grey.shade900, 70, FontWeight.bold),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _aboutText("Your ", Colors.grey.shade900, 30, FontWeight.bold),
            _aboutText("Home, ", Colors.green, 30, FontWeight.bold),
            _aboutText("Our ", Colors.grey.shade900, 30, FontWeight.bold),
            _aboutText("Mission ", Colors.green, 30, FontWeight.bold),
          ],
        ),
      ],
    );
  }

  Widget _aboutRow2() {
    return Row(
      children: [
        Expanded(
          child: _aboutCard(
            "assets/svg/easyfind.svg",
            0,
            0,
            "Easy Find",
            "Quickly locate your ideal home with our",
            "user-friendly search tools. Effortless navigation",
            "to match you with the perfect property.",
            100,
            100,
          ),
        ),
        Expanded(
          child: _aboutCard(
            "assets/svg/trusted.svg",
            0,
            60,
            "Trusted",
            "Rely on our proven track record for",
            "trustworthy and reliable service. Your satisfaction",
            "and security are our top priorities.",
            100,
            130,
          ),
        ),
        Expanded(
          child: _aboutCard(
            "assets/svg/fastest.svg",
            0,
            0,
            "Fastest",
            "Experience the fastest service in the ",
            "market for all your housing needs. Swift and efficient",
            "processes to get you settled quickly.",
            100,
            130,
          ),
        ),
      ],
    );
  }

  Widget _aboutCard(
    String svgPath,
    double width,
    double height,
    String text,
    String descriptionText,
    String descriptionText2,
    String descriptionText3,
    double svgWidth,
    double svgHeight,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Margin(width: width, height: height),
        SvgPicture.asset(
          height: svgHeight,
          width: svgWidth,
          svgPath,
          allowDrawingOutsideViewBox: true,
        ),
        Margin(width: 0, height: 10),
        _aboutText(
            text, const Color.fromARGB(255, 57, 135, 60), 30, FontWeight.bold),
        Margin(width: 0, height: 10),
        _aboutText(descriptionText, Colors.grey.shade900, 15, FontWeight.bold),
        _aboutText(descriptionText2, Colors.grey.shade900, 15, FontWeight.bold),
        _aboutText(descriptionText3, Colors.grey.shade900, 15, FontWeight.bold),
      ],
    );
  }

  Widget _aboutText(String text, Color color, double size, FontWeight weight) {
    return Text(
      text,
      style: TextStyle(
        decoration: TextDecoration.none,
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}

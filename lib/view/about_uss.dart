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
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200) {
            return _buildWideLayout();
          } else if (constraints.maxWidth > 800 &&
              constraints.maxWidth <= 1200) {
            return _buildMediumLayout();
          } else {
            return _buildMobileLayout();
          }
        },
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(214, 239, 216, 0.6),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(214, 239, 216, 0.6),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Expanded(child: _containerMobile()),
        ],
      ),
    );
  }

  Widget _buildMediumLayout() {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(214, 239, 216, 0.6),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(214, 239, 216, 0.6),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Expanded(child: _containerMedium()),
        ],
      ),
    );
  }

  Widget _buildWideLayout() {
    return Row(
      children: [
        CustomDrawer(),
        Expanded(
          child: _container(),
        )
      ],
    );
  }

  Widget _homePageRow1Medium() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).width * 0.6,
          child: _carouselImageMedium(),
        ),
      ],
    );
  }

  Widget _containerMedium() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(29.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _homePageRow1Medium(),
            _textColumnMedium(),
            Margin(width: 0, height: 50),
            _serviceRowMedium(),
            Margin(width: 0, height: MediaQuery.sizeOf(context).width * 0.04),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            Margin(width: 0, height: MediaQuery.sizeOf(context).width * 0.04),
            _homeRow5Medium()
          ],
        ),
      ),
    );
  }

  Widget _homeRow5Medium() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Text(
            'Experience the serenity and comfort you deserve.\n Meet us at your perfect retreat today. Our team waiting you.',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.sizeOf(context).width * 0.015),
          ),
        ),
        Margin(width: MediaQuery.sizeOf(context).width * 0.07, height: 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.facebook,
                color: Color.fromARGB(255, 1, 115, 209),
                size: MediaQuery.sizeOf(context).width * 0.035,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.instagram,
                color: Colors.redAccent,
                size: MediaQuery.sizeOf(context).width * 0.035,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.twitter,
                color: Colors.blueAccent,
                size: MediaQuery.sizeOf(context).width * 0.035,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _serviceRowMedium() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _serviceCardMedium(
                "assets/svg/easyfind.svg",
                "Easy Find",
                "Quickly locate your ideal home with our",
                "user-friendly search tools. Effortless navigation",
                "to match you with the perfect property.",
              ),
            ),
            Expanded(
              child: _serviceCardMedium(
                "assets/svg/trusted.svg",
                "Trusted",
                "Rely on our proven track record for",
                "trustworthy and reliable service. Your satisfaction",
                "and security are our top priorities.",
              ),
            ),
          ],
        ),
        Margin(width: 0, height: 30),
        _serviceCardMedium(
          "assets/svg/fastest.svg",
          "Fastest",
          "Experience the fastest service in the ",
          "market for all your housing needs. Swift and efficient",
          "processes to get you settled quickly.",
        ),
      ],
    );
  }

  Widget _serviceCardMedium(
    String svgPath,
    String text1,
    String text2,
    String text3,
    String text4,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgPath,
          width: MediaQuery.sizeOf(context).width * 0.15,
          height: MediaQuery.sizeOf(context).width * 0.15,
          allowDrawingOutsideViewBox: true,
        ),
        Margin(width: 0, height: MediaQuery.sizeOf(context).height * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text1,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.026,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade900,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.015,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            Text(
              text3,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.015,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            Text(
              text4,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.015,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _textColumnMedium() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _homeTextMobile(
                "The Best ", 0.025, FontWeight.w900, Colors.grey.shade900),
            _homeTextMobile("Choice ", 0.025, FontWeight.w900, Colors.green),
            _homeTextMobile(
                "For You!", 0.025, FontWeight.w900, Colors.grey.shade900),
          ],
        ),
        Row(
          children: [
            _homeTextMobile(
                "Your ", 0.055, FontWeight.w900, Colors.grey.shade900),
            _homeTextMobile("Trusted,", 0.055, FontWeight.w900, Colors.green)
          ],
        ),
        _homeTextMobile(
            "Housing Partner", 0.055, FontWeight.w900, Colors.grey.shade900),
        Row(
          children: [
            _homeTextMobile(
                "Your ", 0.055, FontWeight.w900, Colors.grey.shade900),
            _homeTextMobile("Home, ", 0.055, FontWeight.w900, Colors.green),
            _homeTextMobile(
                "Ours ", 0.055, FontWeight.w900, Colors.grey.shade900),
            _homeTextMobile("Misson", 0.055, FontWeight.w900, Colors.green)
          ],
        ),
      ],
    );
  }

  Widget _containerMobile() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(29.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _homePageRow1Mobile(),
            _textColumnMobile(),
            Margin(width: 0, height: 40),
            _serviceRowMobile(),
            Margin(width: 0, height: MediaQuery.sizeOf(context).width * 0.04),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            Margin(width: 0, height: MediaQuery.sizeOf(context).width * 0.04),
            _homeRow5Mobile(),
            Margin(width: 0, height: MediaQuery.sizeOf(context).width * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.facebook,
                    color: Color.fromARGB(255, 1, 115, 209),
                    size: MediaQuery.sizeOf(context).width * 0.05,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Colors.redAccent,
                    size: MediaQuery.sizeOf(context).width * 0.05,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.twitter,
                    color: Colors.blueAccent,
                    size: MediaQuery.sizeOf(context).width * 0.05,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _carouselImageMedium() {
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
            enlargeFactor: 0.3,
            onPageChanged: (value, _) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  Widget _container() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Margin(width: 0, height: 30),
          _homePageRow1(),
          Margin(width: 0, height: 30),
          _serviceRow2(),
          Margin(width: 0, height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Color.fromARGB(255, 139, 139, 139),
            ),
          ),
          Margin(width: 0, height: 10),
          _homeRow5()
        ],
      ),
    );
  }

  Widget _homePageRow1() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Margin(width: 80, height: 0),
          Expanded(child: _textColumn()),
          Expanded(child: _carouselImage()),
          Margin(width: 80, height: 0),
        ],
      ),
    );
  }

  Widget _textColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _homeText("The Best ", 0.01, FontWeight.w900, Colors.grey.shade900),
            _homeText("Choice ", 0.01, FontWeight.w900, Colors.green),
            _homeText("For You!", 0.01, FontWeight.w900, Colors.grey.shade900),
          ],
        ),
        Row(
          children: [
            _homeText("Your ", 0.03, FontWeight.w900, Colors.grey.shade900),
            _homeText("Trusted", 0.03, FontWeight.w900, Colors.green)
          ],
        ),
        _homeText(
            "Housing Partner", 0.03, FontWeight.w900, Colors.grey.shade900),
        Row(
          children: [
            _homeText("Your ", 0.02, FontWeight.w900, Colors.grey.shade900),
            _homeText("Home, ", 0.02, FontWeight.w900, Colors.green),
            _homeText("Our ", 0.02, FontWeight.w900, Colors.grey.shade900),
            _homeText("Mission", 0.02, FontWeight.w900, Colors.green)
          ],
        ),
      ],
    );
  }

  Widget _serviceRow2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: _serviceCard(
            "assets/svg/easyfind.svg",
            "Easy Find",
            "Quickly locate your ideal home with our",
            "user-friendly search tools. Effortless navigation",
            "to match you with the perfect property.",
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Margin(width: 0, height: 70),
              _serviceCard(
                "assets/svg/trusted.svg",
                "Trusted",
                "Rely on our proven track record for",
                "trustworthy and reliable service. Your satisfaction",
                "and security are our top priorities.",
              ),
            ],
          ),
        ),
        Expanded(
          child: _serviceCard(
            "assets/svg/fastest.svg",
            "Fastest",
            "Experience the fastest service in the ",
            "market for all your housing needs. Swift and efficient",
            "processes to get you settled quickly.",
          ),
        ),
      ],
    );
  }

  Widget _serviceCard(
    String svgPath,
    String text1,
    String text2,
    String text3,
    String text4,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgPath,
          height: MediaQuery.sizeOf(context).width * 0.07,
          width: MediaQuery.sizeOf(context).width * 0.07,
          allowDrawingOutsideViewBox: true,
        ),
        Margin(width: 0, height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text1,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.016,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 57, 135, 60),
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.0077,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            Text(
              text3,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.0077,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            Text(
              text4,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.0077,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _homeText(String text, double size, FontWeight weight, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontSize: MediaQuery.sizeOf(context).width * size,
        fontWeight: weight,
        color: color,
        decoration: TextDecoration.none,
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
              enlargeFactor: 0.33,
              onPageChanged: (value, _) {
                setState(() {});
              }),
        ),
      ],
    );
  }

  Widget _homeRow5Mobile() {
    return Text(
      'Experience the serenity and comfort you deserve.\n Meet us at your perfect retreat today. Our team waiting you.',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.sizeOf(context).width * 0.022),
    );
  }

  Widget _homePageRow1Mobile() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).width * 0.6,
          child: _carouselImage(),
        ),
      ],
    );
  }

  Widget _textColumnMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _homeTextMobile(
                "The Best ", 0.025, FontWeight.w900, Colors.grey.shade900),
            _homeTextMobile("Choice ", 0.025, FontWeight.w900, Colors.green),
            _homeTextMobile(
                "For You!", 0.025, FontWeight.w900, Colors.grey.shade900),
          ],
        ),
        Row(
          children: [
            _homeTextMobile(
                "Your ", 0.06, FontWeight.w900, Colors.grey.shade900),
            _homeTextMobile("Trusted,", 0.06, FontWeight.w900, Colors.green)
          ],
        ),
        _homeTextMobile(
            "Housing Partner", 0.06, FontWeight.w900, Colors.grey.shade900),
        Row(
          children: [
            _homeTextMobile(
                "Your ", 0.06, FontWeight.w900, Colors.grey.shade900),
            _homeTextMobile("Home, ", 0.06, FontWeight.w900, Colors.green),
            _homeTextMobile(
                "Ours ", 0.06, FontWeight.w900, Colors.grey.shade900),
            _homeTextMobile("Misson", 0.06, FontWeight.w900, Colors.green)
          ],
        ),
      ],
    );
  }

  Widget _serviceCardMobile(
    String svgPath,
    String text1,
    String text2,
    String text3,
    String text4,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgPath,
          height: MediaQuery.sizeOf(context).width * 0.2,
          width: 60.0,
          allowDrawingOutsideViewBox: true,
        ),
        Margin(width: 0, height: MediaQuery.sizeOf(context).height * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text1,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.04,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade900,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.025,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            Text(
              text3,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.025,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            Text(
              text4,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.025,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _serviceRowMobile() {
    return Column(
      children: [
        _serviceCardMobile(
          "assets/svg/easyfind.svg",
          "Easy Find",
          "Quickly locate your ideal home with our",
          "user-friendly search tools. Effortless navigation",
          "to match you with the perfect property.",
        ),
        Margin(width: 0, height: 30),
        _serviceCardMobile(
          "assets/svg/trusted.svg",
          "Trusted",
          "Rely on our proven track record for",
          "trustworthy and reliable service. Your satisfaction",
          "and security are our top priorities.",
        ),
        Margin(width: 0, height: 30),
        _serviceCardMobile(
          "assets/svg/fastest.svg",
          "Fastest",
          "Experience the fastest service in the ",
          "market for all your housing needs. Swift and efficient",
          "processes to get you settled quickly.",
        ),
      ],
    );
  }

  Widget _homeTextMobile(
      String text, double size, FontWeight weight, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontSize: MediaQuery.sizeOf(context).width * size,
        fontWeight: weight,
        color: color,
        decoration: TextDecoration.none,
      ),
    );
  }

  Widget _homeRow5() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
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
              icon: Icon(
                Icons.facebook,
                color: const Color.fromARGB(255, 1, 115, 209),
                size: MediaQuery.sizeOf(context).width * 0.02,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.instagram,
                color: Colors.redAccent,
                size: MediaQuery.sizeOf(context).width * 0.02,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.twitter,
                color: Colors.blueAccent,
                size: MediaQuery.sizeOf(context).width * 0.02,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

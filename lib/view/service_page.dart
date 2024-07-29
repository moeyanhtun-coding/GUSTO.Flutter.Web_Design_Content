import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_responsive/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
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

  Widget _buildWideLayout() {
    return Row(
      children: [
        CustomDrawer(),
        Expanded(child: _container()),
      ],
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
            Margin(width: 0, height: 20),
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

  Widget _container() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Margin(width: 0, height: 90),
          _homePageRow1(),
          Margin(width: 0, height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _homeText("Best", 0.015, FontWeight.normal, Colors.grey.shade900),
              Margin(width: 10, height: 0),
              _homeText("Services", 0.015, FontWeight.w900, Colors.green),
              Margin(width: 10, height: 0),
              _homeText("On", 0.015, FontWeight.w900, Colors.grey.shade900),
              Margin(width: 10, height: 0),
              _homeText(
                  "Home Haven", 0.015, FontWeight.w900, Colors.grey.shade900),
            ],
          ),
          Margin(width: 0, height: 70),
          _serviceRow2(),
          Margin(width: 0, height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Container(
              width: double.infinity,
              height: 1,
              color: const Color.fromARGB(255, 139, 139, 139),
            ),
          ),
          Margin(width: 0, height: 30),
          _homeRow5()
        ],
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
                color: Color.fromARGB(255, 1, 115, 209),
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

  Widget _homePageRow1() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: _carouselImage()),
          Margin(width: 100, height: 0),
          Expanded(child: _textColumn()),
        ],
      ),
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
            _homeTextMobile("Choose The Modern ", 0.06, FontWeight.w900,
                Colors.grey.shade900),
            _homeTextMobile("House", 0.06, FontWeight.w900, Colors.green)
          ],
        ),
        Row(
          children: [
            _homeTextMobile(
                "For ", 0.06, FontWeight.w900, Colors.grey.shade900),
            _homeTextMobile("Better ", 0.06, FontWeight.w900, Colors.green),
            _homeTextMobile(
                "Living ", 0.06, FontWeight.w900, Colors.grey.shade900),
          ],
        ),
        _homeTextMobile(
          "Modern House With Of-The_Moment Design Sense at an affordable Price",
          0.02,
          FontWeight.w900,
          Colors.grey.shade600,
        ),
        Margin(width: 0, height: 20),
        _contactButtonMedium(),
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
            _homeTextMobile("Choose The Modern ", 0.06, FontWeight.w900,
                Colors.grey.shade900),
            _homeTextMobile("House", 0.06, FontWeight.w900, Colors.green)
          ],
        ),
        Row(
          children: [
            _homeTextMobile(
                "For ", 0.06, FontWeight.w900, Colors.grey.shade900),
            _homeTextMobile("Better ", 0.06, FontWeight.w900, Colors.green),
            _homeTextMobile(
                "Living ", 0.06, FontWeight.w900, Colors.grey.shade900),
          ],
        ),
        _homeTextMobile(
          "Modern House With Of-The_Moment Design Sense at an affordable Price",
          0.02,
          FontWeight.w900,
          Colors.grey.shade600,
        ),
        Margin(width: 0, height: 20),
        _contactButtonMobile(),
      ],
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
        _homeText("Choose The", 0.03, FontWeight.w900, Colors.grey.shade900),
        Row(
          children: [
            _homeText("Modern ", 0.03, FontWeight.w900, Colors.grey.shade900),
            _homeText("House", 0.03, FontWeight.w900, Colors.green)
          ],
        ),
        _homeText(
            "For Better Living", 0.03, FontWeight.w900, Colors.grey.shade900),
        _homeText(
          "Modern House With Of-The_Moment Design Sense at an affordable Price",
          0.0079,
          FontWeight.w900,
          Colors.grey.shade600,
        ),
        Margin(width: 0, height: 20),
        _contactButton(),
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
                "assets/svg/conversation.svg",
                "Free Consulting",
                "Get expert advice for all your housing \nneeds with our free consulting service.",
              ),
            ),
            Expanded(
              child: _serviceCardMedium(
                "assets/svg/contract.svg",
                "Contract Service",
                "Ensure smooth transactions with our \nprofessional contract services.",
              ),
            ),
          ],
        ),
        Margin(width: 0, height: 30),
        _serviceCardMedium(
          "assets/svg/transportation.svg",
          "Transportation Service",
          "Make your move hassle-free with \nour reliable transportation services.",
        ),
      ],
    );
  }

  Widget _serviceRowMobile() {
    return Column(
      children: [
        _serviceCardMobile(
          "assets/svg/conversation.svg",
          "Free Consulting",
          "Get expert advice for all your housing",
          "needs with our free consulting service.",
        ),
        Margin(width: 0, height: 30),
        _serviceCardMobile(
          "assets/svg/contract.svg",
          "Contract Service",
          "Ensure smooth transactions with our",
          "professional contract services.",
        ),
        Margin(width: 0, height: 30),
        _serviceCardMobile(
          "assets/svg/transportation.svg",
          "Transportation Service",
          "Make your move hassle-free with",
          "our reliable transportation services.",
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
            "assets/svg/conversation.svg",
            "Free Consulting",
            "Get expert advice for all your housing \nneeds with our free consulting service.",
          ),
        ),
        Expanded(
          child: _serviceCard(
            "assets/svg/contract.svg",
            "Contract Service",
            "Ensure smooth transactions with our \nprofessional contract services.",
          ),
        ),
        Expanded(
          child: _serviceCard(
            "assets/svg/transportation.svg",
            "Transportation Service",
            "Make your move hassle-free with \nour reliable transportation services.",
          ),
        ),
      ],
    );
  }

  Widget _serviceCardMedium(String svgPath, String text1, String text2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgPath,
          width: MediaQuery.sizeOf(context).width * 0.15,
          height: MediaQuery.sizeOf(context).width * 0.15,
          allowDrawingOutsideViewBox: true,
        ),
        Margin(width: 0, height: MediaQuery.sizeOf(context).height * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
          ],
        )
      ],
    );
  }

  Widget _serviceCardMobile(
    String svgPath,
    String text1,
    String text2,
    String text3,
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
          ],
        )
      ],
    );
  }

  Widget _serviceCard(String svgPath, String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgPath,
          height: MediaQuery.sizeOf(context).width * 0.04,
          width: MediaQuery.sizeOf(context).width * 0.04,
          allowDrawingOutsideViewBox: true,
        ),
        Margin(width: 20, height: 0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.0119,
                fontWeight: FontWeight.w900,
                color: Colors.grey.shade900,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.007,
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
            enlargeFactor: 0.3,
            onPageChanged: (value, _) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  Widget _contactButtonMedium() {
    double size = MediaQuery.sizeOf(context).width * 0.03;
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.all(size)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(20), // Adjust the radius as needed
            ),
          ),
          backgroundColor: WidgetStateProperty.all(Colors.green),
          shadowColor: WidgetStateProperty.all<Color>(
              Colors.grey.withOpacity(0.5)), // Shadow color
          elevation: WidgetStateProperty.all<double>(
              10), // Elevation to create the shadow effect
          overlayColor: const WidgetStatePropertyAll(
            Color.fromRGBO(70, 108, 70, 0.573),
          ),
        ),
        onPressed: () {
          Get.toNamed("/contactUs");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.phone,
              color: Colors.white,
              size: MediaQuery.sizeOf(context).width * 0.03,
            ),
            Margin(
              width: 8,
              height: 0,
            ),
            Text(
              "Call Now",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: MediaQuery.sizeOf(context).width * 0.02,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _contactButtonMobile() {
    double size = MediaQuery.sizeOf(context).width * 0.04;
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.all(size)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20), // Adjust the radius as needed
          ),
        ),
        backgroundColor: WidgetStateProperty.all(Colors.green),
        shadowColor: WidgetStateProperty.all<Color>(
            Colors.grey.withOpacity(0.5)), // Shadow color
        elevation: WidgetStateProperty.all<double>(
            10), // Elevation to create the shadow effect
        overlayColor: const WidgetStatePropertyAll(
          Color.fromRGBO(70, 108, 70, 0.573),
        ),
      ),
      onPressed: () {
        Get.toNamed("/contactUs");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.phone,
            color: Colors.white,
            size: MediaQuery.sizeOf(context).width * 0.04,
          ),
          Margin(
            width: 8,
            height: 0,
          ),
          Text(
            "Call Now",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: MediaQuery.sizeOf(context).width * 0.03,
            ),
          )
        ],
      ),
    );
  }

  Widget _contactButton() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).height * 0.4,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(EdgeInsets.all(30)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(20), // Adjust the radius as needed
            ),
          ),
          backgroundColor: WidgetStateProperty.all(Colors.green),
          shadowColor: WidgetStateProperty.all<Color>(
              Colors.grey.withOpacity(0.5)), // Shadow color
          elevation: WidgetStateProperty.all<double>(
              10), // Elevation to create the shadow effect
          overlayColor: const WidgetStatePropertyAll(
            Color.fromRGBO(70, 108, 70, 0.573),
          ),
        ),
        onPressed: () {
          Get.toNamed("/contactUs");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.phone,
              color: Colors.white,
            ),
            Margin(
              width: 8,
              height: 0,
            ),
            const Text(
              "Call Now",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}

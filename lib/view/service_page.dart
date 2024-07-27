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
        body: _buildUI());
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Margin(width: 0, height: 90),
        _homePageRow1(),
        Margin(width: 0, height: 70),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeText("Best", 25, FontWeight.normal, Colors.grey.shade900),
            Margin(width: 10, height: 0),
            _homeText("Services", 25, FontWeight.w900, Colors.green),
            Margin(width: 10, height: 0),
            _homeText("On", 25, FontWeight.w900, Colors.grey.shade900),
            Margin(width: 10, height: 0),
            _homeText(
                "House Heaven", 25, FontWeight.w900, Colors.grey.shade900),
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
            color: Color.fromARGB(255, 139, 139, 139),
          ),
        ),
        Margin(width: 0, height: 30),
        _homeRow5()
      ],
    );
  }

  Widget _homeRow5() {
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: _carouselImage()),
          Margin(width: 100, height: 0),
          Expanded(child: _textColumn()),
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
            _homeText("The Best ", 20, FontWeight.w900, Colors.grey.shade900),
            _homeText("Choice ", 20, FontWeight.w900, Colors.green),
            _homeText("For You!", 20, FontWeight.w900, Colors.grey.shade900),
          ],
        ),
        _homeText("Choose The", 70, FontWeight.w900, Colors.grey.shade900),
        Row(
          children: [
            _homeText("Modern", 70, FontWeight.w900, Colors.grey.shade900),
            Margin(width: 15, height: 0),
            _homeText("House", 70, FontWeight.w900, Colors.green)
          ],
        ),
        _homeText(
            "For Better Living", 70, FontWeight.w900, Colors.grey.shade900),
        _homeText(
          "Modern House With Of-The_Moment Design Sense at an affordable Price",
          13,
          FontWeight.w900,
          Colors.grey.shade600,
        ),
        Margin(width: 0, height: 20),
        _contactButton(),
      ],
    );
  }

  Widget _serviceRow2() {
    return Row(
      children: [
        Margin(width: 90, height: 0),
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
        Margin(width: 90, height: 0),
      ],
    );
  }

  Widget _serviceCard(String svgPath, String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgPath,
          height: 60.0,
          width: 60.0,
          allowDrawingOutsideViewBox: true,
        ),
        Margin(width: 20, height: 0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.grey.shade900,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: 15,
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
        fontSize: size,
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
            enlargeFactor: 0.5,
            onPageChanged: (value, _) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  Widget _contactButton() {
    return SizedBox(
      width: 200,
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

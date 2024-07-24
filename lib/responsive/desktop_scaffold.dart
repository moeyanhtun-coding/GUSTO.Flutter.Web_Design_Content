import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_responsive/constants.dart';
import 'package:rate_in_stars/rate_in_stars.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  double rating = 4.7;
  bool isDetail = false;
  bool isOverview = false;
  bool isReview = false;

  @override
  void initState() {
    isDetail = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackground,
      body: Row(
        children: [
          myDrawer,
          Expanded(
            child: _containerBox(),
          ),
          _map(),
        ],
      ),
    );
  }

  Widget _containerBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(scrollbars: false),
          child: ListView(
            children: [
              Column(
                children: [
                  _profileSection(),
                  _margin(0, 20),
                  _locationAndPrice(),
                  Container(
                    width: double.infinity,
                    height: 500,
                    color: Colors.blueAccent,
                  ),
                  _margin(0, 10),
                  _listDetail(),
                  _margin(0, 10),
                  if (isDetail) _detail(),
                  if (isOverview) _overView(),
                  if (isReview) _review(),
                  _margin(0, 10),
                  _ratingAndReview(15),
                  _margin(0, 20),
                  _contactAndShowMore()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _routeName("Home", "Detail"),
        _profile("Moe yan"),
      ],
    );
  }

  Widget _routeName(String firstName, String secondName) {
    return RoutePath(
      firstName: firstName,
      secondName: secondName,
    );
  }

  Widget _profile(String name) {
    return Profile(name: name);
  }

  Widget _locationAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _location(),
        _priceAndDuration(),
      ],
    );
  }

  Widget _priceAndDuration() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '\$ 10,500',
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Text(
          'Per Month',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _location() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Luxury house for rent",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
        _locationDetail()
      ],
    );
  }

  Widget _listDetail() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                isDetail = true;
                isOverview = false;
                isReview = false;
              });
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  // Conditional background color based on state
                  if (isDetail) {
                    return const Color.fromARGB(255, 0, 140, 255)
                        .withOpacity(0.2); // Color when overview is true
                  } else {
                    return Colors.transparent; // Default color
                  }
                },
              ),
              overlayColor: WidgetStateProperty.all(
                const Color.fromARGB(255, 0, 140, 255).withOpacity(0.2),
              ), // Change this color as needed
            ),
            child: const Text(
              "Detail",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _margin(10, 0),
          TextButton(
            onPressed: () {
              setState(
                () {
                  isDetail = false;
                  isOverview = true;
                  isReview = false;
                },
              );
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  // Conditional background color based on state
                  if (isOverview) {
                    return const Color.fromARGB(255, 0, 140, 255)
                        .withOpacity(0.2); // Color when overview is true
                  } else {
                    return Colors.transparent; // Default color
                  }
                },
              ),
              overlayColor: WidgetStateProperty.all(
                const Color.fromARGB(255, 0, 140, 255).withOpacity(0.2),
              ), // Change this color as needed
            ),
            child: const Text(
              "Overview",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _margin(10, 0),
          TextButton(
            onPressed: () {
              setState(
                () {
                  isDetail = false;
                  isOverview = false;
                  isReview = true;
                },
              );
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  // Conditional background color based on state
                  if (isReview) {
                    return const Color.fromARGB(255, 0, 140, 255)
                        .withOpacity(0.2); // Color when overview is true
                  } else {
                    return Colors.transparent; // Default color
                  }
                },
              ),
              overlayColor: WidgetStateProperty.all(
                const Color.fromARGB(255, 0, 140, 255).withOpacity(0.2),
              ), // Change this color as needed
            ),
            child: const Text(
              "Review",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _locationDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.add_location,
          size: 15,
          color: Colors.grey,
        ),
        _margin(5, 0),
        const Text(
          "Shwedagon Pagoda Road, Dagon Township, Yangon, Myanmar",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        )
      ],
    );
  }

  Widget _detail() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.1,
      child: ListView(
        children: [
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean varius sagittis dui et congue. Donec laoreet leo quis tortor pulvinar molestie. Pellentesque lobortis eros ut augue cursus mollis. Quisque odio est, cursus nec lobortis sed, pretium a massa. Maecenas placerat, urna et dignissim dapibus, felis ante scelerisque lorem, vestibulum vehicula dui ante a metus. In id augue ullamcorper turpis sodales accumsan sed in mauris. Nunc hendrerit, quam ultricies varius efficitur, quam enim mattis erat, scelerisque mollis risus ipsum vel risus. Vestibulum in neque blandit, consectetur felis ut, posuere felis.",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _overView() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.1,
      child: ListView(
        children: [
          const Text(
            "Aenean eu magna id quam tincidunt lacinia eget ac diam. Donec luctus massa non tortor fermentum, id commodo tellus consectetur. Nunc rhoncus, nibh et viverra ullamcorper, metus nulla porta mi, rutrum ullamcorper nisi magna fringilla libero. Pellentesque ultricies, eros ut faucibus tempor, quam felis bibendum felis, et tempor nulla tortor sit amet est. Morbi in dictum purus, a viverra sem. Proin eget venenatis tortor. Morbi ut nibh nulla. Suspendisse rutrum ex semper semper condimentum. Pellentesque non ex at dui consequat viverra in at nisi. Fusce commodo porttitor nulla, a mattis mauris egestas non. In pharetra viverra dolor, eu lobortis eros tempor vel.",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _review() {
    return Container(
      color: Colors.blueAccent,
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: ListView(
        children: [],
      ),
    );
  }

  Widget _ratingAndReview(int review) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _rating(),
        _margin(10, 0),
        Text(
          review.toString(),
          style: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        _margin(7, 0),
        const Text(
          "Reviews",
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
    );
  }

  Widget _contactAndShowMore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _contactButton(),
        _showMore(),
      ],
    );
  }

  Widget _showMore() {
    return TextButton(
        onPressed: () {},
        child: const Row(
          children: [
            Icon(
              Icons.arrow_drop_down,
              size: 30,
              color: Colors.blueAccent,
            ),
            Text(
              "Show More",
              style: TextStyle(
                  color: Colors.blueAccent, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }

  Widget _contactButton() {
    return ElevatedButton(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(EdgeInsets.all(30)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20), // Adjust the radius as needed
          ),
        ),
        backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
        shadowColor: const WidgetStatePropertyAll(Color(0x00000000)),
        overlayColor: const WidgetStatePropertyAll(
          Color.fromARGB(58, 0, 140, 255),
        ),
      ),
      onPressed: () {
        // some method calls
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.phone,
            color: Colors.white,
          ),
          _margin(8, 0),
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
    );
  }

  Widget _rating() {
    return RatingStars(
      editable: false,
      rating: rating,
      color: const Color.fromARGB(255, 242, 218, 0),
      iconSize: 25,
    );
  }

  Widget _map() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.3,
      height: double.infinity,
    );
  }

  Widget _margin(double width, double height) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}

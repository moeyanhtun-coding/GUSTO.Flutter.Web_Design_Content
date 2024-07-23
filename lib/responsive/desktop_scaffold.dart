import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_responsive/constants.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  bool isDetail = false;
  bool isOverview = false;

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
                if (isOverview) _overView()
              ],
            ),
          ],
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
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                isDetail = true;
                isOverview = false;
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
              setState(() {
                isDetail = false;
                isOverview = true;
              });
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
        ],
      ),
    );
  }

  Widget _textButton(String name, Function() click) {
    return TextButton(
      onPressed: click,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          const Color.fromARGB(255, 0, 140, 255).withOpacity(0.2),
        ),
        overlayColor: WidgetStateProperty.all(
          const Color.fromARGB(255, 0, 140, 255).withOpacity(0.2),
        ), // Change this color as needed
      ),
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.blueAccent,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
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
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.1,
      color: Color.fromARGB(255, 255, 109, 109),
      child: Text("Detail"),
    );
  }

  Widget _overView() {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.1,
      color: const Color.fromARGB(255, 92, 201, 255),
      child: Text("OverView"),
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

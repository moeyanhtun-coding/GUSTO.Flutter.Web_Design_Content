import 'package:flutter/material.dart';
import 'package:flutter_web_responsive/constants.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return _buildUI();
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
        ],
      ),
    );
  }

  Widget _textColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [],
    );
  }

  Widget _homeText(String text, double size, FontWeight weight) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: Colors.white,
          decoration: TextDecoration.none),
    );
  }
}

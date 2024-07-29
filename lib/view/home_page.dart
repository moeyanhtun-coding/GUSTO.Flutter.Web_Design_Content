import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_responsive/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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

final List<String> priceList = [
  '300,000 MMK/month',
  '350,000 MMK/month',
  '400,000 MMK/month',
  '450,000 MMK/month',
  '500,000 MMK/month',
  '550,000 MMK/month',
  '600,000 MMK/month',
  '650,000 MMK/month',
  '700,000 MMK/month',
  '750,000 MMK/month',
  '800,000 MMK/month',
  '850,000 MMK/month',
  '900,000 MMK/month',
  '950,000 MMK/month',
  '1,000,000 MMK/month',
  '1,100,000 MMK/month',
  '1,200,000 MMK/month',
  '1,300,000 MMK/month',
  '1,400,000 MMK/month',
  '1,500,000 MMK/month'
];

final List<String> typeList = [
  'Apartment',
  'Condominium',
  'Detached House',
  'Townhouse',
  'Studio',
  'Penthouse',
  'Bungalow',
  'Cottage',
  'Villa',
  'Mansion',
  'Apartment',
  'Condominium',
  'Detached House',
  'Townhouse',
  'Studio',
  'Penthouse',
  'Bungalow',
  'Cottage',
  'Villa',
  'Mansion'
];

final List<String> locationList = [
  'Yangon, Kamayut Township',
  'Yangon, Dagon Township',
  'Yangon, Bahan Township',
  'Yangon, Hlaing Township',
  'Yangon, Mayangone Township',
  'Yangon, Tamwe Township',
  'Mandalay, Chanayethazan Township',
  'Mandalay, Chanmyathazi Township',
  'Mandalay, Mahaaungmye Township',
  'Mandalay, Pyigyidagun Township',
  'Naypyidaw, Zabuthiri Township',
  'Naypyidaw, Ottarathiri Township',
  'Naypyidaw, Dekkhinathiri Township',
  'Naypyidaw, Pobbathiri Township',
  'Bago, Bago Township',
  'Pathein, Pathein Township',
  'Taunggyi, Taunggyi Township',
  'Mawlamyine, Mawlamyine Township',
  'Sittwe, Sittwe Township',
  'Myitkyina, Myitkyina Township'
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Row(
      children: [
        CustomDrawer(),
        Expanded(child: _container()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Row(
      children: [
        CustomDrawer(),
        Expanded(child: _container()),
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

  Widget _container() {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Margin(width: 0, height: 90),
            _homePageRow1(),
            Margin(width: 0, height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _homeText("For", 25, FontWeight.normal, Colors.grey.shade900),
                Margin(width: 10, height: 0),
                _homeText("Rent", 25, FontWeight.w900, Colors.grey.shade900),
                Margin(width: 10, height: 0),
                _homeText("Feature", 25, FontWeight.w900, Colors.green),
                Margin(width: 10, height: 0),
                _homeText(
                    "Properties", 25, FontWeight.w900, Colors.grey.shade900),
              ],
            ),
            Margin(width: 0, height: 30),
            _homeRow3(),
            _homeRow4(),
            _homeRow5()
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
          Expanded(child: _textColumn()),
          Expanded(child: _carouselImage()),
          Margin(width: 130, height: 0),
        ],
      ),
    );
  }

  Widget _homeRow3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 400,
          child: CardItem(
            cardImage: imgList[6],
            itemPrice: priceList[3],
            itemLocation: locationList[9],
            itemType: typeList[5],
          ),
        ),
        SizedBox(
          width: 400,
          child: CardItem(
            cardImage: imgList[4],
            itemPrice: priceList[9],
            itemLocation: locationList[2],
            itemType: typeList[6],
          ),
        ),
        SizedBox(
          width: 400,
          child: CardItem(
            cardImage: imgList[2],
            itemPrice: priceList[7],
            itemLocation: locationList[2],
            itemType: typeList[3],
          ),
        ),
      ],
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
        Row(
          children: [
            _homeText("Find The ", 70, FontWeight.w900, Colors.grey.shade900),
            _homeText("Home", 70, FontWeight.w900, Colors.green)
          ],
        ),
        _homeText(
            "To Your Perfect ", 70, FontWeight.w900, Colors.grey.shade900),
        _homeText("Retreat", 70, FontWeight.w900, Colors.green)
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
              }),
        ),
      ],
    );
  }

  Widget _homeRow4() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _homeText("One of the customers", 20, FontWeight.bold,
                  Colors.grey.shade900),
              Margin(width: 10, height: 0),
              _homeText("Review", 20, FontWeight.w900, Colors.green)
            ],
          ),
          const SizedBox(height: 16, width: 300),
          _comment(
              "https://images.pexels.com/photos/428364/pexels-photo-428364.jpeg?auto=compress&cs=tinysrgb&w=600"),
        ],
      ),
    );
  }
}

Widget _comment(String image) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 8),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 3, // Spread radius
            blurRadius: 7, // Blur radius
            offset: const Offset(0, 3), // Offset in x and y direction
          ),
        ],
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius:
            BorderRadius.circular(16.0), // Adjust the radius as needed
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(image),
              radius: 20,
            ),
            Margin(width: 10, height: 0),
            _nameAndCmd(
                "Htet Paing", "What a good website. It's very helpful for me."),
          ],
        ),
      ),
    ),
  );
}

Widget _nameAndCmd(String name, String cmd) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        name,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        cmd,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
      )
    ],
  );
}

class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.grey[400],
            child: const Center(
              child: Text('Photo'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '21 Lakhs\nThis Vista condo for rent\n33/A, Thamardi Road\n(4), Sa/Ka Bls.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CardItem extends StatefulWidget {
  String cardImage;
  String itemPrice;
  String itemType;
  String itemLocation;

  CardItem({
    super.key,
    required this.cardImage,
    required this.itemPrice,
    required this.itemLocation,
    required this.itemType,
  });

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: () {
          Get.toNamed("/detail");
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: double.infinity,
            height: 310,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.cardImage,
                        height: MediaQuery.sizeOf(context).height * 0.19,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        color: Colors.orange,
                        child: const Text(
                          "Avaliable",
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  widget.itemPrice,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(26, 83, 25, 1),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.itemType,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Buy / Rent",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(26, 83, 25, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.itemLocation,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 80, 78, 78),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

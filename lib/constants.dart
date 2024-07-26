import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/flutter_map.dart' as flutterMap;
import 'package:latlong2/latlong.dart' as latLng;

var myDefaultBackground = const Color.fromARGB(255, 255, 255, 255);

var myAppBar = AppBar(
  backgroundColor: Colors.grey[900],
  iconTheme: const IconThemeData(color: Colors.white),
);

var myDrawer = Drawer(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _drawerHeader(),
      _listGroup(),
      _logoutd(),
    ],
  ),
);

Widget _listGroup() {
  return Builder(
    builder: (context) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: ListView(
            children: [
              _listItem(0, "H O M E", Icons.home, () {
                Get.toNamed("/home");
              }),
              _margin(0, 0.005, context),
              _listItem(1, "F A V O R I T E", Icons.favorite, () {
                Get.toNamed("/favorite");
              }),
              _margin(0, 0.005, context),
              _listItem(2, "S E R V I C E S", Icons.person, () {
                Get.toNamed("/service");
              }),
              _margin(0, 0.005, context),
              _listItem(3, "S E A R C H", Icons.search, () {
                Get.toNamed("/category");
              }),
              _margin(0, 0.005, context),
              _listItem(4, "C O N T A C T S  U S", Icons.contact_mail, () {
                Get.toNamed("/contactUs");
              }),
              _margin(0, 0.005, context),
              _listItem(6, "A B O U T   U S", Icons.announcement_rounded, () {
                Get.toNamed("/aboutUs");
              }),
              _margin(0, 0.005, context),
              _listItem(7, "B U Y", Icons.production_quantity_limits_rounded,
                  () {
                Get.toNamed("/category");
              }),
              _margin(0, 0.005, context),
              _listItem(8, "R E N T", Icons.house, () {
                Get.toNamed("/category");
              }),
            ],
          ),
        ),
      );
    },
  );
}

Widget _drawerHeader() {
  return const DrawerHeader(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.house),
        SizedBox(
          width: 20,
        ),
        Text("House Heaven"),
      ],
    ),
  );
}

class Profile extends StatelessWidget {
  final String name;

  const Profile({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.jpg"),
          radius: 25,
        ),
      ],
    );
  }
}

class RoutePath extends StatelessWidget {
  final String firstName;
  final String secondName;

  const RoutePath({
    super.key,
    required this.firstName,
    required this.secondName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          firstName,
          style: const TextStyle(color: Colors.grey),
        ),
        const Text(" / "),
        Text(
          secondName,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}

class _ListItem extends StatefulWidget {
  final int index;
  final String title;
  final IconData icon;
  final Function() tap;

  const _ListItem({
    required this.index,
    required this.icon,
    required this.title,
    required this.tap,
  });

  @override
  State<_ListItem> createState() => __ListItemState();
}

class __ListItemState extends State<_ListItem> {
  final Map<int, bool> _hovering = {};

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hovering[widget.index] = true;
        });
      },
      onExit: (_) {
        setState(() {
          _hovering[widget.index] = false;
        });
      },
      child: ListTile(
        leading: Icon(
          widget.icon,
          color: _hovering[widget.index] == true
              ? Color.fromRGBO(26, 83, 25, 0.839)
              : Colors.black,
          size: 20,
        ),
        title: Text(widget.title,
            style: TextStyle(
                color: _hovering[widget.index] == true
                    ? Color.fromRGBO(26, 83, 25, 0.839)
                    : Colors.black,
                fontSize: 15)),
        onTap: widget.tap,
      ),
    );
  }
}

Widget _listItem(int index, String title, IconData icon, Function() tap) {
  return _ListItem(
    index: index,
    icon: icon,
    title: title,
    tap: tap,
  );
}

Widget _logoutd() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    child: _listItem(
      5,
      "L O G O U T",
      Icons.logout,
      () {
        Get.offAllNamed("/login");
      },
    ),
  );
}

Widget _margin(
  double width,
  double height,
  BuildContext context,
) {
  return SizedBox(
    width: MediaQuery.of(context).size.height * width,
    height: MediaQuery.of(context).size.height * height,
  );
}

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
            height: 360,
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
                    IconButton(
                      hoverColor: Colors.redAccent[50],
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 30,
                        color:
                            ModalRoute.of(context)?.settings.name == '/favorite'
                                ? Colors.red
                                : (isFavorite
                                    ? Colors.redAccent
                                    : Colors.grey[300]),
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

class CommonMapWidget extends StatelessWidget {
  final double widthFactor;
  final latLng.LatLng initialCenter;
  final double initialZoom;
  final List<latLng.LatLng> markerPoints;

  const CommonMapWidget({
    Key? key,
    required this.widthFactor,
    required this.initialCenter,
    required this.initialZoom,
    required this.markerPoints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * widthFactor,
        height: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: flutterMap.FlutterMap(
            options: flutterMap.MapOptions(
              initialCenter: initialCenter,
              initialZoom: initialZoom,
            ),
            children: [
              flutterMap.TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              flutterMap.MarkerLayer(
                markers: markerPoints.map((point) {
                  return flutterMap.Marker(
                    point: point,
                    width: 60,
                    height: 60,
                    child: const Icon(
                      Icons.location_pin,
                      size: 60,
                      color: Colors.redAccent,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Margin extends StatelessWidget {
  double width;
  double height;

  Margin({
    required this.width,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String formName;
  final IconData icon;

  const CustomInputField({
    Key? key,
    required this.formName,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: formName,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * 0.008,
          ),
          borderSide: BorderSide.none,
        ),
        fillColor: const Color(0x926AA96B),
        filled: true,
        prefixIcon: Icon(icon),
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      ),
    );
  }
}

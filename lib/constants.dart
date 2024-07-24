import 'package:flutter/material.dart';
import 'package:get/get.dart';

var myDefaultBackground = Color.fromARGB(255, 255, 255, 255);

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
              _listItem(0, "H O M E", Icons.home, () {}),
              _margin(0, 0.005, context),
              _listItem(1, "F A V O R I T E", Icons.favorite, () {}),
              _margin(0, 0.005, context),
              _listItem(2, "S E R V I C E S", Icons.person, () {}),
              _margin(0, 0.005, context),
              _listItem(3, "R E N T", Icons.search, () {}),
              _margin(0, 0.005, context),
              _listItem(4, "C O N T A C T S", Icons.contact_mail, () {}),
              _margin(0, 0.005, context),
              _listItem(6, "S E T T I N G", Icons.settings, () {}),
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
        Text("Perfect House"),
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
          color: _hovering[widget.index] == true ? Colors.blue : Colors.black,
          size: 20,
        ),
        title: Text(widget.title,
            style: TextStyle(
                color: _hovering[widget.index] == true
                    ? Colors.blue
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

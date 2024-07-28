import 'package:flutter/material.dart';
import 'package:flutter_web_responsive/constants.dart';

// ignore: library_prefixes
import 'package:latlong2/latlong.dart' as latLng;

const List<latLng.LatLng> locations = [
  latLng.LatLng(16.8248, 96.1302), // Yangon, Kamayut Township
  latLng.LatLng(16.7983, 96.1546), // Yangon, Dagon Township
  latLng.LatLng(16.8065, 96.1587), // Yangon, Bahan Township
  latLng.LatLng(16.8331, 96.1276), // Yangon, Hlaing Township
  latLng.LatLng(16.8587, 96.1241), // Yangon, Mayangone Township
  latLng.LatLng(16.8153, 96.1698), // Yangon, Tamwe Township
  latLng.LatLng(21.9787, 96.0836), // Mandalay, Chanayethazan Township
  latLng.LatLng(21.9347, 96.0802), // Mandalay, Chanmyathazi Township
  latLng.LatLng(21.9619, 96.0975), // Mandalay, Mahaaungmye Township
  latLng.LatLng(21.9002,
      96.1185) // Mandalay, Pyigyidagun Township// Myitkyina, Myitkyina Township
];

final List<String> imgList1 = [
  "https://images.pexels.com/photos/209315/pexels-photo-209315.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/221024/pexels-photo-221024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/1396132/pexels-photo-1396132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/2079234/pexels-photo-2079234.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/323775/pexels-photo-323775.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/323772/pexels-photo-323772.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/53610/large-home-residential-house-architecture-53610.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/4276613/pexels-photo-4276613.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
  "https://images.pexels.com/photos/5524336/pexels-photo-5524336.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/5502227/pexels-photo-5502227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  'https://images.pexels.com/photos/262405/pexels-photo-262405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
];

final List<String> imgList2 = [];

final List<String> imgList3 = [];

final List<String> priceList = [
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

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(214, 239, 216, 1),
      body: Row(
        children: [
          CustomDrawer(),
          Expanded(child: _itemGroup()),
          const CommonMapWidget(
            widthFactor: 0.3,
            initialCenter: latLng.LatLng(16.84597948042343, 96.16165741985243),
            initialZoom: 13,
            markerPoints: locations,
          ),
        ],
      ),
    );
  }

  Widget _itemGroup() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Margin(width: 0, height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: _profileSection(),
          ),
          Margin(width: 0, height: 20),
          Expanded(child: _grideViewItem()),
        ],
      ),
    );
  }

  Widget _profileSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _routeName("Home", "Favorite"),
        _profile("Moe Yan Htun"),
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

  Widget _grideViewItem() {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(scrollbars: false),
      child: GridView.builder(
        itemCount: locations.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return CardItem(
            cardImage: imgList1[index],
            itemPrice: priceList[index],
            itemLocation: locationList[index],
            itemType: typeList[index],
          );
        },
      ),
    );
  }
}

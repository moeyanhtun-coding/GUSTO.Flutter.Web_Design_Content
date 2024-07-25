import 'package:flutter/material.dart';
import 'package:flutter_web_responsive/constants.dart';
import 'package:flutter_map/flutter_map.dart' as flutterMap;
import 'package:latlong2/latlong.dart' as latLng;

final List<latLng.LatLng> locations = [
  latLng.LatLng(16.8248, 96.1302), // Yangon, Kamayut Township
  latLng.LatLng(16.7983, 96.1546), // Yangon, Dagon Township
  latLng.LatLng(16.8065, 96.1587), // Yangon, Bahan Township
  latLng.LatLng(16.8331, 96.1276), // Yangon, Hlaing Township
  latLng.LatLng(16.8587, 96.1241), // Yangon, Mayangone Township
  latLng.LatLng(16.8153, 96.1698), // Yangon, Tamwe Township
  latLng.LatLng(21.9787, 96.0836), // Mandalay, Chanayethazan Township
  latLng.LatLng(21.9347, 96.0802), // Mandalay, Chanmyathazi Township
  latLng.LatLng(21.9619, 96.0975), // Mandalay, Mahaaungmye Township
  latLng.LatLng(21.9002, 96.1185), // Mandalay, Pyigyidagun Township
  latLng.LatLng(19.7535, 96.1088), // Naypyidaw, Zabuthiri Township
  latLng.LatLng(19.7672, 96.1201), // Naypyidaw, Ottarathiri Township
  latLng.LatLng(19.7328, 96.1212), // Naypyidaw, Dekkhinathiri Township
  latLng.LatLng(19.7163, 96.0945), // Naypyidaw, Pobbathiri Township
  latLng.LatLng(17.3377, 96.4797), // Bago, Bago Township
  latLng.LatLng(16.7798, 94.7384), // Pathein, Pathein Township
  latLng.LatLng(20.7908, 97.0383), // Taunggyi, Taunggyi Township
  latLng.LatLng(16.4917, 97.6281), // Mawlamyine, Mawlamyine Township
  latLng.LatLng(20.1323, 92.8987), // Sittwe, Sittwe Township
  latLng.LatLng(25.3864, 97.3958), // Myitkyina, Myitkyina Township
];

final List<String> imgList1 = [
  "https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/10628388/pexels-photo-10628388.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/5447712/pexels-photo-5447712.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/164558/pexels-photo-164558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/1105754/pexels-photo-1105754.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/4030036/pexels-photo-4030036.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/9459187/pexels-photo-9459187.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/4070968/pexels-photo-4070968.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
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

class CategoryPage extends StatefulWidget {
  CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      backgroundColor: myDefaultBackground,
      body: Row(
        children: [
          myDrawer,
          Expanded(child: _itemGroup()),
          CommonMapWidget(
              widthFactor: 0.3,
              initialCenter:
                  latLng.LatLng(21.58150733972306, 96.11868142430097),
              initialZoom: 6,
              markerPoints: locations),
        ],
      ),
    );
  }

  Widget _itemGroup() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: _grideViewItem(),
    );
  }

  Widget _grideViewItem() {
    return GridView.builder(
      itemCount: locationList.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return CardItem(
          cardImage: imgList1[index],
          itemPrice: priceList[index],
          itemLocation: locationList[index],
          itemType: typeList[index],
        );
      },
    );
  }
}

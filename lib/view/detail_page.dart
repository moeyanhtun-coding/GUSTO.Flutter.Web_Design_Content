import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_web_responsive/constants.dart';
import 'package:get/get.dart';
import 'package:rate_in_stars/rate_in_stars.dart';

// ignore: library_prefixes
import 'package:latlong2/latlong.dart' as latLng;
// ignore: library_prefixes
import 'package:flutter_map/flutter_map.dart' as flutterMap;
import 'package:carousel_slider/carousel_slider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final List<String> imgList = [
    "https://images.pexels.com/photos/1115804/pexels-photo-1115804.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/37347/office-sitting-room-executive-sitting.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/262048/pexels-photo-262048.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/2631746/pexels-photo-2631746.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
  ];

  int _currentPage = 0;

  double rating = 4.7;
  bool isDetail = false;
  bool isOverview = false;
  bool isReview = false;
  bool isShowMore = false;
  bool isFavorite = false;

  @override
  void initState() {
    isDetail = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(214, 239, 216, 0.6),
      body: Row(
        children: [
          CustomDrawer(),
          Expanded(
            child: _containerBox(),
          ),
          _map(context),
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
                  _margin(0, 10),
                  _carouselImage(),
                  _margin(0, 10),
                  _underCarousel(),
                  _listDetail(),
                  _margin(0, 10),
                  if (isDetail) _detail(),
                  if (isOverview) _overView(),
                  if (isReview) _review(),
                  _margin(0, 10),
                  _ratingAndReview(15),
                  _margin(0, 20),
                  _contactAndShowMore(),
                  _margin(0, 10),
                  if (isShowMore) _cardRow(),
                ],
              ),
            ],
          ),
        ),
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
                      height: MediaQuery.sizeOf(context).height * 0.5,
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
              enlargeFactor: 0.33,
              onPageChanged: (value, _) {
                setState(() {
                  _currentPage = value;
                });
              }),
        ),
        _buildCarouselIndicator()
      ],
    );
  }

  Widget _buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          Container(
            height: i == _currentPage ? 10 : 5,
            width: i == _currentPage ? 10 : 5,
            margin: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: i == _currentPage ? Colors.green : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }

  Widget _underCarousel() {
    return Row(
      children: [
        Expanded(
          child: _room(),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.08,
          child: Center(
            child: IconButton(
              hoverColor: Colors.redAccent[50],
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: Icon(
                Icons.favorite,
                size: 35,
                color: isFavorite ? Colors.redAccent : Colors.grey[300],
              ),
            ),
          ),
        ),
        Expanded(
          child: _roomFeature(),
        ),
      ],
    );
  }

  Widget _roomFeature() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 204, 204, 204)),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
        child: Center(
          child: Row(
            children: [
              _roomDecoration(Icons.bathtub_sharp, "2 baths"),
              Container(
                width: 1,
                height: 60,
                color: Colors.grey,
              ),
              _roomDecoration(Icons.king_bed, "2 Beds"),
              Container(
                width: 1,
                height: 60,
                color: Colors.grey,
              ),
              _roomDecoration(Icons.square_foot_sharp, "1837 sqft"),
              Container(
                width: 1,
                height: 60,
                color: Colors.grey,
              ),
              _roomDecoration(Icons.directions, "South East"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roomDecoration(IconData icon, String name) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.grey[700],
          ),
          Text(name)
        ],
      ),
    );
  }

  Widget _room() {
    return Row(
      children: [
        Expanded(
          child: _roomImage(
            "https://images.pexels.com/photos/2635038/pexels-photo-2635038.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
          ),
        ),
        Expanded(
          child: _roomImage(
            "https://images.pexels.com/photos/262048/pexels-photo-262048.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
          ),
        ),
        Expanded(
          child: _roomImage(
              "https://images.pexels.com/photos/2631746/pexels-photo-2631746.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
        ),
      ],
    );
  }

  Widget _roomImage(String image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          image,
          height: MediaQuery.sizeOf(context).height * 0.13,
          width: double.infinity,
          fit: BoxFit.cover,
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
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Text(
          'Per Month',
          style: TextStyle(
            color: Colors.green,
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
                    return const Color.fromRGBO(106, 169, 107, 0.873)
                        .withOpacity(0.2); // Color when overview is true
                  } else {
                    return Colors.transparent; // Default color
                  }
                },
              ),
              overlayColor: WidgetStateProperty.all(
                const Color.fromRGBO(106, 169, 107, 0.573).withOpacity(0.2),
              ), // Change this color as needed
            ),
            child: const Text(
              "Detail",
              style: TextStyle(
                color: Color.fromRGBO(26, 83, 25, 1),
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
                  if (isOverview) {
                    return const Color.fromRGBO(106, 169, 107, 0.573)
                        .withOpacity(0.2);
                  } else {
                    return Colors.transparent;
                  }
                },
              ),
              overlayColor: WidgetStateProperty.all(
                const Color.fromRGBO(106, 169, 107, 0.573).withOpacity(0.2),
              ), // Change this color as needed
            ),
            child: const Text(
              "Overview",
              style: TextStyle(
                color: Color.fromRGBO(26, 83, 25, 1),
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
                    return const Color.fromRGBO(106, 169, 107, 0.573)
                        .withOpacity(0.2); // Color when overview is true
                  } else {
                    return Colors.transparent; // Default color
                  }
                },
              ),
              overlayColor: WidgetStateProperty.all(
                const Color.fromRGBO(106, 169, 107, 0.573).withOpacity(0.2),
              ), // Change this color as needed
            ),
            child: const Text(
              "Review",
              style: TextStyle(
                color: Color.fromRGBO(26, 83, 25, 1),
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
          Icons.location_pin,
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
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius:
            BorderRadius.circular(16.0), // Adjust the radius as needed
      ),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.15,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean varius sagittis dui et congue. Donec laoreet leo quis tortor pulvinar molestie. Pellentesque lobortis eros ut augue cursus mollis. Quisque odio est, cursus nec lobortis sed, pretium a massa. Maecenas placerat, urna et dignissim dapibus, felis ante scelerisque lorem, vestibulum vehicula dui ante a metus. In id augue ullamcorper turpis sodales accumsan sed in mauris. Nunc hendrerit, quam ultricies varius efficitur, quam enim mattis erat, scelerisque mollis risus ipsum vel risus. Vestibulum in neque blandit, consectetur felis ut, posuere felis.",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _overView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius:
            BorderRadius.circular(16.0), // Adjust the radius as needed
      ),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.15,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            Text(
              "Aenean eu magna id quam tincidunt lacinia eget ac diam. Donec luctus massa non tortor fermentum, id commodo tellus consectetur. Nunc rhoncus, nibh et viverra ullamcorper, metus nulla porta mi, rutrum ullamcorper nisi magna fringilla libero. Pellentesque ultricies, eros ut faucibus tempor, quam felis bibendum felis, et tempor nulla tortor sit amet est. Morbi in dictum purus, a viverra sem. Proin eget venenatis tortor. Morbi ut nibh nulla. Suspendisse rutrum ex semper semper condimentum. Pellentesque non ex at dui consequat viverra in at nisi. Fusce commodo porttitor nulla, a mattis mauris egestas non. In pharetra viverra dolor, eu lobortis eros tempor vel.",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _review() {
    final List<String> names = [
      'Alex Johnson',
      'Jamie Smith',
      'Taylor Brown',
      'Jordan Lee',
      'Morgan Davis',
      'Casey Wilson',
      'Riley Martin',
      'Quinn Anderson',
      'Avery Clark',
      'Parker Lewis',
    ];
    final List<String> comments = [
      'Great job on this!',
      'Very interesting article indeed.',
      'I love this feature.',
      'Fantastic work, well done.',
      'Could be improved slightly.',
      'More details would help.',
      'Excellent, keep it up!',
      'This needs some changes.',
      'Nice work on this!',
      'Well explained and clear.',
    ];
    final List<String> imageUrls = [
      'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/428364/pexels-photo-428364.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1040881/pexels-photo-1040881.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1559486/pexels-photo-1559486.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1080213/pexels-photo-1080213.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/2589653/pexels-photo-2589653.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/343717/pexels-photo-343717.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1040880/pexels-photo-1040880.jpeg?auto=compress&cs=tinysrgb&w=600',
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(106, 169, 107, 0.2),
        borderRadius:
            BorderRadius.circular(16.0), // Adjust the radius as needed
      ),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return _comment(
            comments[index],
            imageUrls[index],
            names[index],
          );
        },
      ),
    );
  }

  Widget _comment(String comment, String image, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
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
              _margin(10, 0),
              _nameAndCmd(name, comment),
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
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _contactAndShowMore() {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _contactButton(),
          _showMore(),
        ],
      ),
    );
  }

  Widget _showMore() {
    return TextButton(
      onPressed: () {
        setState(() {
          isShowMore = !isShowMore;
        });
      },
      child: const Row(
        children: [
          Icon(
            Icons.arrow_drop_down,
            size: 30,
            color: Colors.green,
          ),
          Text(
            "Show More",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
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

  Widget _map(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.3,
        height: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FlutterMap(
            options: const MapOptions(
                initialCenter:
                    latLng.LatLng(16.81650498982013, 96.12937485793105),
                initialZoom: 15),
            children: [
              openStreetMapMapTileLater,
              const MarkerLayer(
                markers: [
                  flutterMap.Marker(
                    point: latLng.LatLng(16.81650498982013, 96.12937485793105),
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.location_pin,
                      size: 60,
                      color: Colors.redAccent,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  TileLayer get openStreetMapMapTileLater => TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'dev.fleaflet.flutter_map.example',
      );

  Widget _margin(double width, double height) {
    return SizedBox(
      width: width,
      height: height,
    );
  }

  Widget _cardRow() {
    return Row(
      children: [
        Expanded(
          child: _propertyCard(context,
              "https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&w=600"),
        ),
        Expanded(
          child: _propertyCard(context,
              "https://images.pexels.com/photos/276724/pexels-photo-276724.jpeg?auto=compress&cs=tinysrgb&w=600"),
        ),
        Expanded(
          child: _propertyCard(context,
              "https://images.pexels.com/photos/1115804/pexels-photo-1115804.jpeg?auto=compress&cs=tinysrgb&w=600"),
        ),
      ],
    );
  }

  Widget _propertyCard(BuildContext context, String image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: double.infinity,
          height: 320,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      image,
                      height: MediaQuery.sizeOf(context).height * 0.13,
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
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                '40000MMK /month',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Crown Apartment',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '45/HanTharWaddy Road/ Kamayut, Yangon',
                style: TextStyle(
                  color: Color.fromARGB(255, 80, 78, 78),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.bed),
                      SizedBox(width: 4),
                      Text('2 Bed'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.bathtub),
                      SizedBox(width: 4),
                      Text('2 Bath'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.square_foot),
                      SizedBox(width: 4),
                      Text('4500 Sq'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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

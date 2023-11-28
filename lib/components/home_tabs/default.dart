import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:group_button/group_button.dart';

class Default extends StatefulWidget {
  const Default({Key? key}) : super(key: key); // Constructor

  @override
  State<StatefulWidget> createState() => _DefaultState();
}

class _DefaultState extends State<Default> {
  int _index = 0; // Carousel Index

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final Set<Marker> _markers = {}; // Markers

  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(48.8566, 2.3522),
    zoom: 11.0,
  );

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    super.initState();
    //_center = Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    List valuesDataColors = [
      {"name": "Pachamma", "location": "Paris, France", "color": Colors.purple},
      {"name": "Pachamma", "location": "Paris, France", "color": Colors.blue},
      {"name": "Pachamma", "location": "Paris, France", "color": Colors.green}
    ];

    Widget loopPageBuilder(BuildContext context, int index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        padding: const EdgeInsets.only(left: 20, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: valuesDataColors[index]["color"],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                valuesDataColors[index]["name"],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFDFDFD),
                ),
              ),
              Text(
                valuesDataColors[index]["location"],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Color(0xffFDFDFD),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget recomandedBuilder(BuildContext context, int index) {
      return Container(
        height: 250,
        padding: const EdgeInsets.all(11),
        margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: valuesDataColors[index]["color"],
              ),
            ),
            const SizedBox(height: 18),
            Text(
              valuesDataColors[index]["name"],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              valuesDataColors[index]["location"],
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                      ),
                      const SizedBox(width: 79),
                      const Icon(
                        Icons.my_location,
                        size: 25,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Paris, France',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Color(
                              0xff6A778B,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 47),
                  const Text(
                    'Salut John,',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                      color: Color(
                        0xff39414B,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Trouve des personnes pour rentrer en boite ?',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff0A2753),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: LoopPageView.builder(
                controller: LoopPageController(viewportFraction: 0.8),
                itemCount: valuesDataColors.length,
                itemBuilder: loopPageBuilder,
                onPageChanged: (int index) {
                  setState(() {
                    _index = index;
                  });
                },
              ),
            ),
            Center(
              child: CarouselIndicator(
                count: valuesDataColors.length,
                index: _index,
                color: const Color(0xFFEFEFF4),
                activeColor: Colors.black,
                height: 6,
                width: 30,
              ),
            ),
            const SizedBox(height: 43),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: GroupButton(
                isRadio: true,
                controller: GroupButtonController(
                  selectedIndex: 0,
                ),
                buttons: const [
                  "Populaire",
                  "Electro",
                  "Rap",
                  "Afro",
                  "Trap",
                  "Rock",
                  "Jazz",
                  "Classique"
                ],
                buttonBuilder: (selected, value, context) => Container(
                  margin: const EdgeInsets.only(left: 26),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: selected ? 3 : 0,
                      backgroundColor: selected ? Colors.black : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side: BorderSide(
                          color:
                              selected ? Colors.black : const Color(0xffD6D6D6),
                        ),
                      ),
                    ),
                    onPressed: () => {},
                    child: Text(
                      value,
                      style: TextStyle(
                        color: selected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 43),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recommander',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Ink(
                        child: const InkWell(
                          onTap: null,
                          child: Text(
                            'Voir tout',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
            SizedBox(
              height: 265,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: valuesDataColors.length,
                itemBuilder: recomandedBuilder,
              ),
            ),
            const SizedBox(height: 43),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'FAQ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 17),
                  const Text(
                    'Des interrogations, des questions, des craintes ou des demandes ? Notre FAQ peut vous permettre de répondre à vous besoins.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Ink(
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        'Lire plus...',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(122, 40),
                      elevation: 0,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Voir',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 43),
                  const Text(
                    'La Carte',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: GoogleMap(
                        zoomGesturesEnabled: false,
                        zoomControlsEnabled: false,
                        tiltGesturesEnabled: false,
                        scrollGesturesEnabled: false,
                        rotateGesturesEnabled: false,
                        myLocationButtonEnabled: false,
                        mapToolbarEnabled: false,
                        liteModeEnabled: true,
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: _initialPosition,
                        markers: _markers,
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

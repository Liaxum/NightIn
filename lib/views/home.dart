import 'package:card_slider/card_slider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key); // Constructor

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoogleMapController mapController; // Google Map Controller
  Set<Marker> _markers = {}; // Markers

  late Future<Position> _center; // Center Map

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _center = Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    List<Color> valuesDataColors = [
      Colors.purple,
      Colors.yellow,
      Colors.green,
      Colors.red,
      Colors.grey,
      Colors.blue,
    ];

    List<Widget> valuesWidget = [];
    for (int i = 0; i < valuesDataColors.length; i++) {
      valuesWidget.add(
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(41),
            color: valuesDataColors[i],
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              i.toString(),
              style: const TextStyle(
                fontSize: 28,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 26), // Padding
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
                'Trouve des personnes pour rentrer en boite.',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Color(
                    0xff0A2753,
                  ),
                ),
              ),
            ),
            CardSlider(
              cards: valuesWidget,
              bottomOffset: .0005,
              cardHeight: 0.75,
              itemDotOffset: 0.25,
            ),
            FutureBuilder(
              future: _center,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    // The user location returned from the snapshot
                    Position? snapshotData = snapshot.data;
                    LatLng userLocation =
                        LatLng(snapshotData!.latitude, snapshotData.longitude);
                    return GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: userLocation,
                        zoom: 12,
                      ),
                      markers: _markers
                        ..add(Marker(
                            markerId: const MarkerId("User Location"),
                            infoWindow:
                                const InfoWindow(title: "User Location"),
                            position: userLocation)),
                    );
                  } else {
                    return const Center(
                        child: Text("Failed to get user location."));
                  }
                }
                // While the connection is not in the done state yet
                return const Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapFlutter extends StatefulWidget {
  const GoogleMapFlutter({super.key});

  @override
  State<GoogleMapFlutter> createState() => _GoogleMapFlutterState();
}

class _GoogleMapFlutterState extends State<GoogleMapFlutter> {
  /// Origin Location
  final LatLng originLatLng = const LatLng(20.0061067, 73.7543002);

  /// Destination Location
  final LatLng destinationLatLng = const LatLng(20.007361, 73.7638712);
  late GoogleMapController googleMapController;
  late Marker _origin;
  late Marker _destination;

  @override
  void initState() {
    super.initState();
    _origin = Marker(
      markerId: const MarkerId('origin'),
      position: originLatLng,
      infoWindow: const InfoWindow(title: "Origin", snippet: "Starting Point"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );
    _destination = Marker(
      markerId: const MarkerId('destination'),
      position: destinationLatLng,
      infoWindow: const InfoWindow(title: "Destination", snippet: "End Point"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fixed Route"),
        actions: [
          TextButton(
            onPressed: () {
              _fitMarkers();
            },
            child: const Text(
              "VIEW ROUTE",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        markers: {_origin, _destination},
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: originLatLng,
          zoom: 14,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.my_location,
          color: Theme.of(context).colorScheme.primary,
          size: 30,
        ),
        onPressed: () async {
          Position position = await currentPosition();
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 18,
              ),
            ),
          );
        },
      ),
    );
  }

  Future<Position> currentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }

  void _fitMarkers() {
    LatLngBounds bounds;
    if (originLatLng.latitude > destinationLatLng.latitude) {
      bounds = LatLngBounds(
        southwest: destinationLatLng,
        northeast: originLatLng,
      );
    } else {
      bounds = LatLngBounds(
        southwest: originLatLng,
        northeast: destinationLatLng,
      );
    }

    googleMapController.animateCamera(
      CameraUpdate.newLatLngBounds(bounds, 100),
    );
  }
}

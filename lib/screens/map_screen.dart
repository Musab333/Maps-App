import 'dart:async';
import 'package:Mapper/widgets/drawer_custam.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  MapType _mapType = MapType.hybrid;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Maps App',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        toolbarHeight: 70,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // Add your action here
            },
            icon: const Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      drawer: Drawer(
        child: DrawerCustom(
          selectedMapType: _mapType,
          onMapTypeChanged: (mapType) {
            setState(() {
              _mapType = mapType;
            });
          },
        ),
      ),

      body: GoogleMap(
        mapType: _mapType,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        // Set your Map ID.
        mapId: 'my-map-id',
        // Enable support for Advanced Markers.
        markerType: GoogleMapMarkerType.advancedMarker,
        markers: {
          Marker(
            markerId: const MarkerId('1'),
            position: const LatLng(37.42796133580664, -122.085749655962),
            infoWindow: const InfoWindow(
              title: 'Marker 1',
              snippet: 'This is marker 1',
            ),
            icon: BitmapDescriptor.defaultMarker,
          ),
        },
        polygons: {
          Polygon(
            polygonId: const PolygonId('polygon_1'),
            points: [
              const LatLng(37.43296265331129, -122.08832357078792),
              const LatLng(37.42796133580664, -122.085749655962),
              const LatLng(37.43000000000000, -122.09000000000000),
            ],
            strokeColor: Colors.red,
            fillColor: Colors.red.withOpacity(0.5),
            strokeWidth: 2,
          ),
          Polygon(
            polygonId: const PolygonId('polygon_2'),
            points: [
              const LatLng(37.43000000000000, -122.09000000000000),
              const LatLng(37.42796133580664, -122.085749655962),
              const LatLng(37.42500000000000, -122.08000000000000),
            ],
            strokeColor: Colors.blue,
            fillColor: Colors.blue.withOpacity(0.5),
            strokeWidth: 2,
          ),
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text(
          'Go To',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: const Icon(Icons.location_searching, color: Colors.white),
        backgroundColor: Colors.teal,
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

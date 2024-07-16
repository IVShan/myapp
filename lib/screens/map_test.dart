import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class mapscreen extends StatefulWidget {
  const mapscreen({super.key});

  @override
  State<mapscreen> createState() => _mapscreenState();
}

class _mapscreenState extends State<mapscreen> {
  static const LatLng _kGooglePlex=LatLng(37.4223, -122.0848);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 600,
          child: GoogleMap(
        
              initialCameraPosition: CameraPosition(
                  target: _kGooglePlex,
                  zoom: 13),
              //mapType: MapType.satellite,
              markers:{
                Marker(
                    markerId:MarkerId('_currentLocation'),
                    icon:BitmapDescriptor.defaultMarker,
                    position: _kGooglePlex
        
                )
              } ),
        ),
      ),
    );
  }
}
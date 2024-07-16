import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
 class mapscreen extends StatefulWidget {
  const mapscreen({super.key});

  @override
  State<mapscreen> createState() => _mapscreenState();
}

class _mapscreenState extends State<mapscreen> {
  Completer<GoogleMapController> _controller=Completer();
  static const LatLng _kGooglePlex=LatLng(37.4223, -122.0848);
  List<Marker> _marker=[];
  List<Marker> get _list => const[
    Marker(markerId: MarkerId('1'),position: LatLng(37.4223, -122.0848),
    infoWindow: InfoWindow(title: 'My marker')
    ),
    Marker(markerId: MarkerId('2'),position: LatLng(37.4523, -122.1048),
    infoWindow: InfoWindow(title: 'chennai')
    ),
  ];
  @override
  void initState(){
    super.initState();
    _marker.addAll(_list);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          
          initialCameraPosition: CameraPosition(
            target: _kGooglePlex,
            zoom: 13),
            //mapType: MapType.satellite,
            markers:Set<Marker>.of(_marker),
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
            ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.location_disabled_outlined),
      onPressed: ()async{
        GoogleMapController controller=await _controller.future;
        controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(37.4523, -122.1048),
          zoom: 13
          )
          ));
          setState(() {
            
          });
      },),
    );
    
  }
}
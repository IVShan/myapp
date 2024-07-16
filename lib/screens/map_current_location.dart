import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
    loaddata();
  }
  loaddata(){
    getUserCurrentLocation().then((value) async{
      print(value.latitude.toString());
      _marker.add(
          Marker(
              markerId: MarkerId('10'),
              position: LatLng(value.latitude,value.longitude),
              infoWindow: InfoWindow(title: 'Current location')
          )
      );
      CameraPosition cameraPosition=CameraPosition(target: LatLng(value.latitude,value.longitude),zoom: 13);
      final GoogleMapController controller=await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {

      });
    });
  }
  Future<Position> getUserCurrentLocation() async{
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace){
      print(error.toString());
    });
    return await Geolocator.getCurrentPosition();
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
      floatingActionButton: FloatingActionButton(child: Icon(Icons.local_activity),
      onPressed: () async{
        getUserCurrentLocation().then((value) async{
          print(value.latitude.toString());
          _marker.add(
            Marker(
              markerId: MarkerId('10'),
              position: LatLng(value.latitude,value.longitude),
              infoWindow: InfoWindow(title: 'Current location')
            )
          );
          CameraPosition cameraPosition=CameraPosition(target: LatLng(value.latitude,value.longitude),zoom: 13);
          final GoogleMapController controller=await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
          setState(() {

          });
        });
      },),
    );
    
  }
}
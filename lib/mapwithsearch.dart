import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class Mapwithsearch extends StatefulWidget {
  const Mapwithsearch({Key? key}) : super(key: key);

  @override
  _MapwithsearchState createState() => _MapwithsearchState();
}

class _MapwithsearchState extends State<Mapwithsearch> {
  final _controllert = TextEditingController();
  var uuid = const Uuid();
  String _sessionToken = '1234567890';
  List<dynamic> _placeList = [];
  Completer<GoogleMapController> _controller = Completer();
  String? _currentAddress;

// on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 10,
  );

// on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 75.885749655962),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];

// created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position!.latitude, position!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    super.initState();
    _controllert.addListener(() {
      _onChanged();
    });
  }

  _onChanged() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggestion(_controllert.text);
  }

  void getSuggestion(String input) async {
    const String PLACES_API_KEY = "AIzaSyCD32BiMiqJxUFgHVR3YcyvXIKqmVtIfIs";

    try {
      String baseURL =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request =
          '$baseURL?input=$input&key=$PLACES_API_KEY&sessiontoken=$_sessionToken';
      var response = await http.get(Uri.parse(request));
      var data = json.decode(response.body);
      if (kDebugMode) {
        print('mydata');
        print(data);
      }
      if (response.statusCode == 200) {
        setState(() {
          _placeList = json.decode(response.body)['predictions'];
        });
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F9D58),
        // on below line we have given title of app
        title: Text("GFG"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: SafeArea(
              // on below line creating google maps
              child: GoogleMap(
                // on below line setting camera position
                initialCameraPosition: _kGoogle,
                // on below line we are setting markers on the map
                markers: Set<Marker>.of(_markers),
                // on below line specifying map type.
                mapType: MapType.normal,
                // on below line setting user location enabled.
                myLocationEnabled: true,
                // on below line setting compass enabled.
                compassEnabled: true,
                // on below line specifying controller on map complete.
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ),
          Positioned(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3518602291.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:830919615.
            top: 0,
            right: 0,
            left: 1,
            child: Container(
              width: MediaQuery.of(context).size.width - 1,
              height: 60,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      // Suggested code may be subject to a license. Learn more: ~LicenseLog:1932585457.
                      // Suggested code may be subject to a license. Learn more: ~LicenseLog:2977040112.
                      // Suggested code may be subject to a license. Learn more: ~LicenseLog:645003720.
                      Expanded(
                          child: TextField(
                        controller: _controllert,
                        obscureText: false,
                        textAlign: TextAlign.start,
                        // Suggested code may be subject to a license. Learn more: ~LicenseLog:1034433365.
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide:
                                BorderSide(color: Color(0xffffffff), width: 0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide:
                                BorderSide(color: Color(0xffffffff), width: 0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide:
                                BorderSide(color: Color(0xffffffff), width: 0),
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff5b5858),
                          ),
                        ),
                      )),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _placeList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            _controllert.text =
                                _placeList[index]["description"];
                            setState(() {
                              _placeList = [];
                            });
                          },
                          child: ListTile(
                            title: Text(_placeList[index]["description"]),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3518602291.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:830919615.
            top: 50,
            right: 0,
            left: 1,
            child: Container(
              width: MediaQuery.of(context).size.width - 1,
              height: MediaQuery.of(context).size.height - 100,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _placeList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            _controllert.text =
                                _placeList[index]["description"];
                            setState(() {
                              _placeList = [];
                            });
                          },
                          child: ListTile(
                            title: Text(_placeList[index]["description"]),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4154829368.
        ],
      ),
      // on pressing floating action button the camera will take to user current location
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getUserCurrentLocation().then((value) async {
            print(value.latitude.toString() + " " + value.longitude.toString());
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4281840756.
            await _getAddressFromLatLng(value);
            // marker added for current users location
            _markers.add(Marker(
              markerId: MarkerId("2"),
              position: LatLng(value.latitude, value.longitude),
              infoWindow: InfoWindow(
                title: 'My Current Location',
                snippet: _currentAddress ?? '',
              ),
            ));

            // specified current users location
            CameraPosition cameraPosition = new CameraPosition(
              target: LatLng(value.latitude, value.longitude),
              zoom: 14,
            );

            final GoogleMapController controller = await _controller.future;
            controller
                .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {});
          });
        },
        child: Icon(Icons.local_activity),
      ),
    );
  }
}

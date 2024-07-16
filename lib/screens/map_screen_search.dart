import 'dart:typed_data';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:custom_info_window/custom_info_window.dart';
import 'package:clippy_flutter/triangle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'adoption_list.dart';
import 'details_screen.dart';
import 'result_grid.dart';
import 'adoption_description.dart';
import './comments_screen.dart';
import 'vet_list.dart';

class mapscreen extends StatefulWidget {
  const mapscreen({super.key});

  @override
  State<mapscreen> createState() => _mapscreenState();
}

class _mapscreenState extends State<mapscreen> {
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  final Completer<GoogleMapController> _controller = Completer();
//static const LatLng _kGooglePlex=LatLng(33.6910, 72.98072);
  TextEditingController searchController = TextEditingController();
  int _selectedIndex = 0;
  List<String> images = [
    'assets/images/foundpets.png',
    'assets/images/missingpets.png',
    'assets/images/foundpets.png',
    'assets/images/foundpets.png',
    'assets/images/missingpets.png',
    'assets/images/missingpets.png',
  ];
  Uint8List? markerImage;
  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latLang = <LatLng>[
    LatLng(33.6941, 72.9734),
    LatLng(33.7008, 72.9682),
    LatLng(33.6992, 72.9744),
    LatLng(33.6939, 72.9771),
    LatLng(33.6910, 72.9807),
    LatLng(33.7036, 72.9785)
  ];
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.6910, 72.98072),
    zoom: 15,
  );
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
      if (_selectedIndex == 3) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => resultgrid()));
      }else if(_selectedIndex == 4){
Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => adoptionlist()));
      }else if(_selectedIndex == 2){
Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => commentsscreen()));
      }else if(_selectedIndex == 1){
Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => adoptiondescription()));
      }else if(_selectedIndex == 0){
Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => vetlist()));
      }
    });
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  loadData() async {
    for (int i = 0; i < images.length; i++) {
      final Uint8List markerIcon =
          await getBytesFromAsset(images[i].toString(), 100);
      _markers.add(Marker(
          markerId: MarkerId(i.toString()),
          position: _latLang[i],
          icon: BitmapDescriptor.fromBytes(markerIcon),
//infoWindow: InfoWindow(
//title: 'The title of the marker'
//)
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withOpacity(0.1),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.zero,
                            border:
                                Border.all(color: Color(0x4d9e9e9e), width: 0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 5, 3),
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: Color(0xffffffff),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                        color: Color(0xffffffff), width: 1),
                                  ),
                                  padding: EdgeInsets.all(0),
                                  child: Text(
                                    "Message",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Proximasoft',
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  textColor: Color(0xffb6b6b6),
                                  height: 30,
                                  minWidth: 80,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: Color(0xffffffff),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                        color: Color(0xffffffff), width: 1),
                                  ),
                                  padding: EdgeInsets.all(0),
                                  child: Text(
                                    "Share",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Proximasoft',
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  textColor: Color(0xffb6b6b6),
                                  height: 30,
                                  minWidth: 80,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 2, 0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            7, 0, 0, 2),
                                                    child: Text(
                                                      "Name :",
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 14,
                                                        fontFamily: 'SegoeUI',
                                                        color:
                                                            Color(0xff000000),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(7, 0, 0, 2),
                                                    child: Text(
                                                      "Location :",
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 14,
                                                        fontFamily: 'SegoeUI',
                                                        color:
                                                            Color(0xff000000),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 3, 0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 0, 3),
                                                    child: Text(
                                                      "MAYA",
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 14,
                                                        fontFamily: 'SegoeUI',
                                                        color:
                                                            Color(0xff000000),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    "London Road",
                                                    textAlign: TextAlign.start,
                                                    overflow: TextOverflow.clip,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14,
                                                      fontFamily: 'SegoeUI',
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                        Image(
                                          image: AssetImage(
                                              "assets/images/dog.png"),
                                          width: 60,
                                          fit: BoxFit.contain,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                7, 0, 0, 0),
                                            child: Text(
                                              "Description :",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                fontFamily: 'SegoeUI',
                                                color: Color(0xff000000),
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                7, 0, 0, 0),
                                            child: Text(
                                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                fontFamily: 'SegoeUI',
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ///***If you have exported images you must have to copy those images in assets/images directory.
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 3, 0, 0),
                                        child: Image(
                                          image: AssetImage(
                                              "assets/images/qrcodeicon1.png"),
                                          width: 30,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 3, 5, 0),
                                        child: SizedBox(
                                          height: 20,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          detailscreen()));
                                            },
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xff019b9e),
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                            child: Center(
                                                child: const Text(
                                              'More >',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.white,
                                                  fontFamily: 'Proximasoft'),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Triangle.isosceles(
                    edge: Edge.BOTTOM,
                    child: Container(
                      padding: EdgeInsets.zero,
                      color: Colors.white,
                      width: 20.0,
                      height: 15.0,
                    ),
                  ),
                ],
              ),
              _latLang[i],
            );
          }));

      setState(() {});
    }
  }

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/menuicon.png",
            fit: BoxFit.contain,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 0, top: 0),
          child: Image.asset(
            'assets/images/logocolor.png',
            fit: BoxFit.contain,
            height: 40,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/usericon.png",
              fit: BoxFit.contain,
            ),
          ),
        ],
        shape: Border(bottom: BorderSide(color: Color(0xff019b9e), width: 4)),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: screenWidth,
            child: GoogleMap(
              onTap: (position) {
                _customInfoWindowController.hideInfoWindow!();
              },
              onCameraMove: (position) {
                _customInfoWindowController.onCameraMove!();
              },
              onMapCreated: (GoogleMapController controller) async {
                _customInfoWindowController.googleMapController = controller;
              },
              initialCameraPosition: _kGooglePlex,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: Set<Marker>.of(_markers),
            ),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 200,
            width: 300,
            offset: 40,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
            child: Column(
              children: [
                SafeArea(
                  child: Container(
                      height: 40.0,
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 11.0),
                            border: InputBorder.none,
                            hintText: 'Search by location...',
                            hintStyle: TextStyle(fontSize: 15.0, color: Color(0xffB5B5B5),),
                            suffixIcon: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween, // added line
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      searchController.text = '';
                                    });
                                  },
                                  icon: Icon(Icons.gps_fixed,color: Color(0xffB5B5B5),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: SizedBox(
                                    height: 30,
                                    child: TextButton(
                                      onPressed: () {
//Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>resultgrid()));

                                        showModalBottomSheet<void>(
// context and builder are
// required properties in this widget
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (BuildContext context) {
// we set up a container inside which
// we create center column and display text

// Returning SizedBox instead of a Container
                                            return SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.75,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    GridView(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      physics:
                                                          const ClampingScrollPhysics(),
                                                      gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        crossAxisSpacing: 8,
                                                        mainAxisSpacing: 8,
                                                        childAspectRatio: 1.13,
                                                      ),
                                                      children: [
                                                        Card(
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(4),
                                                          color: const Color(
                                                              0xffFCF9F2),
                                                          shadowColor:
                                                              const Color(
                                                                  0xff000000),
                                                          elevation: 4,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                ///***If you have exported images you must have to copy those images in assets/images directory.
                                                                Stack(
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(10.0),
                                                                            topRight: Radius.circular(10),
                                                                            bottomRight: Radius.circular(0),
                                                                            bottomLeft: Radius.circular(0)),
                                                                        child:
                                                                            Image(
                                                                          image:
                                                                              const AssetImage("assets/images/cat.jpg"),
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.15,
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Positioned(
                                                                        // The Positioned widget is used to position the text inside the Stack widget
                                                                        bottom:
                                                                            3,
                                                                        right:
                                                                            3,

                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            color:
                                                                                Colors.white,
                                                                            border:
                                                                                Border.all(
                                                                              color: Colors.white,
                                                                              width: 0,
                                                                            ),
                                                                          ),
                                                                          // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                                                                          width:
                                                                              30,
                                                                          // color: Colors.white,
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              7),
                                                                          child:
                                                                              Image(
                                                                            image:
                                                                                AssetImage("assets/images/qricon.png"),
                                                                            width:
                                                                                20,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ]),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Container(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          margin:
                                                                              EdgeInsets.all(0),
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          height:
                                                                              30,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xfff95239),
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            borderRadius: BorderRadius.only(
                                                                                topLeft: Radius.circular(0),
                                                                                topRight: Radius.circular(0),
                                                                                bottomRight: Radius.circular(10),
                                                                                bottomLeft: Radius.circular(10)),
                                                                            border:
                                                                                Border.all(color: Color(0x4d9e9e9e), width: 1),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            "Meow - 10/03/2024",
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            overflow:
                                                                                TextOverflow.clip,
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontStyle: FontStyle.normal,
                                                                              fontSize: 12,
                                                                              fontFamily: 'SegoeUI',
                                                                              color: Color(0xffffffff),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Card(
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(4),
                                                          color: const Color(
                                                              0xffFCF9F2),
                                                          shadowColor:
                                                              const Color(
                                                                  0xff000000),
                                                          elevation: 4,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                ///***If you have exported images you must have to copy those images in assets/images directory.
                                                                Stack(
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(10.0),
                                                                            topRight: Radius.circular(10),
                                                                            bottomRight: Radius.circular(0),
                                                                            bottomLeft: Radius.circular(0)),
                                                                        child:
                                                                            Image(
                                                                          image:
                                                                              const AssetImage("assets/images/cat2.jpg"),
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.15,
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Positioned(
                                                                        // The Positioned widget is used to position the text inside the Stack widget
                                                                        bottom:
                                                                            3,
                                                                        right:
                                                                            3,

                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            color:
                                                                                Colors.white,
                                                                            border:
                                                                                Border.all(
                                                                              color: Colors.white,
                                                                              width: 0,
                                                                            ),
                                                                          ),
                                                                          // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                                                                          width:
                                                                              30,
                                                                          // color: Colors.white,
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              7),
                                                                          child:
                                                                              Image(
                                                                            image:
                                                                                AssetImage("assets/images/qricon.png"),
                                                                            width:
                                                                                20,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ]),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Container(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          margin:
                                                                              EdgeInsets.all(0),
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          height:
                                                                              30,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xfff95239),
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            borderRadius: BorderRadius.only(
                                                                                topLeft: Radius.circular(0),
                                                                                topRight: Radius.circular(0),
                                                                                bottomRight: Radius.circular(10),
                                                                                bottomLeft: Radius.circular(10)),
                                                                            border:
                                                                                Border.all(color: Color(0x4d9e9e9e), width: 1),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            "Meow - 10/03/2024",
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            overflow:
                                                                                TextOverflow.clip,
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontStyle: FontStyle.normal,
                                                                              fontSize: 12,
                                                                              fontFamily: 'SegoeUI',
                                                                              color: Color(0xffffffff),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Card(
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(4),
                                                          color: const Color(
                                                              0xffFCF9F2),
                                                          shadowColor:
                                                              const Color(
                                                                  0xff000000),
                                                          elevation: 4,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                ///***If you have exported images you must have to copy those images in assets/images directory.
                                                                Stack(
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(10.0),
                                                                            topRight: Radius.circular(10),
                                                                            bottomRight: Radius.circular(0),
                                                                            bottomLeft: Radius.circular(0)),
                                                                        child:
                                                                            Image(
                                                                          image:
                                                                              const AssetImage("assets/images/dog1.jpg"),
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.15,
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Positioned(
                                                                        // The Positioned widget is used to position the text inside the Stack widget
                                                                        bottom:
                                                                            3,
                                                                        right:
                                                                            3,

                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            color:
                                                                                Colors.white,
                                                                            border:
                                                                                Border.all(
                                                                              color: Colors.white,
                                                                              width: 0,
                                                                            ),
                                                                          ),
                                                                          // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                                                                          width:
                                                                              30,
                                                                          // color: Colors.white,
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              7),
                                                                          child:
                                                                              Image(
                                                                            image:
                                                                                AssetImage("assets/images/qricon.png"),
                                                                            width:
                                                                                20,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ]),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Container(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          margin:
                                                                              EdgeInsets.all(0),
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          height:
                                                                              30,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xfff95239),
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            borderRadius: BorderRadius.only(
                                                                                topLeft: Radius.circular(0),
                                                                                topRight: Radius.circular(0),
                                                                                bottomRight: Radius.circular(10),
                                                                                bottomLeft: Radius.circular(10)),
                                                                            border:
                                                                                Border.all(color: Color(0x4d9e9e9e), width: 1),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            "Meow - 10/03/2024",
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            overflow:
                                                                                TextOverflow.clip,
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontStyle: FontStyle.normal,
                                                                              fontSize: 12,
                                                                              fontFamily: 'SegoeUI',
                                                                              color: Color(0xffffffff),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Card(
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(4),
                                                          color: const Color(
                                                              0xffFCF9F2),
                                                          shadowColor:
                                                              const Color(
                                                                  0xff000000),
                                                          elevation: 4,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                ///***If you have exported images you must have to copy those images in assets/images directory.
                                                                Stack(
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(10.0),
                                                                            topRight: Radius.circular(10),
                                                                            bottomRight: Radius.circular(0),
                                                                            bottomLeft: Radius.circular(0)),
                                                                        child:
                                                                            Image(
                                                                          image:
                                                                              const AssetImage("assets/images/dog2.jpg"),
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.15,
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Positioned(
                                                                        // The Positioned widget is used to position the text inside the Stack widget
                                                                        bottom:
                                                                            3,
                                                                        right:
                                                                            3,

                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            color:
                                                                                Colors.white,
                                                                            border:
                                                                                Border.all(
                                                                              color: Colors.white,
                                                                              width: 0,
                                                                            ),
                                                                          ),
                                                                          // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                                                                          width:
                                                                              30,
                                                                          // color: Colors.white,
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              7),
                                                                          child:
                                                                              Image(
                                                                            image:
                                                                                AssetImage("assets/images/qricon.png"),
                                                                            width:
                                                                                20,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ]),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Container(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          margin:
                                                                              EdgeInsets.all(0),
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          height:
                                                                              30,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xfff95239),
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            borderRadius: BorderRadius.only(
                                                                                topLeft: Radius.circular(0),
                                                                                topRight: Radius.circular(0),
                                                                                bottomRight: Radius.circular(10),
                                                                                bottomLeft: Radius.circular(10)),
                                                                            border:
                                                                                Border.all(color: Color(0x4d9e9e9e), width: 1),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            "Meow - 10/03/2024",
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            overflow:
                                                                                TextOverflow.clip,
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontStyle: FontStyle.normal,
                                                                              fontSize: 12,
                                                                              fontFamily: 'SegoeUI',
                                                                              color: Color(0xffffffff),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Card(
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(4),
                                                          color: const Color(
                                                              0xffFCF9F2),
                                                          shadowColor:
                                                              const Color(
                                                                  0xff000000),
                                                          elevation: 4,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                ///***If you have exported images you must have to copy those images in assets/images directory.
                                                                Stack(
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(10.0),
                                                                            topRight: Radius.circular(10),
                                                                            bottomRight: Radius.circular(0),
                                                                            bottomLeft: Radius.circular(0)),
                                                                        child:
                                                                            Image(
                                                                          image:
                                                                              const AssetImage("assets/images/dog3.jpg"),
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.15,
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Positioned(
                                                                        // The Positioned widget is used to position the text inside the Stack widget
                                                                        bottom:
                                                                            3,
                                                                        right:
                                                                            3,

                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            color:
                                                                                Colors.white,
                                                                            border:
                                                                                Border.all(
                                                                              color: Colors.white,
                                                                              width: 0,
                                                                            ),
                                                                          ),
                                                                          // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                                                                          width:
                                                                              30,
                                                                          // color: Colors.white,
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              7),
                                                                          child:
                                                                              Image(
                                                                            image:
                                                                                AssetImage("assets/images/qricon.png"),
                                                                            width:
                                                                                20,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ]),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Container(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          margin:
                                                                              EdgeInsets.all(0),
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          height:
                                                                              30,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xfff95239),
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            borderRadius: BorderRadius.only(
                                                                                topLeft: Radius.circular(0),
                                                                                topRight: Radius.circular(0),
                                                                                bottomRight: Radius.circular(10),
                                                                                bottomLeft: Radius.circular(10)),
                                                                            border:
                                                                                Border.all(color: Color(0x4d9e9e9e), width: 1),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            "Meow - 10/03/2024",
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            overflow:
                                                                                TextOverflow.clip,
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontStyle: FontStyle.normal,
                                                                              fontSize: 12,
                                                                              fontFamily: 'SegoeUI',
                                                                              color: Color(0xffffffff),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Card(
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(4),
                                                          color: const Color(
                                                              0xffFCF9F2),
                                                          shadowColor:
                                                              const Color(
                                                                  0xff000000),
                                                          elevation: 4,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                ///***If you have exported images you must have to copy those images in assets/images directory.
                                                                Stack(
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(10.0),
                                                                            topRight: Radius.circular(10),
                                                                            bottomRight: Radius.circular(0),
                                                                            bottomLeft: Radius.circular(0)),
                                                                        child:
                                                                            Image(
                                                                          image:
                                                                              const AssetImage("assets/images/dog4.jpg"),
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.15,
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Positioned(
                                                                        // The Positioned widget is used to position the text inside the Stack widget
                                                                        bottom:
                                                                            3,
                                                                        right:
                                                                            3,

                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            color:
                                                                                Colors.white,
                                                                            border:
                                                                                Border.all(
                                                                              color: Colors.white,
                                                                              width: 0,
                                                                            ),
                                                                          ),
                                                                          // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                                                                          width:
                                                                              30,
                                                                          // color: Colors.white,
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              7),
                                                                          child:
                                                                              Image(
                                                                            image:
                                                                                AssetImage("assets/images/qricon.png"),
                                                                            width:
                                                                                20,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ]),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Container(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          margin:
                                                                              EdgeInsets.all(0),
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          height:
                                                                              30,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xfff95239),
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            borderRadius: BorderRadius.only(
                                                                                topLeft: Radius.circular(0),
                                                                                topRight: Radius.circular(0),
                                                                                bottomRight: Radius.circular(10),
                                                                                bottomLeft: Radius.circular(10)),
                                                                            border:
                                                                                Border.all(color: Color(0x4d9e9e9e), width: 1),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            "Meow - 10/03/2024",
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            overflow:
                                                                                TextOverflow.clip,
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontStyle: FontStyle.normal,
                                                                              fontSize: 12,
                                                                              fontFamily: 'SegoeUI',
                                                                              color: Color(0xffffffff),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Color(0xff019b9e),
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: Center(
                                          child: const Text(
                                        'Search',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white,
                                            fontFamily: 'Proximasoft'),
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      )),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff019b9e),
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        foregroundColor: Colors.white,
        onPressed: () {},
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xffeca572), width: 5),
          ),
        ),
        child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/menuhome.png",
                  fit: BoxFit.contain,
                ),
                label: '',
//backgroundColor: Colors.green
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/menuvets.png",
                  fit: BoxFit.contain,
                ),
                label: '',
//backgroundColor: Colors.yellow
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/menusearch.png",
                  fit: BoxFit.contain,
                ),
                label: '',
//backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/menupets.png",
                  fit: BoxFit.contain,
                ),
                label: '',
//backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/menubag.png",
                  fit: BoxFit.contain,
                ),
                label: '',
//backgroundColor: Colors.blue,
              )
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            iconSize: 30,
            onTap: _onItemTapped,
            elevation: 5,
            backgroundColor: Color(0xff019b9e),
            selectedLabelStyle: TextStyle(fontSize: 0),
            unselectedLabelStyle: TextStyle(fontSize: 0)),
      ),
    );
  }
}

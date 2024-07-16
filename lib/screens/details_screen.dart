import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class detailscreen extends StatefulWidget {
  const detailscreen({super.key});

  @override
  State<detailscreen> createState() => _detailscreenState();
}

class _detailscreenState extends State<detailscreen> {
  int _selectedIndex = 0;
  static const LatLng _kGooglePlex=LatLng(37.4223, -122.0848);
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Color(0xffFCF9F2),
      appBar:AppBar(
        leadingWidth: 50,
        backgroundColor: Color(0xffFCF9F2),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/menuicon.png",fit: BoxFit.contain,
          ),),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 0,top: 0),
          child: Image.asset('assets/images/logocolor.png',
            fit: BoxFit.contain,
            height: 40,

          ),
        ),
        centerTitle: true,
        actions: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/usericon.png",fit: BoxFit.contain,
            ),),
        ],
        shape: Border(
            bottom: BorderSide(
                color: Color(0xff019b9e),
                width: 4
            )
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: SingleChildScrollView(
          child: Container(
          
            decoration: BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
          
              )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
          
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
                                child:
          
                                ///***If you have exported images you must have to copy those images in assets/images directory.
                                Image(
                                  image: AssetImage("assets/images/dog.png"),
                                  width: 25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "@userjay23",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  fontFamily:'SegoeUI',
                                  color: Color(0xff626060),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(7, 3, 3, 0),
                              child:
          
                              ///***If you have exported images you must have to copy those images in assets/images directory.
                              Image(
                                image: AssetImage("assets/images/locationpin.png"),
                                width: 10,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                              child: Text(
                                "Tooting, London",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10,
                                  fontFamily:'SegoeUI',
                                  color: Color(0xff626060),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 3, 0, 0),
                              child: Text(
                                "10/02/23 05:10AM",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 9,
                                  fontFamily:'SegoeUI',
                                  color: Color(0xffb6b6b6),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ///***If you have exported images you must have to copy those images in assets/images directory.
                                Image(
                                  image: AssetImage("assets/images/qricon.png"),
                                  width: 20,
                                  fit: BoxFit.cover,
                                ),
          
                                ///***If you have exported images you must have to copy those images in assets/images directory.
                                Image(
                                  image: AssetImage("assets/images/calliconfill.png"),
                                  width: 20,
                                  fit: BoxFit.cover,
                                ),
          
                                ///***If you have exported images you must have to copy those images in assets/images directory.
                                Image(
                                  image: AssetImage("assets/images/messageicon.png"),
                                  width: 20,
                                  fit: BoxFit.cover,
                                ),
          
                                ///***If you have exported images you must have to copy those images in assets/images directory.
                                Image(
                                  image: AssetImage("assets/images/shareicon.png"),
                                  width: 20,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ///***If you have exported images you must have to copy those images in assets/images directory.
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          image: AssetImage("assets/images/cat.jpg"),
                          width: MediaQuery.of(context).size.width * 0.92,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFCF9F2),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),

                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s\n\n"
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s\n\n"
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s\n\n"
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",

                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 13,
                                fontFamily:'SegoeUI',
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),

                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    color: Color(0xffFCF9F2),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(color: Color(0xffffffff), width: 1),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Female",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Proximasoft',
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    textColor: Color(0xff000000),
                                    height: 30,
                                    minWidth: 100,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    color: Colors.pink,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Color(0xffffffff), width: 1),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Pink Collar",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Proximasoft',
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    textColor: Color(0xffffffff),
                                    height: 30,
                                    minWidth: 100,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    color: Color(0xff019b9e),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Color(0xffffffff), width: 1),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Call",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Proximasoft',
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    textColor: Color(0xffffffff),
                                    height: 30,
                                    minWidth: 100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),

                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: SingleChildScrollView(
                              child: SizedBox(
                                height: 200,
                                //width: 500,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
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
                                      },
                                      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                                        new Factory<OneSequenceGestureRecognizer>(() => new EagerGestureRecognizer(),),
                                      ].toSet()
                                  ),
                                ),
                              ),
                            )
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
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration( border: Border( top: BorderSide( color: Color(0xffeca572),width: 5  ), ), ),
        child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/menuhome.png",fit: BoxFit.contain,
                ),
                label: '',
                //backgroundColor: Colors.green
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/menuvets.png",fit: BoxFit.contain,
                ),
                label: '',
                //backgroundColor: Colors.yellow
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/menusearch.png",fit: BoxFit.contain,
                ),
                label: '',
                //backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/menupets.png",fit: BoxFit.contain,
                ),
                label: '',
                //backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/menubag.png",fit: BoxFit.contain,
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
            unselectedLabelStyle: TextStyle(fontSize: 0)
        ),
      ),
    );
  }
}

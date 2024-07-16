import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class resultgrid extends StatefulWidget {
  const resultgrid({super.key});

  @override
  State<resultgrid> createState() => _resultgridState();
}

class _resultgridState extends State<resultgrid> {
  int _selectedIndex = 0;
  TextEditingController searchController = TextEditingController();
  double _currentValue = 0;
  bool isButtonClicked = false;
  int isGenderClicked = 0;
  @override
  void initState() {
// TODO: implement initState

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffFCF9F2),
        appBar: AppBar(
          leadingWidth: 50,
          backgroundColor: const Color(0xffFCF9F2),
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
          shape: const Border(
              bottom: BorderSide(color: Color(0xff019b9e), width: 4)),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                        padding: const EdgeInsets.all(0),
//width: 100,
//height: 50,
                        decoration: const BoxDecoration(
// color: Colors.red,
//shape: BoxShape.rectangle,
//borderRadius: BorderRadius.circular(30.0),
                            ),
                        child: SizedBox(
                          height: 35,
                          child: TextFormField(
                            controller: searchController,
                            obscureText: false,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: Color(0xffb6b6b6),
                            ),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                //border: InputBorder.none,
                                //enabledBorder: InputBorder.none,

                                hintText: 'Search',
                                hintStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  color: Color(0xffb6b6b6),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xffffffff), width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xffffffff), width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xffffffff), width: 1),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: new BorderSide()),
                                suffixIcon: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly, // added line
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 25,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          setState(() {
                                            searchController.text = '';
                                          });
                                        },
                                        icon: const Icon(Icons.gps_fixed,
                                            color: Color(0xffb6b6b6), size: 20),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          setState(() {
                                            isButtonClicked = !isButtonClicked;
                                          });
                                        },
                                        icon: const Icon(Icons.filter_alt,
                                            color: Color(0xffb6b6b6), size: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: SizedBox(
                                        height: 30,
                                        child: TextButton(
                                          onPressed: () {
                                            // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>MyApp()));
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xff019b9e),
                                            padding: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                          ),
                                          child: const Center(
                                              child: Text(
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
                          ),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 900),
                    curve: Curves.easeInOut,
                    height: isButtonClicked ? 350 : 0,
                    width: double.infinity,
                    color: const Color(0xff019b9e),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Filter",
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                    height: 30,
                                    child: TextField(
                                      controller: TextEditingController(),
                                      obscureText: false,
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff019b9e),
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10.0, vertical: 0),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xff019b9e),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xff019b9e),
                                              width: 1),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xff019b9e),
                                              width: 1),
                                        ),
                                        hintText: "Pet type e.g Cat",
                                        hintStyle: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12,
                                          color: Color(0xffb6b6b6),
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xfff2f2f3),
                                        isDense: false,
                                        // contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  child: SizedBox(
                                    height: 30,
                                    child: TextField(
                                      controller: TextEditingController(),
                                      obscureText: false,
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10.0, vertical: 0),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xff019b9e),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xff019b9e),
                                              width: 1),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xff019b9e),
                                              width: 1),
                                        ),
                                        hintText: "Breed e.g Short hair",
                                        hintStyle: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12,
                                          color: Color(0xffb6b6b6),
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xfff2f2f3),
                                        isDense: false,
                                        //contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isGenderClicked = 1;
                                    });
                                  },
                                  color: isGenderClicked == 1
                                      ? Color(0xff006d68)
                                      : Color(0xffffffff),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                        color: Color(0xff808080), width: 0),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  textColor: isGenderClicked == 1
                                      ? Color(0xffffffff)
                                      : Color(0xff000000),
                                  height: 30,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 8, 0),
                                        child: Text(
                                          "Male",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                      if (isGenderClicked == 1) ...[
                                        Icon(
                                          Icons.check,
                                          color: Color(0xffffffe8a473),
                                        ),
                                      ]
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isGenderClicked = 2;
                                    });
                                  },
                                  color: isGenderClicked == 2
                                      ? Color(0xff006d68)
                                      : Color(0xffffffff),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                        color: Color(0xff808080), width: 0),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  textColor: isGenderClicked == 2
                                      ? Color(0xffffffff)
                                      : Color(0xff000000),
                                  height: 30,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 8, 0),
                                        child: Text(
                                          "Female",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                      if (isGenderClicked == 2) ...[
                                        Icon(
                                          Icons.check,
                                          color: Color(0xffffffe8a473),
                                        ),
                                      ]
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isGenderClicked = 3;
                                    });
                                  },
                                  color: isGenderClicked == 3
                                      ? Color(0xff006d68)
                                      : Color(0xffffffff),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                        color: Color(0xff808080), width: 0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 5),
                                  textColor: isGenderClicked == 3
                                      ? Color(0xffffffff)
                                      : Color(0xff000000),
                                  height: 30,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 8, 0),
                                        child: Text(
                                          "Collar",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                      if (isGenderClicked == 3) ...[
                                        Icon(
                                          Icons.check,
                                          color: Color(0xffffffe8a473),
                                        ),
                                      ]
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                    height: 30,
                                    child: TextField(
                                      controller: TextEditingController(),
                                      obscureText: false,
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10.0, vertical: 0),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xff019b9e),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xff019b9e),
                                              width: 1),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xff019b9e),
                                              width: 1),
                                        ),
                                        hintText:
                                            "Enter post code or street name",
                                        hintStyle: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12,
                                          color: Color(0xffb6b6b6),
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xfff2f2f3),
                                        isDense: false,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    "Radius",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  child: Text(
                                    _currentValue.toInt().toString() + ' Miles',
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color: Color(0xffffffff),
                                    ),
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
                              Expanded(
                                flex: 1,
                                child: Slider(
                                  onChanged: (value) {
                                    setState(() {
                                      _currentValue = value;
                                    });
                                  },
                                  value: _currentValue,
                                  min: 0,
                                  max: 10,
                                  //divisions: 3,
                                  //label: _currentValue.toString(),
                                  activeColor: const Color(0xffffffff),
                                  thumbColor: Color(0xffffe8a473),

                                  inactiveColor: const Color(0xff9e9e9e),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: MaterialButton(
                                    onPressed: () {},
                                    color: const Color(0xff006d68),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: const BorderSide(
                                          color: Color(0xff808080), width: 0),
                                    ),
                                    padding: const EdgeInsets.all(0),
                                    child: const Text(
                                      "Show results",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    textColor: const Color(0xffffffff),
                                    height: 40,
                                    minWidth: 140,
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
              ),
              Container(
                color: Colors.white,
                child: const TabBar(
                    labelColor: Color(0xff019b9e),
                    unselectedLabelColor: Color(0xff878686),
                    indicatorColor: Colors.white,
                    dividerColor: Colors.white,
                    tabs: [
                      Tab(
                        child: Text(
                          'Missing',
                          style: TextStyle(
                              fontFamily: 'SegoeUI',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Tab(
                        text: 'Found',
                      ),
                      Tab(
                        text: 'Report',
                      )
                    ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                      child: Container(
                        color: Colors.white,
                        child: GridView(
                          padding: const EdgeInsets.all(5),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const ClampingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 0.58,
                          ),
                          children: [
                            Card(
                              margin: const EdgeInsets.all(4),
                              color: const Color(0xffFCF9F2),
                              shadowColor: const Color(0xff000000),
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ///***If you have exported images you must have to copy those images in assets/images directory.
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image(
                                        image: const AssetImage(
                                            "assets/images/cat.jpg"),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          "Meow",
                                                          textAlign:
                                                              TextAlign.start,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'SegoeUI',
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 3, 3, 0),
                                                          child:

                                                              ///***If you have exported images you must have to copy those images in assets/images directory.
                                                              Image(
                                                            image: AssetImage(
                                                                "assets/images/locationpin.png"),
                                                            width: 10,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 3, 0, 0),
                                                          child: Text(
                                                            "Tooting, London",
                                                            textAlign:
                                                                TextAlign.start,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'SegoeUI',
                                                              color: Color(
                                                                  0xff626060),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ///***If you have exported images you must have to copy those images in assets/images directory.
                                                    Image(
                                                      image: AssetImage(
                                                          "assets/images/qricon.png"),
                                                      width: 20,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 5, 0, 0),
                                                          child: Text(
                                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                                            textAlign:
                                                                TextAlign.start,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            maxLines: 4,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'SegoeUI',
                                                              color: Color(
                                                                  0xff878686),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  const Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "10/02/23 10:20AM",
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 9,
                                                        fontFamily: 'SegoeUI',
                                                        color:
                                                            Color(0xffb6b6b6),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    margin:
                                                        const EdgeInsets.all(0),
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    width: 52,
                                                    height: 30,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                                        GestureDetector(
                                              onTap: () {

                                  showModalBottomSheet<void>(

                                                              isScrollControlled:
                                                                  true,

                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {



                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.45,
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: <Widget>[
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.all(16),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                                                                                  padding: EdgeInsets.all(12),
                                                                                  width: MediaQuery.of(context).size.width,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xffffffff),
                                                                                    shape: BoxShape.rectangle,
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        "Post your comments",
                                                                                        textAlign: TextAlign.start,
                                                                                        overflow: TextOverflow.clip,
                                                                                        style: TextStyle(
                                                                                          fontWeight: FontWeight.w400,
                                                                                          fontStyle: FontStyle.normal,
                                                                                          fontSize: 14,
                                                                                          color: Color(0xff4b4b4b),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                                                                                        child: TextField(
                                                                                          controller: TextEditingController(text: ""),
                                                                                          obscureText: false,
                                                                                          textAlign: TextAlign.start,
                                                                                          maxLines: 5,
                                                                                          style: TextStyle(
                                                                                            fontWeight: FontWeight.w400,
                                                                                            fontStyle: FontStyle.normal,
                                                                                            fontSize: 14,
                                                                                            color: Color(0xff000000),
                                                                                          ),
                                                                                          decoration: InputDecoration(
                                                                                            disabledBorder: OutlineInputBorder(
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                              borderSide: BorderSide(color: Color(0x00000000), width: 1),
                                                                                            ),
                                                                                            focusedBorder: OutlineInputBorder(
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                              borderSide: BorderSide(color: Color(0x00000000), width: 1),
                                                                                            ),
                                                                                            enabledBorder: OutlineInputBorder(
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                              borderSide: BorderSide(color: Color(0x00000000), width: 1),
                                                                                            ),
                                                                                            filled: true,
                                                                                            fillColor: Color(0xfff2f2f3),
                                                                                            isDense: false,
                                                                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                                                                                  child: MaterialButton(
                                                                                    onPressed: () {},
                                                                                    color: Color(0xff019b9e),
                                                                                    elevation: 0,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    padding: EdgeInsets.all(16),
                                                                                    child: Text(
                                                                                      "Submit",
                                                                                      style: TextStyle(
                                                                                        fontSize: 14,
                                                                                        fontWeight: FontWeight.w400,
                                                                                        fontStyle: FontStyle.normal,
                                                                                      ),
                                                                                    ),
                                                                                    textColor: Color(0xffffffff),
                                                                                    height: 50,
                                                                                    minWidth: MediaQuery.of(context).size.width,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Image(
                                                            image: AssetImage(
                                                                "assets/images/messageicon.png"),
                                                            width: 22,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),

                                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                                        GestureDetector(
                                                          behavior:
                                                              HitTestBehavior
                                                                  .opaque,
                                                          onTap: () async {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    const SnackBar(
                                                              content:
                                                                  Text('Tap'),
                                                            ));

                                                            var urlImage =
                                                                'https://www.fxftraders.com/lpimages/cat.jpg';
                                                            final url =
                                                                Uri.parse(
                                                                    urlImage);
                                                            final response =
                                                                await http
                                                                    .get(url);
                                                            final bytes =
                                                                response
                                                                    .bodyBytes;

                                                            final temp =
                                                                await getTemporaryDirectory();
                                                            final path =
                                                                '${temp.path}/image.jpg';
                                                            File(path)
                                                                .writeAsBytesSync(
                                                                    bytes);
                                                            await Share
                                                                .shareXFiles([
                                                              XFile(path)
                                                            ], text: 'Loovpets');
                                                          },
                                                          child: Image(
                                                            image: AssetImage(
                                                                "assets/images/shareicon.png"),
                                                            width: 22,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
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
                              ),
                            ),
                            Card(
                              margin: const EdgeInsets.all(4),
                              color: const Color(0xffFCF9F2),
                              shadowColor: const Color(0xff000000),
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ///***If you have exported images you must have to copy those images in assets/images directory.
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image(
                                        image: const AssetImage(
                                            "assets/images/cat2.jpg"),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          "Bailey",
                                                          textAlign:
                                                              TextAlign.start,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'SegoeUI',
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 3, 3, 0),
                                                          child:

                                                              ///***If you have exported images you must have to copy those images in assets/images directory.
                                                              Image(
                                                            image: AssetImage(
                                                                "assets/images/locationpin.png"),
                                                            width: 10,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 3, 0, 0),
                                                          child: Text(
                                                            "Mitcham, London",
                                                            textAlign:
                                                                TextAlign.start,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'SegoeUI',
                                                              color: Color(
                                                                  0xff626060),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ///***If you have exported images you must have to copy those images in assets/images directory.
                                                    Image(
                                                      image: AssetImage(
                                                          "assets/images/qricon.png"),
                                                      width: 20,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 5, 0, 0),
                                                          child: Text(
                                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                                            textAlign:
                                                                TextAlign.start,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            maxLines: 4,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'SegoeUI',
                                                              color: Color(
                                                                  0xff878686),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  const Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "10/02/23 05:10AM",
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 9,
                                                        fontFamily: 'SegoeUI',
                                                        color:
                                                            Color(0xffb6b6b6),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    margin:
                                                        const EdgeInsets.all(0),
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    width: 52,
                                                    height: 30,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                                        Image(
                                                          image: AssetImage(
                                                              "assets/images/messageicon.png"),
                                                          width: 22,
                                                          fit: BoxFit.cover,
                                                        ),

                                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                                        GestureDetector(
                                                          onTap: () async {
                                                            print('Hello');

                                                            var urlImage =
                                                                'https://www.fxftraders.com/lpimages/cat2.jpg';
                                                            final url =
                                                                Uri.parse(
                                                                    urlImage);
                                                            final response =
                                                                await http
                                                                    .get(url);
                                                            final bytes =
                                                                response
                                                                    .bodyBytes;

                                                            final temp =
                                                                await getTemporaryDirectory();
                                                            final path =
                                                                '${temp.path}/image.jpg';
                                                            File(path)
                                                                .writeAsBytesSync(
                                                                    bytes);
                                                            await Share
                                                                .shareXFiles([
                                                              XFile(path)
                                                            ], text: 'Loovpets');
                                                          },
                                                          child: Image(
                                                            image: AssetImage(
                                                                "assets/images/shareicon.png"),
                                                            width: 22,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
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
                              ),
                            ),
                            Card(
                              margin: const EdgeInsets.all(4),
                              color: const Color(0xffFCF9F2),
                              shadowColor: const Color(0xff000000),
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ///***If you have exported images you must have to copy those images in assets/images directory.
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image(
                                        image: const AssetImage(
                                            "assets/images/dog1.jpg"),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          "Cooper",
                                                          textAlign:
                                                              TextAlign.start,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'SegoeUI',
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 3, 3, 0),
                                                          child:

                                                              ///***If you have exported images you must have to copy those images in assets/images directory.
                                                              Image(
                                                            image: AssetImage(
                                                                "assets/images/locationpin.png"),
                                                            width: 10,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 3, 0, 0),
                                                          child: Text(
                                                            "Purely, London",
                                                            textAlign:
                                                                TextAlign.start,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'SegoeUI',
                                                              color: Color(
                                                                  0xff626060),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ///***If you have exported images you must have to copy those images in assets/images directory.
                                                    Image(
                                                      image: AssetImage(
                                                          "assets/images/qricon.png"),
                                                      width: 20,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 5, 0, 0),
                                                          child: Text(
                                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                                            textAlign:
                                                                TextAlign.start,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            maxLines: 4,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'SegoeUI',
                                                              color: Color(
                                                                  0xff878686),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  const Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "10/02/23 05:10AM",
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 9,
                                                        fontFamily: 'SegoeUI',
                                                        color:
                                                            Color(0xffb6b6b6),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    margin:
                                                        const EdgeInsets.all(0),
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    width: 52,
                                                    height: 30,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                                        Image(
                                                          image: AssetImage(
                                                              "assets/images/messageicon.png"),
                                                          width: 22,
                                                          fit: BoxFit.cover,
                                                        ),

                                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                                        GestureDetector(
                                                          onTap: () async {
                                                            print('Hello');

                                                            var urlImage =
                                                                'https://www.fxftraders.com/lpimages/dog1.jpg';
                                                            final url =
                                                                Uri.parse(
                                                                    urlImage);
                                                            final response =
                                                                await http
                                                                    .get(url);
                                                            final bytes =
                                                                response
                                                                    .bodyBytes;

                                                            final temp =
                                                                await getTemporaryDirectory();
                                                            final path =
                                                                '${temp.path}/image.jpg';
                                                            File(path)
                                                                .writeAsBytesSync(
                                                                    bytes);
                                                            await Share
                                                                .shareXFiles([
                                                              XFile(path)
                                                            ], text: 'Loovpets');
                                                          },
                                                          child: Image(
                                                            image: AssetImage(
                                                                "assets/images/shareicon.png"),
                                                            width: 22,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
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
                              ),
                            ),
                            Card(
                              margin: const EdgeInsets.all(4),
                              color: const Color(0xffFCF9F2),
                              shadowColor: const Color(0xff000000),
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ///***If you have exported images you must have to copy those images in assets/images directory.
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image(
                                        image: const AssetImage(
                                            "assets/images/dog2.jpg"),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          "Thor",
                                                          textAlign:
                                                              TextAlign.start,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'SegoeUI',
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 3, 3, 0),
                                                          child:

                                                              ///***If you have exported images you must have to copy those images in assets/images directory.
                                                              Image(
                                                            image: AssetImage(
                                                                "assets/images/locationpin.png"),
                                                            width: 10,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 3, 0, 0),
                                                          child: Text(
                                                            "Chiswick, London",
                                                            textAlign:
                                                                TextAlign.start,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'SegoeUI',
                                                              color: Color(
                                                                  0xff626060),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ///***If you have exported images you must have to copy those images in assets/images directory.
                                                    Image(
                                                      image: AssetImage(
                                                          "assets/images/qricon.png"),
                                                      width: 20,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 5, 0, 0),
                                                          child: Text(
                                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                                            textAlign:
                                                                TextAlign.start,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            maxLines: 4,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'SegoeUI',
                                                              color: Color(
                                                                  0xff878686),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  const Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "10/02/23 05:10AM",
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 9,
                                                        fontFamily: 'SegoeUI',
                                                        color:
                                                            Color(0xffb6b6b6),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    margin:
                                                        const EdgeInsets.all(0),
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    width: 52,
                                                    height: 30,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                                        Image(
                                                          image: AssetImage(
                                                              "assets/images/messageicon.png"),
                                                          width: 22,
                                                          fit: BoxFit.cover,
                                                        ),

                                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                                        GestureDetector(
                                                          onTap: () async {
                                                            print('Hello');

                                                            var urlImage =
                                                                'https://www.fxftraders.com/lpimages/dog2.jpg';
                                                            final url =
                                                                Uri.parse(
                                                                    urlImage);
                                                            final response =
                                                                await http
                                                                    .get(url);
                                                            final bytes =
                                                                response
                                                                    .bodyBytes;

                                                            final temp =
                                                                await getTemporaryDirectory();
                                                            final path =
                                                                '${temp.path}/image.jpg';
                                                            File(path)
                                                                .writeAsBytesSync(
                                                                    bytes);
                                                            await Share
                                                                .shareXFiles([
                                                              XFile(path)
                                                            ], text: 'Loovpets');
                                                          },
                                                          child: Image(
                                                            image: AssetImage(
                                                                "assets/images/shareicon.png"),
                                                            width: 25,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

//Tab2
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                      child: Container(
                        color: Colors.white,
                        child: GridView(
                          padding: const EdgeInsets.all(5),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const ClampingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 0.58,
                          ),
                          children: [
                            Card(
                              margin: const EdgeInsets.all(4),
                              color: const Color(0xffFCF9F2),
                              shadowColor: const Color(0xff000000),
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ///***If you have exported images you must have to copy those images in assets/images directory.
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image(
                                        image: const AssetImage(
                                            "assets/images/cat3.jpg"),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          "Meow",
                                                          textAlign:
                                                              TextAlign.start,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'SegoeUI',
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 3, 3, 0),
                                                          child:

                                                              ///***If you have exported images you must have to copy those images in assets/images directory.
                                                              Image(
                                                            image: AssetImage(
                                                                "assets/images/locationpin.png"),
                                                            width: 10,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 3, 0, 0),
                                                          child: Text(
                                                            "Tooting, London",
                                                            textAlign:
                                                                TextAlign.start,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'SegoeUI',
                                                              color: Color(
                                                                  0xff626060),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ///***If you have exported images you must have to copy those images in assets/images directory.
                                                    Image(
                                                      image: AssetImage(
                                                          "assets/images/qricon.png"),
                                                      width: 20,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 5, 0, 0),
                                                          child: Text(
                                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                                            textAlign:
                                                                TextAlign.start,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            maxLines: 4,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'SegoeUI',
                                                              color: Color(
                                                                  0xff878686),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  const Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "10/02/23 05:10AM",
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 9,
                                                        fontFamily: 'SegoeUI',
                                                        color:
                                                            Color(0xffb6b6b6),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    margin:
                                                        const EdgeInsets.all(0),
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    width: 40,
                                                    height: 20,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                                        Image(
                                                          image: AssetImage(
                                                              "assets/images/messageicon.png"),
                                                          width: 18,
                                                          fit: BoxFit.cover,
                                                        ),

                                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                                        GestureDetector(
                                                          onTap: () async {
                                                            print('Hello');

                                                            var urlImage =
                                                                'https://www.fxftraders.com/lpimages/cat3.jpg';
                                                            final url =
                                                                Uri.parse(
                                                                    urlImage);
                                                            final response =
                                                                await http
                                                                    .get(url);
                                                            final bytes =
                                                                response
                                                                    .bodyBytes;

                                                            final temp =
                                                                await getTemporaryDirectory();
                                                            final path =
                                                                '${temp.path}/image.jpg';
                                                            File(path)
                                                                .writeAsBytesSync(
                                                                    bytes);
                                                            await Share
                                                                .shareXFiles([
                                                              XFile(path)
                                                            ], text: 'Loovpets');
                                                          },
                                                          child: Image(
                                                            image: AssetImage(
                                                                "assets/images/shareicon.png"),
                                                            width: 18,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
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
                              ),
                            ),
                            Card(
                              margin: const EdgeInsets.all(4),
                              color: const Color(0xffFCF9F2),
                              shadowColor: const Color(0xff000000),
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ///***If you have exported images you must have to copy those images in assets/images directory.
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image(
                                        image: const AssetImage(
                                            "assets/images/cat4.jpg"),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          "Bailey",
                                                          textAlign:
                                                              TextAlign.start,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'SegoeUI',
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 3, 3, 0),
                                                          child:

                                                              ///***If you have exported images you must have to copy those images in assets/images directory.
                                                              Image(
                                                            image: AssetImage(
                                                                "assets/images/locationpin.png"),
                                                            width: 10,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 3, 0, 0),
                                                          child: Text(
                                                            "Mitcham, London",
                                                            textAlign:
                                                                TextAlign.start,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'SegoeUI',
                                                              color: Color(
                                                                  0xff626060),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ///***If you have exported images you must have to copy those images in assets/images directory.
                                                    Image(
                                                      image: AssetImage(
                                                          "assets/images/qricon.png"),
                                                      width: 20,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 5, 0, 0),
                                                          child: Text(
                                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                                            textAlign:
                                                                TextAlign.start,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            maxLines: 4,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'SegoeUI',
                                                              color: Color(
                                                                  0xff878686),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  const Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "10/02/23 05:10AM",
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 9,
                                                        fontFamily: 'SegoeUI',
                                                        color:
                                                            Color(0xffb6b6b6),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    margin:
                                                        const EdgeInsets.all(0),
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    width: 40,
                                                    height: 20,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                                        Image(
                                                          image: AssetImage(
                                                              "assets/images/messageicon.png"),
                                                          width: 18,
                                                          fit: BoxFit.cover,
                                                        ),

                                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                                        GestureDetector(
                                                          onTap: () async {
                                                            print('Hello');

                                                            var urlImage =
                                                                'https://www.fxftraders.com/lpimages/cat4.jpg';
                                                            final url =
                                                                Uri.parse(
                                                                    urlImage);
                                                            final response =
                                                                await http
                                                                    .get(url);
                                                            final bytes =
                                                                response
                                                                    .bodyBytes;

                                                            final temp =
                                                                await getTemporaryDirectory();
                                                            final path =
                                                                '${temp.path}/image.jpg';
                                                            File(path)
                                                                .writeAsBytesSync(
                                                                    bytes);
                                                            await Share
                                                                .shareXFiles([
                                                              XFile(path)
                                                            ], text: 'Loovpets');
                                                          },
                                                          child: Image(
                                                            image: AssetImage(
                                                                "assets/images/shareicon.png"),
                                                            width: 18,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
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
                              ),
                            ),
                            Card(
                              margin: const EdgeInsets.all(4),
                              color: const Color(0xffFCF9F2),
                              shadowColor: const Color(0xff000000),
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ///***If you have exported images you must have to copy those images in assets/images directory.
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image(
                                        image: const AssetImage(
                                            "assets/images/dog3.jpg"),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          "Cooper",
                                                          textAlign:
                                                              TextAlign.start,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'SegoeUI',
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 3, 3, 0),
                                                          child:

                                                              ///***If you have exported images you must have to copy those images in assets/images directory.
                                                              Image(
                                                            image: AssetImage(
                                                                "assets/images/locationpin.png"),
                                                            width: 10,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 3, 0, 0),
                                                          child: Text(
                                                            "Purely, London",
                                                            textAlign:
                                                                TextAlign.start,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'SegoeUI',
                                                              color: Color(
                                                                  0xff626060),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ///***If you have exported images you must have to copy those images in assets/images directory.
                                                    Image(
                                                      image: AssetImage(
                                                          "assets/images/qricon.png"),
                                                      width: 20,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 5, 0, 0),
                                                          child: Text(
                                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                                            textAlign:
                                                                TextAlign.start,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            maxLines: 4,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'SegoeUI',
                                                              color: Color(
                                                                  0xff878686),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  const Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "10/02/23 05:10AM",
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 9,
                                                        fontFamily: 'SegoeUI',
                                                        color:
                                                            Color(0xffb6b6b6),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    margin:
                                                        const EdgeInsets.all(0),
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    width: 40,
                                                    height: 20,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                                        Image(
                                                          image: AssetImage(
                                                              "assets/images/messageicon.png"),
                                                          width: 18,
                                                          fit: BoxFit.cover,
                                                        ),

                                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                                        GestureDetector(
                                                          onTap: () async {
                                                            print('Hello');

                                                            var urlImage =
                                                                'https://www.fxftraders.com/lpimages/dog3.jpg';
                                                            final url =
                                                                Uri.parse(
                                                                    urlImage);
                                                            final response =
                                                                await http
                                                                    .get(url);
                                                            final bytes =
                                                                response
                                                                    .bodyBytes;

                                                            final temp =
                                                                await getTemporaryDirectory();
                                                            final path =
                                                                '${temp.path}/image.jpg';
                                                            File(path)
                                                                .writeAsBytesSync(
                                                                    bytes);
                                                            await Share
                                                                .shareXFiles([
                                                              XFile(path)
                                                            ], text: 'Loovpets');
                                                          },
                                                          child: Image(
                                                            image: AssetImage(
                                                                "assets/images/shareicon.png"),
                                                            width: 18,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
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
                              ),
                            ),
                            Card(
                              margin: const EdgeInsets.all(4),
                              color: const Color(0xffFCF9F2),
                              shadowColor: const Color(0xff000000),
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ///***If you have exported images you must have to copy those images in assets/images directory.
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image(
                                        image: const AssetImage(
                                            "assets/images/dog4.jpg"),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          "Thor",
                                                          textAlign:
                                                              TextAlign.start,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'SegoeUI',
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 3, 3, 0),
                                                          child:

                                                              ///***If you have exported images you must have to copy those images in assets/images directory.
                                                              Image(
                                                            image: AssetImage(
                                                                "assets/images/locationpin.png"),
                                                            width: 10,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 3, 0, 0),
                                                          child: Text(
                                                            "Chiswick, London",
                                                            textAlign:
                                                                TextAlign.start,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'SegoeUI',
                                                              color: Color(
                                                                  0xff626060),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ///***If you have exported images you must have to copy those images in assets/images directory.
                                                    Image(
                                                      image: AssetImage(
                                                          "assets/images/qricon.png"),
                                                      width: 20,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 5, 0, 0),
                                                          child: Text(
                                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                                            textAlign:
                                                                TextAlign.start,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            maxLines: 4,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'SegoeUI',
                                                              color: Color(
                                                                  0xff878686),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  const Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "10/02/23 05:10AM",
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 9,
                                                        fontFamily: 'SegoeUI',
                                                        color:
                                                            Color(0xffb6b6b6),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    margin:
                                                        const EdgeInsets.all(0),
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    width: 40,
                                                    height: 20,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                                        Image(
                                                          image: AssetImage(
                                                              "assets/images/messageicon.png"),
                                                          width: 18,
                                                          fit: BoxFit.cover,
                                                        ),

                                                        ///***If you have exported images you must have to copy those images in assets/images directory.
                                                        GestureDetector(
                                                          onTap: () async {
                                                            print('Hello');

                                                            var urlImage =
                                                                'https://www.fxftraders.com/lpimages/dog4.jpg';
                                                            final url =
                                                                Uri.parse(
                                                                    urlImage);
                                                            final response =
                                                                await http
                                                                    .get(url);
                                                            final bytes =
                                                                response
                                                                    .bodyBytes;

                                                            final temp =
                                                                await getTemporaryDirectory();
                                                            final path =
                                                                '${temp.path}/image.jpg';
                                                            File(path)
                                                                .writeAsBytesSync(
                                                                    bytes);
                                                            await Share
                                                                .shareXFiles([
                                                              XFile(path)
                                                            ], text: 'Loovpets');
                                                          },
                                                          child: Image(
                                                            image: AssetImage(
                                                                "assets/images/shareicon.png"),
                                                            width: 18,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: const Text('Tab3'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff019b9e),
          child: const Icon(Icons.add),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          foregroundColor: Colors.white,
          onPressed: () {},
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
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
              backgroundColor: const Color(0xff019b9e),
              selectedLabelStyle: const TextStyle(fontSize: 0),
              unselectedLabelStyle: const TextStyle(fontSize: 0)),
        ),
      ),
    );
  }
}

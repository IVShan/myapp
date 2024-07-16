import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'adoption_profile.dart';


class adoptiondescription extends StatefulWidget {
  const adoptiondescription({super.key});

  @override
  State<adoptiondescription> createState() => _adoptiondescriptionState();
}

class _adoptiondescriptionState extends State<adoptiondescription> {
  int _selectedIndex = 0;
  String imgname = 'dogmain.jpg';
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
                              
          
                                ///***If you have exported images you must have to copy those images in assets/images directory.
                               
          
                                ///***If you have exported images you must have to copy those images in assets/images directory.
                                InkWell(
                                  onTap: () async{
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
                                    image: AssetImage("assets/images/shareicon.png"),
                                    width: 20,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                 Container(
                                
  width: 60,
  height: 20,
  alignment: Alignment.center,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),color: Color(0xffFB513A),
  ),
  child: const Text('£250',style:TextStyle(color: Colors.white)),
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
                      Stack(
                        children: [
                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          InkWell(
                            onTap: (){Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          adoptionprofile()));}, // Image tapped
                              splashColor: Colors.white10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                image: AssetImage("assets/images/${imgname}"),
                                width: MediaQuery.of(context).size.width * 0.92,
                                fit: BoxFit.cover,
                              ),
                              
                            ),
                          ),
                          Positioned.fill(
                                        child: Align(
                                      alignment: Alignment.topRight,
                                      child:IconButton(
            iconSize: 100,
            icon: const Icon(
              Icons.favorite,size: 20,color: Colors.red,
            ),
            // the method which is called
            // when button is pressed
            onPressed: () {
              
            },
          ),
                                    )),
                                    Positioned.fill(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child:Container(
                                                                      
                                                                                width: 70,
                                                                                height: 25,
                                                                                alignment: Alignment.center,
                                                                                decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),color: Color(0xff7f8c8d).withOpacity(0.8),
                                                                                ),
                                                                                child: Text.rich(
    TextSpan(
        children: <InlineSpan>[
            
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 3, 5, 0),
                  child: Icon(Icons.remove_red_eye, color: Colors.white, size: 15,),
                )),
                
            TextSpan(text: '236'),
        ],
      ),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontFamily:'SegoeUI',
      ),
),
                                                                              ),
                                                                              ),
                                        ))
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.zero,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(16),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  ///***If you have exported images you must have to copy those images in assets/images directory.
                  GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(
                            "assets/images/dogt1.jpg"),
                        height: 30,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () {
                     setState(() {
                              imgname = 'dogt1.jpg';
                            });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child:

                        ///***If you have exported images you must have to copy those images in assets/images directory.
                        GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                                                  image: AssetImage(
                            "assets/images/dogt2.jpg"),
                                                  height: 60,
                                                  width: 70,
                                                  fit: BoxFit.cover,
                                                ),
                          ),
                          onTap: () {
                     setState(() {
                              imgname = 'dogt2.jpg';
                            });
                    },
                        ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child:

                        ///***If you have exported images you must have to copy those images in assets/images directory.
                        GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                                                  image: AssetImage(
                            "assets/images/dogt3.jpg"),
                                                  height: 60,
                                                  width: 70,
                                                  fit: BoxFit.cover,
                                                ),
                          ),
                          onTap: () {
                     setState(() {
                              imgname = 'dogt3.jpg';
                            });
                    },
                        ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child:

                        ///***If you have exported images you must have to copy those images in assets/images directory.
                        GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                                                  image: AssetImage(
                            "assets/images/dogt4.jpg"),
                                                  height: 70,
                                                  width: 70,
                                                  fit: BoxFit.cover,
                                                ),
                          ),
                          onTap: () {
                     setState(() {
                              imgname = 'dogt4.jpg';
                            });
                    },
                        ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child:

                        ///***If you have exported images you must have to copy those images in assets/images directory.
                        GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                                                 image: AssetImage(
                            "assets/images/dogmain.jpg"),
                                                  height: 70,
                                                  width: 70,
                                                  fit: BoxFit.cover,
                                                ),
                          ),
                          onTap: () {
                     setState(() {
                              imgname = 'dogmain.jpg';
                            });
                    },
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
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
                            child: RichText(
          text: TextSpan(
            
            children: <InlineSpan>[
               
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Little Cooper needs a looking home! ",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            fontFamily:'SegoeUI',
                            color: Colors.transparent,
                            decoration: TextDecoration.underline,decorationColor: Color(0xff7f8c8d),
                            shadows: [
                Shadow(
                    color: Color(0xff7f8c8d),
                    offset: Offset(0, -5))
              ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Icon(Icons.info_rounded, color: Color(0xff7f8c8d), size: 15,),
                      )
                      ],
                    )
                                 ],
                                ),
                )),
              
              TextSpan(
                text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s\n\n"
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s\n\n"
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s\n\n"
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                
                style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 13,
                                fontFamily:'SegoeUI',
                                color: Color(0xff626060),
                              ),
                //recognizer: _longPressRecognizer,
              ),
              
            ],
          ),
        )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                
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
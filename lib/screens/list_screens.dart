import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'create_account.dart';
import 'sign_in.dart';
import 'map_screen_search.dart';
import 'result_grid.dart';
import 'details_screen.dart';
import 'comments_screen.dart';
import 'private_chat.dart';
import 'adoption_list.dart';
import 'adoption_description.dart';
import 'adoption_profile.dart';
import 'vet_list.dart';
import 'vet_home.dart';
import 'video_page.dart';
class listscreens extends StatefulWidget {
  const listscreens({super.key});

  @override
  State<listscreens> createState() => _listscreensState();
}

class _listscreensState extends State<listscreens> {
  void _onItemTapped1(int index) {
    Future.delayed(Duration(milliseconds: 300), () {
      if(index==1){
          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => login()));
      }else if(index==2){
          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => createaccount()));
      }else if(index==3){
          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => signin()));
      }else if(index==4){
          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => mapscreen()));
      }else if(index==5){
          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => resultgrid()));
      }else if(index==6){
          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => detailscreen()));
      }else if(index==7){
          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => commentsscreen()));
      }else if(index==8){
          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => privatechat()));
      }else if(index==9){
          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => adoptionlist()));
      }else if(index==10){
          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => adoptiondescription()));
      }else if(index==11){
          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => adoptionprofile()));
      }else if(index==12){
          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => vetlist()));
      }else if(index==13){
          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => vethome()));
      }else if(index==14){
          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => videopage()));
      }
    
});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff019b9e),
      body: Center(
        child: SingleChildScrollView(
          //physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment(0.1, 0.1),
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(20, 35, 20, 20),
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Color(0xff019b9e), width: 1),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ///***If you have exported images you must have to copy those images in assets/images directory.
                              Image(
                                image:
                                    AssetImage("assets/images/logocolor.png"),
                                width: MediaQuery.of(context).size.width * 0.6,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Text(
                                  "List of Screens",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18,
                                    color: Color(0xff000000),
                                    fontFamily: 'Proximasoft',
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: ListView(
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  children: [
                                    Card(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      color: Color(0xffffffff),
                                      shadowColor: Color(0x4d939393),
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        side: BorderSide(
                                            color: Color(0x4d9e9e9e), width: 1),
                                      ),
                                      child: InkWell(
                                        //borderRadius: BorderRadius.circular(24),
                                        splashColor: Color(0xff019b9e)
                                            .withOpacity(0.5), // Splash color
                                        onTap: () {
                                          _onItemTapped1(1);
                                        },
                                        child: Ink(
                                          
                                          width: 100,
                                          height: 35,
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              "Login",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff6c6c6c),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                      color: Color(0xffffffff),
                                      shadowColor: Color(0x4d939393),
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        side: BorderSide(
                                            color: Color(0x4d9e9e9e), width: 1),
                                      ),
                                      child: InkWell(
                                        //borderRadius: BorderRadius.circular(24),
                                        splashColor: Color(0xff019b9e)
                                            .withOpacity(0.5), // Splash color
                                        onTap: () {_onItemTapped1(2);},
                                        child: Ink(
                                          width: 100,
                                          height: 35,
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              "Create account",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff6c6c6c),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                      color: Color(0xffffffff),
                                      shadowColor: Color(0x4d939393),
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        side: BorderSide(
                                            color: Color(0x4d9e9e9e), width: 1),
                                      ),
                                      child: InkWell(
                                        //borderRadius: BorderRadius.circular(24),
                                        splashColor: Color(0xff019b9e)
                                            .withOpacity(0.5), // Splash color
                                        onTap: () {_onItemTapped1(3);},
                                        child: Ink(
                                          width: 100,
                                          height: 35,
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              "Login with Email",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff6c6c6c),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                      color: Color(0xffffffff),
                                      shadowColor: Color(0x4d939393),
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        side: BorderSide(
                                            color: Color(0x4d9e9e9e), width: 1),
                                      ),
                                      child: InkWell(
                                        //borderRadius: BorderRadius.circular(24),
                                        splashColor: Color(0xff019b9e)
                                            .withOpacity(0.5), // Splash color
                                        onTap: () {_onItemTapped1(4);},
                                        child: Ink(
                                          width: 100,
                                          height: 35,
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              "Search - Missing pets",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff6c6c6c),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                      color: Color(0xffffffff),
                                      shadowColor: Color(0x4d939393),
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        side: BorderSide(
                                            color: Color(0x4d9e9e9e), width: 1),
                                      ),
                                      child: InkWell(
                                        //borderRadius: BorderRadius.circular(24),
                                        splashColor: Color(0xff019b9e)
                                            .withOpacity(0.5), // Splash color
                                        onTap: () {_onItemTapped1(5);},
                                        child: Ink(
                                          width: 100,
                                          height: 35,
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              "Search results",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff6c6c6c),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                      color: Color(0xffffffff),
                                      shadowColor: Color(0x4d939393),
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        side: BorderSide(
                                            color: Color(0x4d9e9e9e), width: 1),
                                      ),
                                      child: InkWell(
                                        //borderRadius: BorderRadius.circular(24),
                                        splashColor: Color(0xff019b9e)
                                            .withOpacity(0.5), // Splash color
                                        onTap: () {_onItemTapped1(6);},
                                        child: Ink(
                                          width: 100,
                                          height: 35,
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              "Missing pets description",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff6c6c6c),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                      color: Color(0xffffffff),
                                      shadowColor: Color(0x4d939393),
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        side: BorderSide(
                                            color: Color(0x4d9e9e9e), width: 1),
                                      ),
                                      child: InkWell(
                                        //borderRadius: BorderRadius.circular(24),
                                        splashColor: Color(0xff019b9e)
                                            .withOpacity(0.5), // Splash color
                                        onTap: () {_onItemTapped1(7);},
                                        child: Ink(
                                          width: 100,
                                          height: 35,
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              "Missing pets comments",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff6c6c6c),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                      color: Color(0xffffffff),
                                      shadowColor: Color(0x4d939393),
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        side: BorderSide(
                                            color: Color(0x4d9e9e9e), width: 1),
                                      ),
                                      child: InkWell(
                                        //borderRadius: BorderRadius.circular(24),
                                        splashColor: Color(0xff019b9e)
                                            .withOpacity(0.5), // Splash color
                                        onTap: () {_onItemTapped1(8);},
                                        child: Ink(
                                          width: 100,
                                          height: 35,
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              "Private message",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff6c6c6c),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                      color: Color(0xffffffff),
                                      shadowColor: Color(0x4d939393),
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        side: BorderSide(
                                            color: Color(0x4d9e9e9e), width: 1),
                                      ),
                                      child: InkWell(
                                        //borderRadius: BorderRadius.circular(24),
                                        splashColor: Color(0xff019b9e)
                                            .withOpacity(0.5), // Splash color
                                        onTap: () {_onItemTapped1(9);},
                                        child: Ink(
                                          width: 100,
                                          height: 35,
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              "Pets adoption list",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff6c6c6c),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                      color: Color(0xffffffff),
                                      shadowColor: Color(0x4d939393),
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        side: BorderSide(
                                            color: Color(0x4d9e9e9e), width: 1),
                                      ),
                                      child: InkWell(
                                        //borderRadius: BorderRadius.circular(24),
                                        splashColor: Color(0xff019b9e)
                                            .withOpacity(0.5), // Splash color
                                        onTap: () {_onItemTapped1(10);},
                                        child: Ink(
                                          width: 100,
                                          height: 35,
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              "Pets adoption description",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff6c6c6c),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                      color: Color(0xffffffff),
                                      shadowColor: Color(0x4d939393),
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        side: BorderSide(
                                            color: Color(0x4d9e9e9e), width: 1),
                                      ),
                                      child: InkWell(
                                        //borderRadius: BorderRadius.circular(24),
                                        splashColor: Color(0xff019b9e)
                                            .withOpacity(0.5), // Splash color
                                        onTap: () {_onItemTapped1(11);},
                                        child: Ink(
                                          width: 100,
                                          height: 35,
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              "Pets adoption profile",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff6c6c6c),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                      color: Color(0xffffffff),
                                      shadowColor: Color(0x4d939393),
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        side: BorderSide(
                                            color: Color(0x4d9e9e9e), width: 1),
                                      ),
                                      child: InkWell(
                                        //borderRadius: BorderRadius.circular(24),
                                        splashColor: Color(0xff019b9e)
                                            .withOpacity(0.5), // Splash color
                                        onTap: () {_onItemTapped1(12);},
                                        child: Ink(
                                          width: 100,
                                          height: 35,
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              "Vets search",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff6c6c6c),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                      color: Color(0xffffffff),
                                      shadowColor: Color(0x4d939393),
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        side: BorderSide(
                                            color: Color(0x4d9e9e9e), width: 1),
                                      ),
                                      child: InkWell(
                                        //borderRadius: BorderRadius.circular(24),
                                        splashColor: Color(0xff019b9e)
                                            .withOpacity(0.5), // Splash color
                                        onTap: () {_onItemTapped1(13);},
                                        child: Ink(
                                          width: 100,
                                          height: 35,
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              "Vets Home",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff6c6c6c),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                      color: Color(0xffffffff),
                                      shadowColor: Color(0x4d939393),
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        side: BorderSide(
                                            color: Color(0x4d9e9e9e), width: 1),
                                      ),
                                      child: InkWell(
                                        //borderRadius: BorderRadius.circular(24),
                                        splashColor: Color(0xff019b9e)
                                            .withOpacity(0.5), // Splash color
                                        onTap: () {_onItemTapped1(14);},
                                        child: Ink(
                                          width: 100,
                                          height: 35,
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              "Video page",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                color: Color(0xff6c6c6c),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

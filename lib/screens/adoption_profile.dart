import 'package:flutter/material.dart';
class adoptionprofile extends StatefulWidget {
  const adoptionprofile({super.key});

  @override
  State<adoptionprofile> createState() => _adoptionprofileState();
}
class CustomTextStyle {
  static const TextStyle textStyle = TextStyle(
    fontFamily:'SegoeUI',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 12,
    color: Color(0xff2d3436),
  );
}
class _adoptionprofileState extends State<adoptionprofile> {
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
      body: Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
          border: Border.all(color: Color(0xffffffff), width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
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
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.fromLTRB(15, 8, 8, 8),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xfffcf9f2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          border:
                              Border.all(color: Color(0xffffffff), width: 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 10),
                                        child: Text(
                                          "Other Details",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12,
                                            color: Color(0xff000000),
                                            fontFamily:'SegoeUI',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
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
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Post ID",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Location",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Breed",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Age",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Sex",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Health Checked",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Microchipped",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Vacinated",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Worm treated",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                             style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Neutered",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Pet Available Date",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "LP1645",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Tooting,London",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Cockapoo",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "5",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Male",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Yes",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Yes",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "No",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Yes",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "Yes",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: Text(
                                              "20/02/2023",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: CustomTextStyle.textStyle,
                                            ),
                                          ),
                                        ],
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
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Container(
                    height: 80,
                    width: 80,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset("assets/images/dog.png", fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "@userjay23",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color(0xff000000),
                          fontFamily:'SegoeUI',
                        ),
                      ),
                      Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.verified,
                        color: Color(0xff019b9e),
                        size: 24,
                      ),
                    ],
                  ),
                ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
                              child:
          
                              ///***If you have exported images you must have to copy those images in assets/images directory.
                              Image(
                                image: AssetImage("assets/images/locationpin.png"),
                                width: 10,
                                fit: BoxFit.cover,
                              ),
                            ),
                      Text(
                        "Las Vegas, USA",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                          color: Color(0xff000000),
                          fontFamily:'SegoeUI',
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: MaterialButton(
                        onPressed: () {},
                        color: Color(0xffe228a4),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Color(0xffffffff), width: 1),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Message",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            fontFamily:'SegoeUI',
                          ),
                        ),
                        textColor: Color(0xffffffff),
                        height: 30,
                        minWidth: 130,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: MaterialButton(
                        onPressed: () {},
                        color: Color(0xff019a9d),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Color(0xffffffff), width: 1),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: Icon(Icons.phone_in_talk_rounded, color: Colors.white,size: 16,),
                            ),
                            Text(
                              "Call",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                fontFamily:'SegoeUI',
                              ),
                            ),
                          ],
                        ),
                        textColor: Color(0xffffffff),
                        height: 30,
                        minWidth: 130,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
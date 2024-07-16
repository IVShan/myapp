import 'package:flutter/material.dart';

class signin extends StatelessWidget {
  const signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff019b9e),
      body: Center(
        child: SingleChildScrollView(
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
                                image: AssetImage("assets/images/logocolor.png"),
                                width: MediaQuery.of(context).size.width * 0.6,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Text(
                                  "Login with email",
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
                                child: TextField(
                                  controller:TextEditingController(),
                                  obscureText:false,
                                  textAlign:TextAlign.start,
                                  maxLines:1,
                                  style:TextStyle(
                                    fontWeight:FontWeight.w400,
                                    fontStyle:FontStyle.normal,
                                    fontSize:14,
                                    color:Color(0xff000000),
                                  ),
                                  decoration:InputDecoration(
                                    disabledBorder:OutlineInputBorder(
                                      borderRadius:BorderRadius.circular(8.0),
                                      borderSide:BorderSide(
                                          color:Color(0xff019b9e),
                                          width:1
                                      ),
                                    ),
                                    focusedBorder:OutlineInputBorder(
                                      borderRadius:BorderRadius.circular(8.0),
                                      borderSide:BorderSide(
                                          color:Color(0xff019b9e),
                                          width:1
                                      ),
                                    ),
                                    enabledBorder:OutlineInputBorder(
                                      borderRadius:BorderRadius.circular(8.0),
                                      borderSide:BorderSide(
                                          color:Color(0xff019b9e),
                                          width:1
                                      ),
                                    ),
                                    hintText:"Email Address",
                                    hintStyle:TextStyle(
                                      fontWeight:FontWeight.w400,
                                      fontStyle:FontStyle.normal,
                                      fontSize:14,
                                      color:Color(0xff5b5858),
                                    ),
                                    filled:true,
                                    fillColor:Color(0xffffffff),
                                    isDense:false,
                                    contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
                                    suffixIcon:Icon(Icons.mail,color:Color(0xff5b5858),size:24),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: TextField(
                                  controller:TextEditingController(),
                                  obscureText:false,
                                  textAlign:TextAlign.start,
                                  maxLines:1,
                                  style:TextStyle(
                                    fontWeight:FontWeight.w400,
                                    fontStyle:FontStyle.normal,
                                    fontSize:14,
                                    color:Color(0xff000000),
                                  ),
                                  decoration:InputDecoration(
                                    disabledBorder:OutlineInputBorder(
                                      borderRadius:BorderRadius.circular(8.0),
                                      borderSide:BorderSide(
                                          color:Color(0xff019b9e),
                                          width:1
                                      ),
                                    ),
                                    focusedBorder:OutlineInputBorder(
                                      borderRadius:BorderRadius.circular(8.0),
                                      borderSide:BorderSide(
                                          color:Color(0xff019b9e),
                                          width:1
                                      ),
                                    ),
                                    enabledBorder:OutlineInputBorder(
                                      borderRadius:BorderRadius.circular(8.0),
                                      borderSide:BorderSide(
                                          color:Color(0xff019b9e),
                                          width:1
                                      ),
                                    ),
                                    hintText:"Password",
                                    hintStyle:TextStyle(
                                      fontWeight:FontWeight.w400,
                                      fontStyle:FontStyle.normal,
                                      fontSize:14,
                                      color:Color(0xff5b5858),
                                    ),
                                    filled:true,
                                    fillColor:Color(0xffffffff),
                                    isDense:false,
                                    contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
                                    suffixIcon:Icon(Icons.visibility_off,color:Color(0xff5b5858),size:24),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Forgot Password?",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color: Color(0xff019a9d),
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: MaterialButton(splashColor: Colors.blue,
                                  onPressed: () {},
                                  color: Color(0xff019a9d),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(
                                        color: Color(0xff808080), width: 1),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,



                                    children: <Widget>[


                                      Container(alignment: Alignment.center,
                                        child: Text(
                                          "LOGIN IN",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'Proximasoft'
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  textColor: Color(0xffffffff),
                                  height: 40,
                                  minWidth: MediaQuery.of(context).size.width,
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

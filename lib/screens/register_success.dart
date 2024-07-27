import 'package:flutter/material.dart';
import 'sign_in.dart';

// ignore: must_be_immutable'
class RegisterSuccess extends StatefulWidget {
  const RegisterSuccess({super.key});

  @override
  State<RegisterSuccess> createState() => _RegisterSuccessState();
}

class _RegisterSuccessState extends State<RegisterSuccess> {
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
                              Container(
                                padding: EdgeInsets.all(0),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 9, 233, 76),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    String.fromCharCode(
                                        Icons.check_sharp.codePoint),
                                    style: TextStyle(
                                      inherit: false,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: Icons
                                          .space_dashboard_outlined.fontFamily,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Text(
                                  "Registration Completed!",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18,
                                    color: Color(0xff000000),
                                    fontFamily: 'Proximasoft',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Text(
                                  "Welcome! Your registration has been successfully completed.activation link has been sent to your registered email. Please check your email to activate your account.",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                    fontFamily: 'Proximasoft',
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: MaterialButton(
                                  splashColor: Colors.blue,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                signin()));
                                  },
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
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "LOGIN IN",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'Proximasoft'),
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

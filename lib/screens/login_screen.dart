import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:status_alert/status_alert.dart';
import 'package:myapp/firebase_options.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'map_screen_search.dart';
import 'register_success.dart';
import 'sign_in.dart';
import 'create_account.dart';
import 'vet_home.dart';
import 'list_screens.dart';
// Suggested code may be subject to a license. Learn more: ~LicenseLog:700987515.
import '../mapwithsearch.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String did = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDeviceId();
  }

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
                                image:
                                    AssetImage("assets/images/logocolor.png"),
                                width: MediaQuery.of(context).size.width * 0.6,
                                fit: BoxFit.cover,
                              ),

                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                createaccount()));
                                  },
                                  child: new Text(
                                    "Create an account",
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
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                      child: Text(
                                        "Already have an account?",
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Proximasoft',
                                          fontSize: 14,
                                          color: Color(0xff6a6767),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Login here",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 13,
                                        fontFamily: 'Proximasoft',
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: MaterialButton(
                                  splashColor: Colors.blue,
                                  onPressed: () async {
                                    //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>mapscreen()));
                                    try {
                                      final UserCredential userCredential =
                                          await signInWithGoogle();
                                      if (context.mounted) {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3925052917.
                                        _registerdb(
                                            userCredential.user!.displayName!,
                                            userCredential.user!.photoURL ?? "",
                                            userCredential.user!.email!,
                                            userCredential.user!.uid,
                                            '2');
                                      }
                                    } catch (e) {
                                      StatusAlert.show(context,
                                          duration: const Duration(seconds: 2),
                                          title: 'User Authentication',
                                          subtitle: e.toString(),
                                          configuration:
                                              const IconConfiguration(
                                                  icon: Icons.close,
                                                  color: Colors.red),
                                          maxWidth: 360);
                                    }
                                  },
                                  color: Color(0xffde4c39),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(
                                        color: Color(0xffde4c39), width: 1),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                          width: 40,
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                              'assets/images/googleicon.png',
                                              width: 20,
                                              fit: BoxFit.cover)),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Sign in with Google",
                                          style: TextStyle(
                                              fontSize: 17,
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
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: MaterialButton(
                                  splashColor: Colors.teal,
                                  onPressed: () {
                                    //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>vethome()));
                                  },
                                  color: Color(0xff3a589e),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(
                                        color: Color(0xff3a589e), width: 1),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                          width: 40,
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                              'assets/images/fbicon.png',
                                              width: 20,
                                              fit: BoxFit.cover)),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Sign in with Facebook",
                                          style: TextStyle(
                                              fontSize: 17,
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
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: MaterialButton(
                                  splashColor: Colors.blue,
                                  onPressed: () {
                                    //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>listscreens()));
                                  },
                                  color: Color(0xff000000),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(
                                        color: Color(0xff000000), width: 1),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                          width: 40,
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                              'assets/images/msicon.png',
                                              width: 20,
                                              fit: BoxFit.cover)),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Sign in with Microsoft",
                                          style: TextStyle(
                                              fontSize: 17,
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
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: MaterialButton(
                                  splashColor: Colors.blue,
                                  onPressed: () {
                                    //signOut();

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Mapwithsearch()));
                                  },
                                  color: Color(0xffffffff),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(
                                        color: Color(0xff000000), width: 1),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                          width: 40,
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                              'assets/images/appleicon.png',
                                              width: 20,
                                              fit: BoxFit.cover)),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Sign in with Apple",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'Proximasoft'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  textColor: Color(0xff000000),
                                  height: 40,
                                  minWidth: MediaQuery.of(context).size.width,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                        width: 40,
                                        alignment: Alignment.centerRight,
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Sign in with Email",
                                          style: TextStyle(
                                              fontSize: 17,
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
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "By continuing,you agreeing to Loovpets'",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12,
                                        fontFamily: 'Proximasoft',
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Terms of use",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 11,
                                      fontFamily: 'Proximasoft',
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  Text(
                                    " and",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontFamily: 'Proximasoft',
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  Text(
                                    " Privacy Policy",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 11,
                                      fontFamily: 'Proximasoft',
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Color(0xff019a9d), width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "OUR PARTNERS",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                          fontFamily: 'Proximasoft',
                          color: Color(0xff019a9d),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          Image(
                            image: AssetImage("assets/images/partner1.png"),
                            width: 70,
                            fit: BoxFit.cover,
                          ),

                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          Image(
                            image: AssetImage("assets/images/partner2.png"),
                            width: 70,
                            fit: BoxFit.cover,
                          ),

                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          Image(
                            image: AssetImage("assets/images/partner3.png"),
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
            clientId: (DefaultFirebaseOptions.currentPlatform ==
                    DefaultFirebaseOptions.ios)
                ? DefaultFirebaseOptions.currentPlatform.iosClientId
                : DefaultFirebaseOptions.currentPlatform.androidClientId)
        .signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> _registerdb(
      String dname, String purl, String email, String uid, String pid) async {
    print(dname);
    print(purl);
    print(email);
    print(pid);
    print(uid);
    print(did);
    String apiUrl = 'https://www.fxftraders.com/ivlpets/submitSocialLogin.php';
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Processing Data')),
    );

    try {
      var response = await http.post(Uri.parse(apiUrl), body: {
        'user_name': dname,
        'user_email': email,
        'did': did,
        'pid': pid,
        'purl': purl,
        'uid': uid,
      });
      print(response.statusCode);
      var responseData = json.decode(response.body);
      if (responseData['success']) {
        // Registration successful, handle navigation or any other action
        //print('Registration successful');
        /*
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Success! Registration completed successfully.')),
        );
        */
        //(Route<dynamic> route) => route.isFirst)
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => mapscreen()),
            (route) => false);
      } else {
        // Registration failed, show error message
        //print('Registration failed: ${responseData['message']}');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1752691911.
            title: Text(
              'Error',
              style: TextStyle(color: Colors.red),
            ),
            content: Text('${responseData['message']}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }

      //print(responseData);
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3197851483.
    } catch (e) {
      print('Error registering user: $e');
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  Future<String> getDeviceId() async {
    String installationId = await FirebaseInstallations.instance.getId();
    setState(() {
      did = installationId;
    });
    return did;
  }
}

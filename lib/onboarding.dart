import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:myapp/firebase_options.dart';
import 'package:myapp/welcome.dart';
import 'package:status_alert/status_alert.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'mapdemo.dart';
import 'regtest.dart';
import 'locationtest.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  Map<String, dynamic>? _userData;
  final microsoftProvider = MicrosoftAuthProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  try {
                    final UserCredential userCredential =
                        await signInWithGoogle();
                    if (context.mounted) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Welcome(
                                    displayName:
                                        userCredential.user!.displayName!,
                                    photoURL:
                                        userCredential.user!.photoURL ?? "",
                                    email: userCredential.user!.email!,
                                    uid: userCredential.user!.uid,
                                    ltype: userCredential
                                        .user!.providerData[0].providerId,
                                  )));
                    }
                  } catch (e) {
                    StatusAlert.show(context,
                        duration: const Duration(seconds: 2),
                        title: 'User Authentication',
                        subtitle: e.toString(),
                        configuration: const IconConfiguration(
                            icon: Icons.close, color: Colors.red),
                        maxWidth: 360);
                  }
                },
                child: Text("Login with Google")),
            ElevatedButton(
                onPressed: () async {
                  try {
                    final UserCredential userCredential =
                        await signInWithFacebook();
                    if (context.mounted) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Welcome(
                                    displayName:
                                        userCredential.user!.displayName!,
                                    photoURL: _userData!['picture']['data']
                                            ['url'] ??
                                        "",
                                    email: userCredential.user!.email!,
                                    uid: userCredential.user!.uid,
                                    ltype: userCredential
                                        .user!.providerData[0].providerId,
                                  )));
                    }
                  } catch (e) {
                    StatusAlert.show(context,
                        duration: const Duration(seconds: 2),
                        title: 'User Authentication',
                        subtitle: e.toString(),
                        configuration: const IconConfiguration(
                            icon: Icons.close, color: Colors.red),
                        maxWidth: 360);
                  }
                },
                child: Text("FB Login")),
            ElevatedButton(
                onPressed: () {
                  signIn();
                },
                child: Text("Microsoft Login")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MyApp()));
                },
                child: Text("Map")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Regtest()));
                },
                child: Text("Register")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Locationtest()));
                },
                child: Text("Location"))
          ],
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

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final userData = await FacebookAuth.instance.getUserData();
    setState(() {
      _userData = userData;
    });

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future microsoftSignIn() async {
    try {
      final mUser =
          await FirebaseAuth.instance.signInWithProvider(microsoftProvider);
      print('User: $mUser');
    } catch (e) {
      if (e is FirebaseAuthException) {
        print('Firebase Auth Error Code: ${e.code}');
        print('Firebase Auth Error Message: ${e.message}');
      } else {
        return e.toString();
      }
    }
  }

  Future<UserCredential?> signIn() async {
    final microsoftProvider = OAuthProvider("microsoft.com");
    microsoftProvider.setCustomParameters({
      "tenant": "f8cdef31-a31e-4b4a-93e4-5f571e91255a", // Your Tenant ID
    })
      ..addScope("openid")
      ..addScope("profile")
      ..addScope("email");
    UserCredential? cred;
    if (kIsWeb) {
      cred = await FirebaseAuth.instance.signInWithPopup(microsoftProvider);
    } else {
      cred = await FirebaseAuth.instance.signInWithProvider(microsoftProvider);
    }
    String? t = await FirebaseAuth.instance.currentUser?.getIdToken();

    if (t != null) {
      //you can decode the token and get user data
      var decodedToken =
          JwtDecoder.decode(cred.credential!.accessToken!); // Get JWT parser
      log(decodedToken['email']);
      // update firestore user data in users collection
      User user = FirebaseAuth.instance.currentUser!;
      // do something with the user here if you like, i.e. create/update their account
      // or, notifyListeners();
    }

    return cred;
  }
}

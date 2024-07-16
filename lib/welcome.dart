import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'onboarding.dart';

class Welcome extends StatefulWidget {
  final String photoURL;
  final String displayName;
  final String email;
  final String uid;
  final String ltype;
  const Welcome(
      {required this.photoURL,
      required this.displayName,
      required this.email,
      required this.uid,
      required this.ltype,
      super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String did = '';
  Future<String> getDeviceId() async {
    String installationId = await FirebaseInstallations.instance.getId();
    setState(() {
      did = installationId;
    });
    return did;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDeviceId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Onboarding"),
        actions: [
          TextButton(
              onPressed: () {
                signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Onboarding()));
              },
              child: const Text(
                "Sign out",
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (widget.photoURL.isEmpty)
              ? const SizedBox(
                  width: 100,
                  child: Placeholder(
                    fallbackHeight: 100,
                  ),
                )
              : ClipRRect(
                  child: Image.network(widget.photoURL),
                ),
          Text(
            widget.photoURL,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            widget.displayName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            widget.email,
            style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
          ),
          Text(
            widget.ltype,
            style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
          ),
          Text(
            widget.uid,
            style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
          ),
          Text(
            '$did',
            style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
          ),
        ],
      )),
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}

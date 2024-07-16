import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapp/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Text('Hello user ${getName()}',style: TextStyle(fontSize: 30),),
          Text('Hello user ${getEmail()}',style: TextStyle(fontSize: 15),),
          CircleAvatar( 
    radius: 56, //radius of avatar 
    backgroundColor: Colors.green, //color 
    child: Padding( 
        padding: const EdgeInsets.all(2), // Border radius 
        child: ClipOval(child: Image.network('${getPhoto()}',fit: BoxFit.contain,width: 150,)),
    ), 
),
          ElevatedButton(
            onPressed: (){signOut();},child: Text('Logout'),),
            ElevatedButton(
            onPressed: (){writeUserProfileToFirestore();},child: Text('Update DB'),)
        ],
      ),
      ),
    );
  }
  String? getName(){
    return FirebaseAuth.instance.currentUser?.displayName;
  }
  String? getEmail(){
    return FirebaseAuth.instance.currentUser?.email;
  }
  String? getPhoto(){
    return FirebaseAuth.instance.currentUser?.photoURL;
  }
  Future<void> writeUserProfileToFirestore() async {
  try {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get a reference to the Firestore collection where you want to store user profiles
      CollectionReference users = FirebaseFirestore.instance.collection('User');

      // Create a map with the user profile data
      Map<String, dynamic> userData = {
        'name': user.displayName ?? '', // Use displayName if available, otherwise an empty string
        'email': user.email ?? '', // Use email if available, otherwise an empty string
        'picture': user.photoURL ?? '',
        'userid': user.uid, // Use your existing getPhoto() function or provide a default value
      };

      // Write the data to Firestore, using the user's UID as the document ID
      await users.doc(user.uid).set(userData);

      print('User profile written to Firestore successfully!');
    }
  } catch (e) {
    print('Error writing user profile to Firestore: $e');
  }
}
  signOut() async{
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context){
        return LoginPage();
      },
    ));
  }
}
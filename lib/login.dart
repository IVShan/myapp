import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'testpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSwitched = false;
  String textValue = 'Switch Button is OFF';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {loginwithGoogle();}, child: Text("Login with Google")),
            ElevatedButton(onPressed: () {
              
            }, child: Text("FB Login")),
            Switch(  
              onChanged: toggleSwitch,  
              value: isSwitched,  
              activeColor: Colors.blue,  
              activeTrackColor: Colors.yellow,  
              inactiveThumbColor: Colors.redAccent,  
              inactiveTrackColor: Colors.orange,  
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => Testpage()));
            }, child: Text('Go'))  
          ],
        ) ,),
    );
  }
  loginwithGoogle() async{
      final GoogleSignInAccount? googleUser= await GoogleSignIn().signIn();
      
      final GoogleSignInAuthentication? googleAuth=await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,idToken:googleAuth?.idToken
    );
    var userCreds=await FirebaseAuth.instance.signInWithCredential(credential);
    if(userCreds.user!=null){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context){
          return HomePage();
        },
      ));
    }
  }
  void toggleSwitch(bool value) async{  
  
    if(isSwitched == false)  
    {  
      
      setState(() {  
        isSwitched = true;  
        textValue = 'Switch Button is ON';  
      });  
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('isSwitched', textValue);
      
            final snackBar = SnackBar(
                content: Text('Switch Button is ON'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Code to execute when 'Undo' is pressed.
                  },
                ),
              );
              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a SnackBar.
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }  
    else  
    {  
     
      setState(() {  
        isSwitched = false;  
        textValue = 'Switch Button is OFF';  
      });  
        final prefs = await SharedPreferences.getInstance();
      prefs.setString('isSwitched', textValue);
      
      final snackBar = SnackBar(
                content: Text('Switch Button is OFF'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Code to execute when 'Undo' is pressed.
                  },
                ),
              );
              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a SnackBar.
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }  
  }  
}
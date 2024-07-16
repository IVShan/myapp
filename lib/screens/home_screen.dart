import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(title:Text("Splash Screen Example")),  
      body: Center(  
          child:Text("Welcome to Home Page",  
              style: TextStyle( color: Colors.black, fontSize: 30)  
          )  
      ),  
    );  
  }  
}
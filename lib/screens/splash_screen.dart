import 'dart:async'; 
import 'package:flutter/material.dart';
//import 'package:shan_flutter/screens/home_screen.dart';
import 'login_screen.dart';
import 'list_screens.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
@override  
  State<Splashscreen> createState() => _Splashscreenstate();
}
  class _Splashscreenstate extends State<Splashscreen>{
    @override  
  void initState() {  
    super.initState();  
    Timer(Duration(seconds: 3),  
            ()=>Navigator.pushReplacement(context,  
            MaterialPageRoute(builder:  
                (context) => listscreens()
                //login()  
            )  
         )  
    );  
  }  
  @override
  Widget build(BuildContext context) {
    double width30 = MediaQuery.of(context).size.width * 0.80;
    return Container(  
      constraints: BoxConstraints.expand(),
        //color: Colors.yellow,  
       // child:FlutterLogo(size:MediaQuery.of(context).size.height)  
       decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.PNG'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
                Image.asset('assets/images/logo.png',width: width30,)
              
              
            ],
          ),
        ),
    );  
  }
}

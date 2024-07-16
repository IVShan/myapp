import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Testpage extends StatefulWidget {
  const Testpage({super.key});

  @override
  State<Testpage> createState() => _TestpageState();
}

class _TestpageState extends State<Testpage> {
  String txt = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCounter();
  }
   void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      txt = (prefs.getString('isSwitched') ?? 0).toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('$txt'),
      ),
    );
  }
}
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:http/http.dart' as http;
import 'sign_in.dart';
import 'register_success.dart';

class createaccount extends StatefulWidget {
  const createaccount({super.key});
  
  @override
  State<createaccount> createState() => _createaccountState();
}

class _createaccountState extends State<createaccount> {
  final _formKey = GlobalKey<FormState>();
  dynamic _emailErrorText = null;
  String did = '';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  bool isNameValid(String fname) {
    return RegExp(r"^[a-zA-Z\s]+$").hasMatch(fname);
  }

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

  Future<void> _registerUser() async {
    String apiUrl =
        'https://www.fxftraders.com/ivlpets/submitCreateAccount.php';
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Processing Data')),
    );

    try {
      var response = await http.post(Uri.parse(apiUrl), body: {
        'user_name': _nameController.text,
        'user_email': _emailController.text,
        'did': did,
        'user_password': _passwordController.text,
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
            MaterialPageRoute(
                builder: (BuildContext context) => RegisterSuccess()),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff019b9e),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          border:
                              Border.all(color: Color(0xff019b9e), width: 1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text(
                                    "Create an accountsss",
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
                                  child: TextFormField(
                                    controller: _nameController,
                                    obscureText: false,
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color: Color(0xff000000),
                                    ),
                                    decoration: InputDecoration(
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(0xff019b9e), width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(0xff019b9e), width: 1),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(0xff019b9e), width: 1),
                                      ),
                                      hintText: "Username",
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff5b5858),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xffffffff),
                                      isDense: false,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 12),
                                      suffixIcon: Icon(Icons.person,
                                          color: Color(0xff5b5858), size: 24),
                                    ),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'User name is required';
                                      } else if (value.length < 3) {
                                        return 'User name must be at least 3 characters long';
                                      } else if (!isNameValid(value)) {
                                        return 'Only letters are allowed';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: TextFormField(
                                    controller: _emailController,
                                    obscureText: false,
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color: Color(0xff000000),
                                    ),
                                    decoration: InputDecoration(
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(0xff019b9e), width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(0xff019b9e), width: 1),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(0xff019b9e), width: 1),
                                      ),
                                      hintText: "Email Address",
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff5b5858),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xffffffff),
                                      isDense: false,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 12),
                                      suffixIcon: Icon(Icons.mail,
                                          color: Color(0xff5b5858), size: 24),
                                      errorText: _emailErrorText,
                                      errorStyle: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                      ),
                                    ),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Email is required';
                                      } else if (value.length < 8) {
                                        return 'Email must be at least 8 characters long';
                                      } else if (!isEmailValid(value)) {
                                        return 'Please provide a valid email address';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: false,
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color: Color(0xff000000),
                                    ),
                                    decoration: InputDecoration(
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(0xff019b9e), width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(0xff019b9e), width: 1),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(0xff019b9e), width: 1),
                                      ),
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff5b5858),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xffffffff),
                                      isDense: false,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 12),
                                      suffixIcon: Icon(Icons.visibility_off,
                                          color: Color(0xff5b5858), size: 24),
                                    ),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Password is required';
                                      } else if (value.length < 8) {
                                        return 'Password must be at least 8 characters long';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: MaterialButton(
                                    splashColor: Colors.blue,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        /*
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text('Processing Data')),
                                        );
                                        */
                                        _registerUser();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Please fill in all required fields')),
                                        );
                                      }
                                    },
                                    color: Color(0xffeca572),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(
                                          color: Color(0xffeca572), width: 1),
                                    ),
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "CREATE ACCOUNT",
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
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Already have an account? Login here",
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
      ),
    );
  }
}

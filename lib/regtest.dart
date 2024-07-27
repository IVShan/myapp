import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Regtest extends StatefulWidget {
  const Regtest({super.key});

  @override
  State<Regtest> createState() => _RegtestState();
}

class _RegtestState extends State<Regtest> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  late Future<File> file;

  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
    print('hello');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  Future<void> _registerUser() async {
    String apiUrl = 'https://www.fxftraders.com/ivlpets/testapi.php';
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Processing Data')),
    );
    List<int> imageBytes = await _image!.readAsBytes();
    String baseimage = base64Encode(imageBytes);
    print(baseimage);
    try {
      var response = await http.post(Uri.parse(apiUrl), body: {
        'user_name': _nameController.text,
        'user_email': _emailController.text,
        'user_mobile': _phoneController.text,
        'user_password': _passwordController.text,
        'image': baseimage,
      });
      print(response.statusCode);
      var responseData = json.decode(response.body);
      if (responseData['success']) {
        // Registration successful, handle navigation or any other action
        //print('Registration successful');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful')),
        );
      } else {
        // Registration failed, show error message
        print('Registration failed: ${responseData['message']}');
      }

      //print(responseData);
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3197851483.
    } catch (e) {
      print('Error registering user: $e');
    }
  }

  bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  bool isNameValid(String fname) {
    return RegExp(r"^[a-zA-Z]+$").hasMatch(fname);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              //autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextFormField(
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
                        borderRadius: BorderRadius.circular(22.0),
                        borderSide:
                            BorderSide(color: Color(0xffffffff), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22.0),
                        borderSide:
                            BorderSide(color: Color(0xffffffff), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22.0),
                        borderSide:
                            BorderSide(color: Color(0xffffffff), width: 1),
                      ),
                      hintText: "Full Name",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      filled: true,
                      fillColor: Color(0xfffefeff),
                      isDense: false,
                      contentPadding: EdgeInsets.all(8),
                      prefixIcon: Icon(Icons.person,
                          color: Color(0xff000000), size: 24),
                      // errorText: _nameErrorText
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: TextFormField(
                      controller: _emailController,
                      obscureText: false,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        color: Color(0xff000000),
                      ),
                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22.0),
                          borderSide:
                              BorderSide(color: Color(0xffffffff), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22.0),
                          borderSide:
                              BorderSide(color: Color(0xffffffff), width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22.0),
                          borderSide:
                              BorderSide(color: Color(0xffffffff), width: 1),
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                        filled: true,
                        fillColor: Color(0xffffffff),
                        isDense: false,
                        contentPadding: EdgeInsets.all(8),
                        prefixIcon: Icon(Icons.mail,
                            color: Color(0xff000000), size: 24),
                        //errorText: _emailErrorText
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (value.length < 8) {
                          return 'Minimum 8 character';
                        } else if (!isEmailValid(value)) {
                          return 'Enter valid Email';
                        }
                        return null;
                      },
                      //onChanged: _validateEmail,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: TextFormField(
                      controller: _phoneController,
                      obscureText: false,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.phone,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        color: Color(0xff000000),
                      ),
                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22.0),
                          borderSide:
                              BorderSide(color: Color(0xffffffff), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22.0),
                          borderSide:
                              BorderSide(color: Color(0xffffffff), width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22.0),
                          borderSide:
                              BorderSide(color: Color(0xffffffff), width: 1),
                        ),
// Suggested code may be subject to a license. Learn more: ~LicenseLog:987897044.
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                        filled: true,
                        fillColor: Color(0xffffffff),
                        isDense: false,
                        contentPadding: EdgeInsets.all(8),
                        prefixIcon: Icon(Icons.phone,
                            color: Color(0xff000000), size: 24),
                        //errorText: _emailErrorText
                      ),

                      //onChanged: _validateEmail,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
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
                          borderRadius: BorderRadius.circular(22.0),
                          borderSide:
                              BorderSide(color: Color(0xffffffff), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22.0),
                          borderSide:
                              BorderSide(color: Color(0xffffffff), width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22.0),
                          borderSide:
                              BorderSide(color: Color(0xffffffff), width: 1),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                        filled: true,
                        fillColor: Color(0xffffffff),
                        isDense: false,
                        contentPadding: EdgeInsets.all(8),
                        prefixIcon: Icon(Icons.visibility_off,
                            color: Color(0xff000000), size: 24),
                        //errorText: _passwordErrorText
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (value.length < 8) {
                          return 'Minimum 8 character';
                        }
                        return null;
                      },
                    ),
                  ),
                  Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: _image == null
                            ? const Text('No image selected.')
                            : Image.file(
                                File(_image!.path),
                                width: 150,
                                height: 150,
                              )),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: MaterialButton(
                      onPressed: () {
                        //if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        // ScaffoldMessenger.of(context).showSnackBar(
                        // const SnackBar(content: Text('Processing Data')),
                        // );
                        getImage();
                        //print('dfdfdf');
                        //}
                      },
                      color: Color.fromARGB(167, 128, 128, 129),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        side: BorderSide(
                            color: Color.fromARGB(167, 128, 128, 129),
                            width: 1),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1047852935.
                        "Upload Image",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      textColor: Color(0xffffffff),
                      height: 45,
                      minWidth: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: MaterialButton(
                      onPressed: () {
                        //if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        // ScaffoldMessenger.of(context).showSnackBar(
                        // const SnackBar(content: Text('Processing Data')),
                        // );
                        _registerUser();
                        //print('dfdfdf');
                        //}
                      },
                      color: Color(0xff3a57e8),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                        side: BorderSide(color: Color(0xff3a57e8), width: 1),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      textColor: Color(0xffffffff),
                      height: 45,
                      minWidth: MediaQuery.of(context).size.width,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

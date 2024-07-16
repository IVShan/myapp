import 'package:flutter/material.dart';
import 'private_chat.dart';
class commentsscreen extends StatefulWidget {
  const commentsscreen({super.key});

  @override
  State<commentsscreen> createState() => _commentsscreenState();
}

class _commentsscreenState extends State<commentsscreen> {
  int _selectedIndex = 0;
  final myController = TextEditingController();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Color(0xffFCF9F2),
      appBar:AppBar(
        leadingWidth: 50,
        backgroundColor: Color(0xffFCF9F2),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/menuicon.png",fit: BoxFit.contain,
          ),),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 0,top: 0),
          child: Image.asset('assets/images/logocolor.png',
            fit: BoxFit.contain,
            height: 40,

          ),
        ),
        centerTitle: true,
        actions: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/usericon.png",fit: BoxFit.contain,
            ),),
        ],
        shape: Border(
            bottom: BorderSide(
                color: Color(0xff019b9e),
                width: 4
            )
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                
                children: [
                  
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    padding: EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xffFCF9F2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                       
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                          child: TextField(
                            controller: myController,
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
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide:
                                    BorderSide(color: Color(0x00000000), width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide:
                                    BorderSide(color: Color(0x00000000), width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide:
                                    BorderSide(color: Color(0x00000000), width: 1),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: false,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              color: Color(0xff019b9e),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side:
                                    BorderSide(color: Color(0xff808080), width: 0),
                              ),
                              padding: EdgeInsets.all(0),
                              child: Text(
                                "Post",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              textColor: Color(0xffffffff),
                              height: 35,
                              minWidth: 80,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xffFCF9F2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child:
              
                                  ///***If you have exported images you must have to copy those images in assets/images directory.
                                  Image(
                                image: AssetImage("assets/images/usernew.png"),
                                width: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                            InkWell(
                              onTap: (){Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          privatechat()));},
                              child: Text(
                                "Jays",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  fontFamily:'SegoeUI',
                                  color: Color(0xff626060),
                                  
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 2, 0, 0),
                              child: Text(
                                "Feb 14,2024 11:15AM",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10,
                                  fontFamily:'SegoeUI',
                                  color: Color(0xff626060),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Check with local shelters and vet clinics to see if your cat has been found.",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 13,
                                fontFamily:'SegoeUI',
                                    color: Color(0xff696868),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xffFCF9F2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 2, 5, 0),
                              child: Text(
                                "Feb 14,2024 11:15AM",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10,
                                  color: Color(0xff7e7b7b),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          privatechat()));},
                              child: Text(
                                "Jay123",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                    fontFamily:'SegoeUI',
                                    color: Color(0xff626060),
                                    
                                  ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child:
              
                                  ///***If you have exported images you must have to copy those images in assets/images directory.
                                  Image(
                                image: AssetImage("assets/images/usernew.png"),
                                width: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                            
                            
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Check with local shelters and vet clinics to see if your cat has been found.",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 13,
                                fontFamily:'SegoeUI',
                                    color: Color(0xff696868),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xffFCF9F2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child:
              
                                  ///***If you have exported images you must have to copy those images in assets/images directory.
                                  Image(
                                image: AssetImage("assets/images/usernew.png"),
                                width: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                            InkWell(
                              onTap: (){Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          privatechat()));},
                              child: Text(
                                "Jays",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  fontFamily:'SegoeUI',
                                  color: Color(0xff626060),
                                  
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 2, 0, 0),
                              child: Text(
                                "Feb 14,2024 11:15AM",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10,
                                  fontFamily:'SegoeUI',
                                  color: Color(0xff626060),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Check with local shelters and vet clinics to see if your cat has been found.",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 13,
                                fontFamily:'SegoeUI',
                                    color: Color(0xff696868),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                   Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xffFCF9F2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 2, 5, 0),
                              child: Text(
                                "Feb 14,2024 11:15AM",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10,
                                  color: Color(0xff7e7b7b),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          privatechat()));},
                              child: Text(
                                "Jay123",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                    fontFamily:'SegoeUI',
                                    color: Color(0xff626060),
                                    
                                  ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child:
              
                                  ///***If you have exported images you must have to copy those images in assets/images directory.
                                  Image(
                                image: AssetImage("assets/images/usernew.png"),
                                width: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                            
                            
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Check with local shelters and vet clinics to see if your cat has been found.",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 13,
                                fontFamily:'SegoeUI',
                                    color: Color(0xff696868),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration( border: Border( top: BorderSide( color: Color(0xffeca572),width: 5  ), ), ),
        child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/menuhome.png",fit: BoxFit.contain,
                ),
                label: '',
                //backgroundColor: Colors.green
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/menuvets.png",fit: BoxFit.contain,
                ),
                label: '',
                //backgroundColor: Colors.yellow
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/menusearch.png",fit: BoxFit.contain,
                ),
                label: '',
                //backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/menupets.png",fit: BoxFit.contain,
                ),
                label: '',
                //backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/menubag.png",fit: BoxFit.contain,
                ),
                label: '',
                //backgroundColor: Colors.blue,
              )
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            iconSize: 30,
            onTap: _onItemTapped,
            elevation: 5,
            backgroundColor: Color(0xff019b9e),
            selectedLabelStyle: TextStyle(fontSize: 0),
            unselectedLabelStyle: TextStyle(fontSize: 0)
        ),
      ),
    );
  }
}
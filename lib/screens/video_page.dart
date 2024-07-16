import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '/widgets/mock_pets.dart';
import '/widgets/video_detail.dart';
import '/widgets/video_side_action_bar.dart';
import '/widgets/video_tile.dart';
class videopage extends StatefulWidget {
  const videopage({super.key});

  @override
  State<videopage> createState() => _videopageState();
}

class _videopageState extends State<videopage> {
  int _selectedIndex = 0;
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
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
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context,index){
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
            Videotile(video:videos[index]),
            
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.transparent
                  ],
                  begin: Alignment(0,-0.75),
                  end:Alignment(0,0.1),
                )
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.transparent
                  ],
                  end: Alignment(0,-0.75),
                  begin:Alignment(0,0.1),
                )
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 14,
                      child: Videodetail(video: videos[index],),
                    ),
                    Flexible(
                      flex: 2,
                      child: Videosideactionbar(video: videos[index],),
                    )
                  ],
                )
              ],
            ),
                
              ],
           
          );
        }
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
      )
    );
  }
}
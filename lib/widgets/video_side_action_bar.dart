import 'package:flutter/material.dart';
import 'pets_video.dart';

class Videosideactionbar extends StatelessWidget {
  const Videosideactionbar({Key?key, required this.video}):super(key:key);
  final double _iconSize=28;
  final Petsvideo video;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
      IconButton(
        onPressed: ()=>{}, 
        icon: Icon(video.isLiked ? Icons.favorite : Icons.favorite_outline),
        iconSize: _iconSize,
        color: video.isLiked ? Colors.red : Colors.white,
        ),
        Text(
          video.totalLikes,
          style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white),
          ),
        IconButton(
        onPressed: ()=>{}, 
        icon: Icon(Icons.chat_bubble_outline),
        iconSize: _iconSize,
        color: Colors.white,
        ),
        Text(
          video.totalComments,
          style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white),
          ),
        IconButton(
        onPressed: ()=>{}, 
        icon: Icon(Icons.send_outlined),
        iconSize: _iconSize,
        color: Colors.white,
        ),
        IconButton(
        onPressed: ()=>{}, 
        icon: Icon(Icons.more_horiz),
        iconSize: _iconSize,
        color: Colors.white,
        ),
        Container(
          width: 35,
          height: 35,
          
          decoration: BoxDecoration(
            color: Color(0xff019b9e),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
      ),
      child: Icon(Icons.add,color: Colors.white,size: 20,),
        ),
        SizedBox(height: 10,)
    ],);
  }
}
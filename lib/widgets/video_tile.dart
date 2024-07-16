import 'package:flutter/material.dart';
import 'pets_video.dart';
import 'package:video_player/video_player.dart';


class Videotile extends StatefulWidget {
  const Videotile({Key? key, required this.video}) : super(key: key);
  final Petsvideo video;
  @override
  State<Videotile> createState() => _VideotileState();
}

class _VideotileState extends State<Videotile> {
  late  VideoPlayerController _videoController;
  late Future _initializeVideoPlayer;

  @override
  void initState() {
    _videoController=VideoPlayerController.asset('assets/videos/${widget.video.videoUrl}');
    _initializeVideoPlayer=_videoController.initialize();
    _videoController.setLooping(true);
    _videoController.play();
    super.initState();
  }
  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: FutureBuilder(builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.done){
          return VideoPlayer(_videoController);
        }else{
          return Container(color: Colors.pink,);
        }
      
    }, future: _initializeVideoPlayer,),
    );
  }
}
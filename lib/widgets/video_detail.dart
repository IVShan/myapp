
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'pets_video.dart';
import 'package:marquee/marquee.dart';
class Videodetail extends StatelessWidget {
  const Videodetail({super.key, required this.video});
  final Petsvideo video;
  @override
  Widget build(BuildContext context) {
    return Container(
                            
                            
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  dense: true,
                                  minLeadingWidth: 0,
                                  horizontalTitleGap: 10,
                                  title: Text('${video.postedBy} - Follow',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
                                  ),
                                  leading: CircleAvatar(
                                    radius: 14,
                                    backgroundImage: NetworkImage(video.profileImg),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 14),
                                  child: ExpandableText(
                                    video.caption,
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      ),
                                      expandText: 'more',
                                      collapseText: 'less',
                                      expandOnTextTap: true,
                                      collapseOnTextTap: true,
                                      maxLines: 1,
                                      linkColor: Colors.grey,
                                  ),
                                ),
                                ListTile(
                                  dense: true,
                                  minLeadingWidth: 0,
                                  horizontalTitleGap: 5,
                                  title: video.isTagged
                                  ? Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 125,
                                        child: Marquee(
                                          text: "${video.audioTitle}  .  ",
                                          scrollAxis: Axis.horizontal,
                                          velocity: 10,
                                          style:TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Icon(Icons.person_outline_outlined,color: Colors.white,size: 14,),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${video.taggedUser}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),
                                          ),
                                      )
                                    ],
                                  ) :
                                  Text(video.audioTitle,
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),
                                  ),
                                  leading: Icon(Icons.grade_outlined,size: 15,color: Colors.white,),
                                ),
                              ],
                            ),
                          );
  }
}
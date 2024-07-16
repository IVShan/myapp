class Videosdata{
  final String postedBy;
  final String imageUrl;
  final String audioTitle;
  final String caption;
  final String totalLikes;
  final String totalComments;
  final bool isLiked;
  final bool isTagged;
  final String taggedUser;
  final String profileImg ;
  Videosdata(
      this.postedBy,
      this.imageUrl,
      this.audioTitle,
      this.caption,
      this.totalLikes,
      this.totalComments,
      this.isLiked,
      this.isTagged,
      this.taggedUser, this.profileImg);
}
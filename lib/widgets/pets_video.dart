class Petsvideo{
  final String postedBy;
  final String videoUrl;
  final String audioTitle;
  final String caption;
  final String totalLikes;
  final String totalComments;
  final bool isLiked;
  final bool isTagged;
  final String taggedUser;
  final String profileImg ;
  Petsvideo(
      this.postedBy,
      this.videoUrl,
      this.audioTitle,
      this.caption,
      this.totalLikes,
      this.totalComments,
      this.isLiked,
      this.isTagged,
      this.taggedUser, this.profileImg);
}
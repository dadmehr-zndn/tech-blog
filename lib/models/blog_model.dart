class BlogModel {
  BlogModel({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.creator,
    required this.creatorProfile,
    required this.createdDate,
    required this.content,
    required this.views,
  });

  final int id;
  final String imagePath;
  final String title;
  final String creator;
  final String creatorProfile;
  final String createdDate;
  final String content;
  final String views;
}

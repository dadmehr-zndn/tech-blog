class TagModel {
  TagModel({
    required this.id,
    required this.title,
  });

  String? id;
  String? title;

  TagModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
}

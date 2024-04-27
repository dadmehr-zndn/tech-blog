class HomeTagsModel {
  HomeTagsModel({
    required this.id,
    required this.title,
  });

  String? id;
  String? title;

  HomeTagsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    id = json['title'];
  }
}

class HomeTagModel {
  HomeTagModel({
    required this.id,
    required this.title,
  });

  String? id;
  String? title;

  HomeTagModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    id = json['title'];
  }
}

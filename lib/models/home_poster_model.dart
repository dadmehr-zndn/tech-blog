class HomePosterModel {
  HomePosterModel({
    required this.id,
    required this.title,
    required this.image,
  });

  String? id;
  String? title;
  String? image;

  HomePosterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    id = json['title'];
    id = json['image'];
  }
}

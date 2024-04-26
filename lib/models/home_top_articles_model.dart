class HomeTopArticlesModel {
  HomeTopArticlesModel({
    required this.id,
    required this.title,
    required this.image,
    required this.catId,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    required this.createdAt,
  });

  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  HomeTopArticlesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    id = json['title'];
    id = json['image'];
    id = json['catId'];
    id = json['catName'];
    id = json['author'];
    id = json['view'];
    id = json['status'];
    id = json['createdAt'];
  }
}

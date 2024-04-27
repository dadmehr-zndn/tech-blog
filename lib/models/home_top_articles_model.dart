import 'package:tech_blog/constants/api_constants.dart';

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
    title = json['title'];
    image = ApiConstants.baseDlUrl + json['image'];
    catId = json['catId'];
    catName = json['catName'];
    author = json['author'];
    view = json['view'];
    status = json['status'];
    createdAt = json['createdAt'];
  }
}

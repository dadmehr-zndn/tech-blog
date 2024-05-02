// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tech_blog/constants/api_constants.dart';

class ArticleSingleModel {
  ArticleSingleModel({
    this.id,
    this.title,
    this.content,
    this.image,
    this.catiId,
    this.catName,
    this.author,
    this.view,
    this.status,
    this.createdAt,
  });
  String? id;
  String? title;
  String? content;
  String? image;
  String? catiId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  ArticleSingleModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    content = map['content'];
    image = ApiConstants.baseDlUrl + map['image'];
    catiId = map['cati_id'];
    catName = map['cat_name'];
    author = map['author'];
    view = map['view'];
    status = map['status'];
    createdAt = map['created_at'];
  }
}

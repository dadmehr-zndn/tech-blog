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
    this.isFavorite,
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
  bool? isFavorite;

  ArticleSingleModel.fromJson(Map<String, dynamic> map) {
    var info = map['info'];

    id = info['id'];
    title = info['title'];
    content = info['content'];
    image = ApiConstants.baseDlUrl + info['image'];
    catiId = info['cati_id'];
    catName = info['cat_name'];
    author = info['author'];
    view = info['view'];
    status = info['status'];
    createdAt = info['created_at'];
    isFavorite = map['isFavorite'];
  }
}

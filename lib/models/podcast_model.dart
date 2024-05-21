// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tech_blog/constants/api_constants.dart';

class PodcastModel {
  PodcastModel({
    this.id,
    this.title,
    this.poster,
    this.publisher,
    this.view,
    this.status,
    this.createdAt,
    this.isFavorite,
  });
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;

  PodcastModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    poster = ApiConstants.baseDlUrl + map['poster'];
    publisher = map['publisher'];
    view = map['view'];
    status = map['status'];
    createdAt = map['createdAt'];
    isFavorite = map['isFavorite'];
  }
}

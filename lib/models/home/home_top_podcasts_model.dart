// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tech_blog/constants/api_constants.dart';

class HomeTopPodcastsModel {
  HomeTopPodcastsModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    required this.createdAt,
  });

  String? id;
  String? title;
  String? poster;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  HomeTopPodcastsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    poster = ApiConstants.baseDlUrl + json['poster'];
    catName = json['catName'];
    author = json['author'];
    view = json['view'];
    status = json['status'];
    createdAt = json['createdAt'];
  }
}

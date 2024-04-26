// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    id = json['title'];
    id = json['poster'];
    id = json['catName'];
    id = json['author'];
    id = json['view'];
    id = json['status'];
    id = json['createdAt'];
  }
}

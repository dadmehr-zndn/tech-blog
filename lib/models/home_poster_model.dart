import 'package:tech_blog/constants/api_constants.dart';

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
    title = json['title'];
    image = ApiConstants.baseDlUrl + json['image'];
  }
}

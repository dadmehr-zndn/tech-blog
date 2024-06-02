// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tech_blog/constants/api_constants.dart';

class PodcastFilesModel {
  PodcastFilesModel({
    this.id,
    this.podcastId,
    this.file,
    this.title,
    this.length,
  });
  String? id;
  String? podcastId;
  String? file;
  String? title;
  String? length;

  PodcastFilesModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    podcastId = map['podcast_id'];
    file = ApiConstants.baseDlUrl + map['file'];
    title = map['title'];
    length = map['length'];
  }
}

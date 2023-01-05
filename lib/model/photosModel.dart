

import 'package:wallpapers_getx_assign/model/srcModel.dart';

class PhotosModel {
  String? url;
  String? photographer;
  String? photographerUrl;
  int? photographerId;
  SrcModel? src;

  PhotosModel(
      { this.url,
       this.photographer,
       this.photographerId,
       this.photographerUrl,
       this.src});

  factory PhotosModel.fromMap(Map<String, dynamic> parsedJson) {
    return PhotosModel(
        url: parsedJson["url"],
        photographer: parsedJson["photographer"],
        photographerId: parsedJson["photographer_id"],
        photographerUrl: parsedJson["photographer_url"],
        src: SrcModel.fromMap(parsedJson["src"]));
  }
}
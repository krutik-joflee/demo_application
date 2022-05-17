// To parse this JSON data, do
//
//     final apImodel = apImodelFromJson(jsonString);

import 'dart:convert';

List<ApImodel> apImodelFromJson(String str) =>
    List<ApImodel>.from(json.decode(str).map((x) => ApImodel.fromJson(x)));

String apImodelToJson(List<ApImodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApImodel {
  ApImodel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  factory ApImodel.fromJson(Map<String, dynamic> json) => ApImodel(
        albumId: json["albumId"] == null ? null : json["albumId"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        url: json["url"] == null ? null : json["url"],
        thumbnailUrl:
            json["thumbnailUrl"] == null ? null : json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId == null ? null : albumId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "url": url == null ? null : url,
        "thumbnailUrl": thumbnailUrl == null ? null : thumbnailUrl,
      };
}

// To parse this JSON data, do
//
//     final categoryResponseModel = categoryResponseModelFromJson(jsonString);

import 'dart:convert';

List<CategoryResponseModel> categoryResponseModelFromJson(String str) =>
    List<CategoryResponseModel>.from(
      json.decode(str).map((x) => CategoryResponseModel.fromJson(x)),
    );

class CategoryResponseModel {
  String? slug;
  String? name;
  String? url;

  CategoryResponseModel({this.slug, this.name, this.url});

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      CategoryResponseModel(
        slug: json["slug"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {"slug": slug, "name": name, "url": url};
}

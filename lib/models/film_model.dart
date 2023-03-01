// To parse this JSON data, do
//
//     final filmModel = filmModelFromJson(jsonString);

import 'dart:convert';

FilmModel filmModelFromJson(String str) => FilmModel.fromJson(json.decode(str));

String filmModelToJson(FilmModel data) => json.encode(data.toJson());

class FilmModel {
  FilmModel({
    this.data,
    this.links,
    this.meta,
  });

  List<DataFilm>? data;
  Links? links;
  Meta? meta;

  factory FilmModel.fromJson(Map<String, dynamic> json) => FilmModel(
        data: json["data"] == null
            ? []
            : List<DataFilm>.from(
                json["data"]!.map((x) => DataFilm.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
      };
}

class DataFilm {
  DataFilm({
    this.id,
    this.userId,
    this.celebrity,
    this.title,
    this.synopsis,
    this.releaseDate,
    this.rating,
    this.country,
    this.genre,
    this.poster,
    this.url1,
    this.url2,
    this.url3,
    this.url4,
    this.url5,
    this.views,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? userId;
  String? celebrity;
  String? title;
  String? synopsis;
  DateTime? releaseDate;
  String? rating;
  String? country;
  String? genre;
  String? poster;
  String? url1;
  String? url2;
  String? url3;
  String? url4;
  String? url5;
  int? views;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory DataFilm.fromJson(Map<String, dynamic> json) => DataFilm(
        id: json["id"],
        userId: json["user_id"],
        celebrity: json["celebrity"],
        title: json["title"],
        synopsis: json["synopsis"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        rating: json["rating"],
        country: json["country"],
        genre: json["genre"],
        poster: json["poster"],
        url1: json["url1"],
        url2: json["url2"],
        url3: json["url3"],
        url4: json["url4"],
        url5: json["url5"],
        views: json["views"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "celebrity": celebrity,
        "title": title,
        "synopsis": synopsis,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "rating": rating,
        "country": country,
        "genre": genre,
        "poster": poster,
        "url1": url1,
        "url2": url2,
        "url3": url3,
        "url4": url4,
        "url5": url5,
        "views": views,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

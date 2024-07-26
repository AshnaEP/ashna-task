// To parse this JSON data, do
//
//     final apiDataModel = apiDataModelFromJson(jsonString);

import 'dart:convert';

ApiDataModel apiDataModelFromJson(String str) => ApiDataModel.fromJson(json.decode(str));

String apiDataModelToJson(ApiDataModel data) => json.encode(data.toJson());

class ApiDataModel {
  int ? totalItems;
  int ? endIndex;
  int ? startIndex;
  int ? itemsPerPage;
  List<Item> ? items;

  ApiDataModel({
     this.totalItems,
     this.endIndex,
     this.startIndex,
     this.itemsPerPage,
     this.items,
  });

  factory ApiDataModel.fromJson(Map<String, dynamic> json) => ApiDataModel(
    totalItems: json["totalItems"],
    endIndex: json["endIndex"],
    startIndex: json["startIndex"],
    itemsPerPage: json["itemsPerPage"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalItems": totalItems,
    "endIndex": endIndex,
    "startIndex": startIndex,
    "itemsPerPage": itemsPerPage,
    "items": List<Item>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  List<dynamic> ? essay;
  String ? placeOfPublication;
  int ? startYear;
  String ? publisher;
  List<String> ? county;
  String ? edition;
  String ? frequency;
  String ? url;
  String ? id;
  List<String> ? subject;
  List<dynamic> ? city;
  List<dynamic> ? language;
  dynamic title;
  List<dynamic> ? holdingType;
  int ? endYear;
  List<String> ? altTitle;
  List<String> ? note;
  String ? lccn;
  List<String> ? state;
  List<String> ? place;
  String ? country;
  dynamic type;
  String ? titleNormal;
  String ? oclc;

  Item({
     this.essay,
     this.placeOfPublication,
     this.startYear,
     this.publisher,
     this.county,
     this.edition,
     this.frequency,
     this.url,
     this.id,
     this.subject,
     this.city,
     this.language,
     this.title,
     this.holdingType,
     this.endYear,
     this.altTitle,
     this.note,
     this.lccn,
     this.state,
     this.place,
     this.country,
     this.type,
     this.titleNormal,
     this.oclc,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    essay: List<dynamic>.from(json["essay"].map((x) => x)),
    placeOfPublication: json["place_of_publication"],
    startYear: json["start_year"],
    publisher: json["publisher"],
    county: List<String>.from(json["county"].map((x) => x)),
    edition: json["edition"],
    frequency: json["frequency"],
    url: json["url"],
    id: json["id"],
    subject: List<String>.from(json["subject"].map((x) => x)),
    city: List<dynamic>.from(json["city"].map((x) => x)),
    language: List<dynamic>.from(json["language"].map((x) => x)),
    title: json["title"],
    holdingType: List<dynamic>.from(json["holding_type"].map((x) => x)),
    endYear: json["end_year"],
    altTitle: List<String>.from(json["alt_title"].map((x) => x)),
    note: List<String>.from(json["note"].map((x) => x)),
    lccn: json["lccn"],
    state: List<String>.from(json["state"].map((x) => x)),
    place: List<String>.from(json["place"].map((x) => x)),
    country: json["country"],
    type: json["type"],
    titleNormal: json["title_normal"],
    oclc: json["oclc"],
  );

  Map<String, dynamic> toJson() => {
    "essay": List<dynamic>.from(essay!.map((x) => x)),
    "place_of_publication": placeOfPublication,
    "start_year": startYear,
    "publisher": publisher,
    "county": List<dynamic>.from(county!.map((x) => x)),
    "edition": edition,
    "frequency": frequency,
    "url": url,
    "id": id,
    "subject": List<dynamic>.from(subject!.map((x) => x)),
    "city": List<dynamic>.from(city!.map((x) => x)),
    "language": List<dynamic>.from(language!.map((x) => x)),
    "title": title,
    "holding_type": List<dynamic>.from(holdingType!.map((x) => x)),
    "end_year": endYear,
    "alt_title": List<dynamic>.from(altTitle!.map((x) => x)),
    "note": List<dynamic>.from(note!.map((x) => x)),
    "lccn": lccn,
    "state": List<dynamic>.from(state!.map((x) => x)),
    "place": List<dynamic>.from(place!.map((x) => x)),
    "country": country,
    "type": type,
    "title_normal": titleNormal,
    "oclc": oclc,
  };
}



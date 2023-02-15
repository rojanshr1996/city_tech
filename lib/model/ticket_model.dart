// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

TicketModel welcomeFromJson(String str) => TicketModel.fromJson(json.decode(str));

String welcomeToJson(TicketModel data) => json.encode(data.toJson());

class TicketModel {
  TicketModel({
    required this.code,
    required this.message,
    required this.data,
  });

  String code;
  String message;
  Data data;

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.dist,
  });

  Dist dist;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dist: Dist.fromJson(json["dist"]),
      );

  Map<String, dynamic> toJson() => {
        "dist": dist.toJson(),
      };
}

class Dist {
  Dist({
    required this.day,
    required this.week,
    required this.month,
    required this.year,
  });

  List<Day> day;
  List<Day> week;
  List<Day> month;
  List<Day> year;

  factory Dist.fromJson(Map<String, dynamic> json) => Dist(
        day: List<Day>.from(json["day"].map((x) => Day.fromJson(x))),
        week: List<Day>.from(json["week"].map((x) => Day.fromJson(x))),
        month: List<Day>.from(json["month"].map((x) => Day.fromJson(x))),
        year: List<Day>.from(json["year"].map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "day": List<dynamic>.from(day.map((x) => x.toJson())),
        "week": List<dynamic>.from(week.map((x) => x.toJson())),
        "month": List<dynamic>.from(month.map((x) => x.toJson())),
        "year": List<dynamic>.from(year.map((x) => x.toJson())),
      };
}

class Day {
  Day({
    required this.label,
    required this.value,
  });

  String label;
  String value;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}

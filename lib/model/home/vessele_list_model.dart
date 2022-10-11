// Model class generation from api response

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

VesseleListModel welcomeFromJson(String str) =>
    VesseleListModel.fromJson(json.decode(str));

String welcomeToJson(VesseleListModel data) => json.encode(data.toJson());

class VesseleListModel {
  VesseleListModel({
    required this.greeting,
    required this.instructions,
  });

  String greeting;
  List<String> instructions;

  factory VesseleListModel.fromJson(Map<String, dynamic> json) =>
      VesseleListModel(
        greeting: json["greeting"],
        instructions: List<String>.from(json["instructions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "greeting": greeting,
        "instructions": List<dynamic>.from(instructions.map((x) => x)),
      };
}

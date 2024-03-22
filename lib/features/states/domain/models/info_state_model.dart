// To parse this JSON data, do
//
//     final infoStates = infoStatesFromJson(jsonString);

import 'dart:convert';

InfoStates infoStatesFromJson(String str) =>
    InfoStates.fromJson(json.decode(str));

String infoStatesToJson(InfoStates data) => json.encode(data.toJson());

class InfoStates {
  final String state;

  final String name;

  InfoStates({
    required this.state,
    required this.name,
  });

  InfoStates copyWith({
    String? state,
    String? name,
  }) =>
      InfoStates(
        state: state ?? this.state,
        name: name ?? this.name,
      );

  factory InfoStates.fromJson(Map<String, dynamic> json) => InfoStates(
        state: json['state'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'state': state,
        'name': name,
      };
}

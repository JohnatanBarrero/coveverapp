// To parse this JSON data, do
//
//     final infoStatesDetail = infoStatesDetailFromJson(jsonString);

import 'dart:convert';

List<InfoStatesDetail> infoStatesDetailFromJson(String str) =>
    List<InfoStatesDetail>.from(
        json.decode(str).map((x) => InfoStatesDetail.fromJson(x)));

String infoStatesDetailToJson(List<InfoStatesDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InfoStatesDetail {
  final String? state;
  final int? totalTestResults;
  final String? lastUpdateEt;

  InfoStatesDetail({
    this.state,
    this.totalTestResults,
    this.lastUpdateEt,
  });

  InfoStatesDetail copyWith({
    String? state,
    int? totalTestResults,
    String? lastUpdateEt,
  }) =>
      InfoStatesDetail(
        state: state ?? this.state,
        totalTestResults: totalTestResults ?? this.totalTestResults,
        lastUpdateEt: lastUpdateEt ?? this.lastUpdateEt,
      );

  factory InfoStatesDetail.fromJson(Map<String, dynamic> json) =>
      InfoStatesDetail(
        state: json['state'],
        totalTestResults: json['totalTestResults'],
        lastUpdateEt: json['lastUpdateEt'],
      );

  Map<String, dynamic> toJson() => {
        'state': state,
        'totalTestResults': totalTestResults,
        'lastUpdateEt': lastUpdateEt,
      };
}

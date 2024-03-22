// To parse this JSON data, do
//
//     final infoStateSumaryModel = infoStateSumaryModelFromJson(jsonString);

import 'dart:convert';

InfoStateSumaryModel infoStateSumaryModelFromJson(String str) => InfoStateSumaryModel.fromJson(json.decode(str));

String infoStateSumaryModelToJson(InfoStateSumaryModel data) => json.encode(data.toJson());

class InfoStateSumaryModel {
    final String state;
    final String name;
    final int totalTestResults;
    final String lastUpdateEt;

    InfoStateSumaryModel({
        required this.state,
        required this.name,
        required this.totalTestResults,
        required this.lastUpdateEt,
    });

    InfoStateSumaryModel copyWith({
        String? state,
        String? name,
        int? totalTestResults,
        String? lastUpdateEt,
    }) => 
        InfoStateSumaryModel(
            state: state ?? this.state,
            name: name ?? this.name,
            totalTestResults: totalTestResults ?? this.totalTestResults,
            lastUpdateEt: lastUpdateEt ?? this.lastUpdateEt,
        );

    factory InfoStateSumaryModel.fromJson(Map<String, dynamic> json) => InfoStateSumaryModel(
        state: json['state'],
        name: json['name'],
        totalTestResults: json['totalTestResults'],
        lastUpdateEt: json['lastUpdateEt'],
    );

    Map<String, dynamic> toJson() => {
        'state': state,
        'name': name,
        'totalTestResults': totalTestResults,
        'lastUpdateEt': lastUpdateEt,
    };
}

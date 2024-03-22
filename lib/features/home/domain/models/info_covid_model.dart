// To parse this JSON data, do
//
//     final infoCovidModel = infoCovidModelFromJson(jsonString);

import 'dart:convert';

List<InfoCovidModel> infoCovidModelFromJson(String str) => List<InfoCovidModel>.from(json.decode(str).map((x) => InfoCovidModel.fromJson(x)));

String infoCovidModelToJson(List<InfoCovidModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InfoCovidModel {
    final int date;
    final int states;
    final int positive;
    final int negative;
    final int pending;
    final int hospitalizedCurrently;
    final int hospitalizedCumulative;
    final int inIcuCurrently;
    final int inIcuCumulative;
    final int onVentilatorCurrently;
    final int onVentilatorCumulative;
    final String dateChecked;
    final int death;
    final int hospitalized;
    final int totalTestResults;
    final String lastModified;
    final dynamic recovered;
    final int total;
    final int posNeg;
    final int deathIncrease;
    final int hospitalizedIncrease;
    final int negativeIncrease;
    final int positiveIncrease;
    final int totalTestResultsIncrease;
    final String hash;

    InfoCovidModel({
        required this.date,
        required this.states,
        required this.positive,
        required this.negative,
        required this.pending,
        required this.hospitalizedCurrently,
        required this.hospitalizedCumulative,
        required this.inIcuCurrently,
        required this.inIcuCumulative,
        required this.onVentilatorCurrently,
        required this.onVentilatorCumulative,
        required this.dateChecked,
        required this.death,
        required this.hospitalized,
        required this.totalTestResults,
        required this.lastModified,
        required this.recovered,
        required this.total,
        required this.posNeg,
        required this.deathIncrease,
        required this.hospitalizedIncrease,
        required this.negativeIncrease,
        required this.positiveIncrease,
        required this.totalTestResultsIncrease,
        required this.hash,
    });

    InfoCovidModel copyWith({
        int? date,
        int? states,
        int? positive,
        int? negative,
        int? pending,
        int? hospitalizedCurrently,
        int? hospitalizedCumulative,
        int? inIcuCurrently,
        int? inIcuCumulative,
        int? onVentilatorCurrently,
        int? onVentilatorCumulative,
        String? dateChecked,
        int? death,
        int? hospitalized,
        int? totalTestResults,
        String? lastModified,
        dynamic recovered,
        int? total,
        int? posNeg,
        int? deathIncrease,
        int? hospitalizedIncrease,
        int? negativeIncrease,
        int? positiveIncrease,
        int? totalTestResultsIncrease,
        String? hash,
    }) => 
        InfoCovidModel(
            date: date ?? this.date,
            states: states ?? this.states,
            positive: positive ?? this.positive,
            negative: negative ?? this.negative,
            pending: pending ?? this.pending,
            hospitalizedCurrently: hospitalizedCurrently ?? this.hospitalizedCurrently,
            hospitalizedCumulative: hospitalizedCumulative ?? this.hospitalizedCumulative,
            inIcuCurrently: inIcuCurrently ?? this.inIcuCurrently,
            inIcuCumulative: inIcuCumulative ?? this.inIcuCumulative,
            onVentilatorCurrently: onVentilatorCurrently ?? this.onVentilatorCurrently,
            onVentilatorCumulative: onVentilatorCumulative ?? this.onVentilatorCumulative,
            dateChecked: dateChecked ?? this.dateChecked,
            death: death ?? this.death,
            hospitalized: hospitalized ?? this.hospitalized,
            totalTestResults: totalTestResults ?? this.totalTestResults,
            lastModified: lastModified ?? this.lastModified,
            recovered: recovered ?? this.recovered,
            total: total ?? this.total,
            posNeg: posNeg ?? this.posNeg,
            deathIncrease: deathIncrease ?? this.deathIncrease,
            hospitalizedIncrease: hospitalizedIncrease ?? this.hospitalizedIncrease,
            negativeIncrease: negativeIncrease ?? this.negativeIncrease,
            positiveIncrease: positiveIncrease ?? this.positiveIncrease,
            totalTestResultsIncrease: totalTestResultsIncrease ?? this.totalTestResultsIncrease,
            hash: hash ?? this.hash,
        );

    factory InfoCovidModel.fromJson(Map<String, dynamic> json) => InfoCovidModel(
        date: json['date'],
        states: json['states'],
        positive: json['positive'],
        negative: json['negative'],
        pending: json['pending'],
        hospitalizedCurrently: json['hospitalizedCurrently'],
        hospitalizedCumulative: json['hospitalizedCumulative'],
        inIcuCurrently: json['inIcuCurrently'],
        inIcuCumulative: json['inIcuCumulative'],
        onVentilatorCurrently: json['onVentilatorCurrently'],
        onVentilatorCumulative: json['onVentilatorCumulative'],
        dateChecked: json['dateChecked'],
        death: json['death'],
        hospitalized: json['hospitalized'],
        totalTestResults: json['totalTestResults'],
        lastModified: json['lastModified'],
        recovered: json['recovered'],
        total: json['total'],
        posNeg: json['posNeg'],
        deathIncrease: json['deathIncrease'],
        hospitalizedIncrease: json['hospitalizedIncrease'],
        negativeIncrease: json['negativeIncrease'],
        positiveIncrease: json['positiveIncrease'],
        totalTestResultsIncrease: json['totalTestResultsIncrease'],
        hash: json['hash'],
    );

    Map<String, dynamic> toJson() => {
        'date': date,
        'states': states,
        'positive': positive,
        'negative': negative,
        'pending': pending,
        'hospitalizedCurrently': hospitalizedCurrently,
        'hospitalizedCumulative': hospitalizedCumulative,
        'inIcuCurrently': inIcuCurrently,
        'inIcuCumulative': inIcuCumulative,
        'onVentilatorCurrently': onVentilatorCurrently,
        'onVentilatorCumulative': onVentilatorCumulative,
        'dateChecked': dateChecked,
        'death': death,
        'hospitalized': hospitalized,
        'totalTestResults': totalTestResults,
        'lastModified': lastModified,
        'recovered': recovered,
        'total': total,
        'posNeg': posNeg,
        'deathIncrease': deathIncrease,
        'hospitalizedIncrease': hospitalizedIncrease,
        'negativeIncrease': negativeIncrease,
        'positiveIncrease': positiveIncrease,
        'totalTestResultsIncrease': totalTestResultsIncrease,
        'hash': hash,
    };
}

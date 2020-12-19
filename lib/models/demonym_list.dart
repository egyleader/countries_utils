import 'package:flutter_country/models/demonym.dart';

class DemonymList {
  final List<Demonym> demonyms;

  DemonymList({this.demonyms});

  factory DemonymList.fromJson(Map<String, dynamic> parsedJson) {
    List<Demonym> demonyms = List<Demonym>();
    parsedJson.forEach((key, value) {
      demonyms.add(Demonym.fromJson({key: value}));
    });
    return DemonymList(
      demonyms: demonyms,
    );
  }
}

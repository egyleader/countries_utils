import 'package:flutter_country/models/country.dart';
import 'package:json_annotation/json_annotation.dart';

class CountryList {
  final List<Country> countries;

  CountryList({this.countries});

  factory CountryList.fromJson(List<dynamic> parsedJson) {
    List<Country> countries = List<Country>();
    countries = parsedJson.map((i) => Country.fromJosn(i)).toList();
    return CountryList(
      countries: countries,
    );
  }
}

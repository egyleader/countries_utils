
import 'package:flutter_country/models/country.dart';
import 'package:flutter_country/assets/countries.dart';

loadCountries() {
  List<Country> countries =
      countriesData.map((e) => Country.fromJosn(e)).toList();
  return countries;
}

import 'package:flutter_country/models/country.dart';
import 'package:flutter_country/assets/countries_data.dart';
import 'package:flutter_country/models/country_list.dart';
import 'models/country.dart';
import 'models/country_list.dart';

class Countries {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Countries._();
  static CountryList _countriesList;

  static CountryList _countryData = getCountries();

  static CountryList getCountries() =>
      _countriesList ?? CountryList.fromJson(countriesData);

  static List<Country> all() {
    return _countryData.countries;
  }

  static Country byName(String name) {
    Country country = _countryData.countries.where((c) => c.name == name).first;
    return country;
  }

  static Country byCode(String code) {
    Country country =
        _countryData.countries.where((c) => c.alpha2Code == code).first;
    return country;
  }

  static Country byAlpha3Code(String code) {
    Country country =
        _countryData.countries.where((c) => c.alpha3Code == code).first;
    return country;
  }

  static Country byNumericCode(String code) {
    Country country =
        _countryData.countries.where((c) => c.numericCode == code).first;
    return country;
  }

  static Country byOlympicCode(String code) {
    Country country =
        _countryData.countries.where((c) => c.olympicCode == code).first;
    return country;
  }

  static Country byPhoneCode(String code) {
    Country country =
        _countryData.countries.where((c) => c.phoneCode.contains(code)).first;
    return country;
  }

  static Country byCapital(String capital) {
    Country country =
        _countryData.countries.where((c) => c.capital.contains(capital)).first;
    return country;
  }

  static Country byFlag(String flag) {
    Country country = _countryData.countries.where((c) => c.flag == flag).first;
    return country;
  }

  static List<Country> byLanguageCode(String language) {
    List<Country> countries = _countryData.countries
        .where((c) => c.languages.containsKey(language))
        .toList();
    return countries;
  }

  static List<Country> byLanguageName(String language) {
    List<Country> countries = _countryData.countries
        .where((c) => c.languages.containsValue(language))
        .toList();
    return countries;
  }

  static List<Country> unMembers() {
    List<Country> countries =
        _countryData.countries.where((c) => c.unMember == true).toList();
    return countries;
  }

  static List<Country> independent() {
    List<Country> countries =
        _countryData.countries.where((c) => c.independent == true).toList();
    return countries;
  }

  static List<Country> byRegion(String region) {
    List<Country> countries =
        _countryData.countries.where((c) => c.region.contains(region)).toList();
    return countries;
  }

  static List<Country> bySubRegion(String region) {
    List<Country> countries = _countryData.countries
        .where((c) => c.subRegion.contains(region))
        .toList();
    return countries;
  }

  static Country byArea(double area) {
    Country countries =
        _countryData.countries.where((c) => c.area == area).first;
    return countries;
  }

  static List<Country> areaBiggerThan(double area) {
    List<Country> countries =
        _countryData.countries.where((c) => c.area > area).toList();
    return countries;
  }

  static List<Country> areaSmallerThan(double area) {
    List<Country> countries =
        _countryData.countries.where((c) => c.area < area).toList();
    return countries;
  }
}

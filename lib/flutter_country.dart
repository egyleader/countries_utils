library flutter_country;
import 'package:flutter_country/models/country.dart';
import 'package:flutter_country/assets/countries_data.dart';
import 'package:flutter_country/models/country_list.dart';

class Countries {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Countries._();

  static CountryList loadCountries() {
    CountryList countriesList = CountryList.fromJson(countriesData);
    return countriesList;
  }

  static List<Country> all() {
    CountryList _countryData = loadCountries();
    return _countryData.countries;
  }

  static Country byName(String name) {
    CountryList _countriesData = Countries.loadCountries();
    Country country =
        _countriesData.countries.where((c) => c.name == name).first;
    return country;
  }

  static Country byCode(String code) {
    CountryList _countriesData = Countries.loadCountries();
    Country country =
        _countriesData.countries.where((c) => c.alpha2Code == code).first;
    return country;
  }

  static Country byAlpha3Code(String code) {
    CountryList _countriesData = Countries.loadCountries();
    Country country =
        _countriesData.countries.where((c) => c.alpha3Code == code).first;
    return country;
  }
  static Country byNumericCode(String code) {
    CountryList _countriesData = Countries.loadCountries();
    Country country =
        _countriesData.countries.where((c) => c.numericCode == code).first;
    return country;
  }
  static Country byOlympicCode(String code) {
    CountryList _countriesData = Countries.loadCountries();
    Country country =
        _countriesData.countries.where((c) => c.olympicCode == code).first;
    return country;
  }
  static Country byPhoneCode(String code) {
    CountryList _countriesData = Countries.loadCountries();
    Country country =
        _countriesData.countries.where((c) => c.phoneCode.contains(code)).first;
    return country;
  }

  static Country byCapital(String capital) {
    CountryList _countriesData = Countries.loadCountries();
    Country country = _countriesData.countries.where((c) => c.capital.contains(capital)).first;
    return country;
  }
  static Country byFlag(String flag) {
    CountryList _countriesData = Countries.loadCountries();
    Country country = _countriesData.countries.where((c) => c.flag == flag).first;
    return country;
  }
  static List<Country> byLanguageCode(String language) {
    CountryList _countriesData = Countries.loadCountries();
    List<Country> countries = _countriesData.countries.where((c) => c.languages.containsKey(language)).toList();
    return countries;
  }
  static List<Country> byLanguageName(String language) {
    CountryList _countriesData = Countries.loadCountries();
    List<Country> countries = _countriesData.countries.where((c) => c.languages.containsValue(language)).toList();
    return countries;
  }
  static List<Country> unMembers() {
    CountryList _countriesData = Countries.loadCountries();
    List<Country> countries = _countriesData.countries.where((c) => c.unMember == true ).toList();
    return countries;
  }
  static List<Country> independent() {
    CountryList _countriesData = Countries.loadCountries();
    List<Country> countries = _countriesData.countries.where((c) => c.independent == true ).toList();
    return countries;
  }
  static List<Country> byRegion(String region) {
    CountryList _countriesData = Countries.loadCountries();
    List<Country> countries = _countriesData.countries.where((c) => c.region.contains(region) ).toList();
    return countries;
  }
  static List<Country> bySubRegion(String region) {
    CountryList _countriesData = Countries.loadCountries();
    List<Country> countries = _countriesData.countries.where((c) => c.subRegion.contains(region) ).toList();
    return countries;
  }
  static Country byArea(double area) {
    CountryList _countriesData = Countries.loadCountries();
    Country countries = _countriesData.countries.where((c) => c.area == area ).first;
    return countries;
  }
  static List<Country> areaBiggerThan(double area) {
    CountryList _countriesData = Countries.loadCountries();
    List<Country> countries = _countriesData.countries.where((c) => c.area > area ).toList();
    return countries;
  }
  static List<Country> areaSmallerThan(double area) {
    CountryList _countriesData = Countries.loadCountries();
    List<Country> countries = _countriesData.countries.where((c) => c.area < area ).toList();
    return countries;
  }
}

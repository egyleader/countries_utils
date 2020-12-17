library flutter_country;

import 'package:flutter/cupertino.dart';
import 'package:flutter_country/models/country.dart';
import 'package:flutter_country/assets/countries_data.dart';
import 'package:flutter_country/models/country_list.dart';

class Countries {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Countries._();

  static CountryList loadCountries() {
    CountryList countriesList = CountryList.fromJson(countriesData);
    // countriesList.countries.forEach((c) {
    //   print(
    //       'static const Country ${c.alpha2Code} Country(name:${c.name} , officialName:${c.officialName}, nativeName:${c.nativeName} , alpha2Code:${c.alpha2Code} , alpha3Code:${c.alpha3Code} , numericCode:${c.numericCode} , independent:${c.independent} , unMember:${c.unMember} , topLevelDomain:${c.topLevelDomain} , phoneCode:${c.phoneCode} , languages:${c.languages} , currency:${c.currency} , capital:${c.capital} , region:${c.region} , subRegion:${c.subRegion} , population:${c.population} , area:${c.area} , nativeName:${c.nativeName} , flag:${c.flag} , olympicCode:${c.olympicCode} , phoneSuffixCode:${c.phoneSuffixCode} , callingCodes:${c.callingCodes} , }  );');
    // });
    return countriesList;
  }

  static List<Country> all() {
    WidgetsFlutterBinding.ensureInitialized();
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
}

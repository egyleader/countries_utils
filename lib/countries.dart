import 'package:countries_utils/models/country.dart';
import 'package:countries_utils/countries_data.dart';
import 'package:countries_utils/models/country_list.dart';
import 'package:countries_utils/models/timezone.dart';
import 'models/country.dart';
import 'models/country_list.dart';

class Countries {
  /// This class is not meant to be instantiated or extended; this constructor
  /// prevents instantiation and extension.
  Countries._();
  static CountryList? _countriesList;

  static final CountryList _countryData = _getCountries();

  static CountryList _getCountries() => _countriesList ?? CountryList.fromJson(countriesData);

  /// gets all the countries as a List of [Country]
  static List<Country> all() {
    return _countryData.countries;
  }

  /// gets country by Name Example
  static Country byName(String name) {
    Country country = _countryData.countries.where((c) => c.name == name).first;
    return country;
  }

  /// gets country by Alpha2 code
  /// for more see : https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
  static Country byCode(String code) {
    Country country = _countryData.countries.where((c) => c.alpha2Code == code).first;
    return country;
  }

  /// gets country by Alpha3 code
  /// for more see : https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3
  static Country byAlpha3Code(String code) {
    Country country = _countryData.countries.where((c) => c.alpha3Code == code).first;
    return country;
  }

  /// gets country by Alpha3 code
  /// for more see : https://en.wikipedia.org/wiki/ISO_3166-1_numeric
  static Country byNumericCode(String code) {
    Country country = _countryData.countries.where((c) => c.numericCode == code).first;
    return country;
  }

  /// gets country by Alpha3 code
  /// for more see : https://en.wikipedia.org/wiki/ISO_3166-1_numeric
  static Country byCallingCode(String code) {
    Country country = _countryData.countries.where((c) => c.callingCodes!.contains(code)).first;
    return country;
  }

  /// gets country by capital name
  static Country byCapital(String capital) {
    Country country = _countryData.countries.where((c) => c.capital!.contains(capital)).first;
    return country;
  }

  /// gets country by flag emoji icon
  static Country byFlag(String flag) {
    Country country = _countryData.countries.where((c) => c.flagIcon == flag).first;
    return country;
  }

  // static List<Country> byLanguageCode(String language) {
  //   List<Country> countries = _countryData.countries
  //       .where((c) => c.languages.containsKey(language))
  //       .toList();
  //   return countries;
  // }

  // static List<Country> byLanguageName(String language) {
  //   List<Country> countries = _countryData.countries
  //       .where((c) => c.languages.containsValue(language))
  //       .toList();
  //   return countries;
  // }

  static List<Country> unMembers() {
    List<Country> countries = _countryData.countries.where((c) => c.unMember == true).toList();
    return countries;
  }

  /// gets all independent countries
  /// TODO: move this in as a check in [Country] model
  static List<Country> independent() {
    List<Country> countries = _countryData.countries.where((c) => c.independent == true).toList();
    return countries;
  }

  /// gets countries by region
  static List<Country> byRegion(String region) {
    List<Country> countries = _countryData.countries.where((c) => c.region!.contains(region)).toList();
    return countries;
  }

  /// gets country by exact area 
  /// TODO : test this better 
  /// 
  static Country byArea(double area) {
    Country countries = _countryData.countries.where((c) => c.area == area).first;
    return countries;
  }
  /// gets countries that are bigger than certain area by KM
  static List<Country> areaBiggerThan(double area) {
    List<Country> countries = _countryData.countries.where((c) => c.area != null && c.area! > area).toList();
    return countries;
  }
  /// gets countries that are smaller than certain area by KM
  static CountryList areaSmallerThan(double area) {
    List<Country> countries = _countryData.countries.where((c) => c.area != null && c.area! < area).toList();
    return CountryList(countries: countries);
  }
  /// gets countries of certain timezone 
  static CountryList byTimeZone(TimeZone timeZone) {
    List<Country> countries = _countryData.countries
        .where((c) => c.timeZones!.timeZones == null ? false : c.timeZones!.timeZones!.contains(timeZone))
        .toList();
    return CountryList(countries: countries);
  }
}

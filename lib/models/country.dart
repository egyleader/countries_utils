import 'package:flutter_country/flutter_country.dart';
import 'package:flutter_country/models/currency_list.dart';
import 'package:flutter_country/models/demonym_list.dart';
import 'package:flutter_country/models/translation_list.dart';

class Country {
  final String name;
  final String officialName;
  final TranslationList nativeName;
  final TranslationList translations;
  final DemonymList demonyms;
  final List<String> altSpellings;
  final String alpha2Code;
  final String alpha3Code;
  final String numericCode;
  final String olympicCode;
  final bool independent;
  final bool unMember;
  final bool landLocked;
  final List<String> topLevelDomain;
  final String capital;
  final String region;
  final String subRegion;
  final CurrencyList currnecies;
  final Map<String, dynamic> languages;
  final List<String> borders;
  final double area;
  final String flag;
  final List<String> phoneCode;
  final List<double> coordinates;
  final double latitude;
  final double longitude;
  Country(
      {this.name,
      this.officialName,
      this.nativeName,
      this.alpha2Code,
      this.alpha3Code,
      this.numericCode,
      this.independent,
      this.unMember,
      this.topLevelDomain,
      this.phoneCode,
      this.languages,
      this.currnecies,
      this.capital,
      this.region,
      this.subRegion,
      this.area,
      this.flag,
      this.olympicCode,
      this.coordinates,
      this.translations,
      this.latitude,
      this.longitude,
      this.altSpellings,
      this.landLocked,
      this.borders,
      this.demonyms});

  factory Country.fromJosn(Map<String, dynamic> json) => Country(
      name: json['name']['common'] as String,
      officialName: json['name']['official'] as String,
      nativeName: json['name']['native'].toString() == '{}'
          ? null
          : TranslationList.fromJson(json['name']['native']),
      translations: json['translations'].toString() == '{}'
          ? null
          : TranslationList.fromJson(json['translations']),
      altSpellings: json['altSpellings'].cast<String>(),
      topLevelDomain: json['tld'].cast<String>(),
      alpha2Code: json['cca2'] as String,
      numericCode: json['ccn3'] as String,
      alpha3Code: json['cca3'] as String,
      olympicCode: json['cioc'] as String,
      independent: json['independent'] as bool,
      unMember: json['unMember'] as bool,
      currnecies: json['currencies'].toString() == '[]'
          ? null
          : CurrencyList.fromJson(json['currencies']),
      capital: json['capital'].toString(),
      region: json['region'] as String,
      subRegion: json['subregion'] as String,
      languages: json['languages'].cast<String, dynamic>(),
      demonyms: json['demonyms'].toString() == '{}'
          ? null
          : DemonymList.fromJson(json['demonyms']),
      coordinates: json['latlng'].cast<double>(),
      latitude: double.parse(json['latlng'][0].toString()),
      longitude: double.parse(json['latlng'][1].toString()),
      landLocked: json['landlocked'] as bool,
      area: (json['area'] as num)?.toDouble(), // area in km²
      flag: json['flag'] as String,
      phoneCode: json['callingCodes'].cast<String>() as List<String>,
      borders: json['borders'].cast<String>()
          as List<String> //countries that share borders with this country
      //? timestaps is not added yet
      );

  String traslatedOfficialName(String code) =>
      this.translations.translate(code).official;
  String traslatedCommonName(String code) =>
      this.translations.translate(code).common ??
      this.translations.translate(code).official;
}

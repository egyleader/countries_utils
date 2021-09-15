import 'package:countries_utils/helpers/flag_string.dart';
import 'package:countries_utils/models/currency_list.dart';
import 'package:countries_utils/models/timezone_list.dart';

class Country {
  final String? name;
  final String? officialName;
  final String? nativeName;
  final Map<String, String>? translations;
  final String? demonym;
  final List<String>? altSpellings;
  final String? alpha2Code;
  final String? alpha3Code;
  final String? numericCode;
  final String? olympicCode;
  final bool? independent;
  final bool? unMember;
  final bool? landLocked;
  final List<String>? topLevelDomain;
  final String? capital;
  final String? region;
  final String? subRegion;
  final CurrencyList? currnecies;
  // final List<Map<String, String>> languages;
  final List<String>? borders;
  final double? area;
  final List<String>? flags;
  final String? flagIcon;
  final List<String>? callingCodes;
  final List<double>? coordinates;
  final double? latitude;
  final double? longitude;
  final TimeZoneList? timeZones;
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
      this.callingCodes,
      // this.languages,
      this.currnecies,
      this.capital,
      this.region,
      this.subRegion,
      this.area,
      this.flags,
      this.flagIcon,
      this.olympicCode,
      this.coordinates,
      this.translations,
      this.latitude,
      this.longitude,
      this.altSpellings,
      this.landLocked,
      this.borders,
      this.demonym,
      this.timeZones});

  factory Country.fromJosn(Map<String, dynamic> json) => Country(
        alpha2Code: json['alpha2Code'],
        alpha3Code: json['alpha3Code'],
        altSpellings: json['altSpellings'].toString() != '[]'
            ? json['altSpellings'].cast<String>()
            : [],
        area: (json['area'] as num?)?.toDouble(), // area in km²
        borders: json['borders'].toString() != '[]'
            ? json['borders']?.cast<String>()
            : [],
        callingCodes: json['callingCodes'].toString() != '[]'
            ? json['callingCodes'].cast<String>()
            : [],
        capital: json['capital'] as String?,
        currnecies: json['currencies'].toString() == '[]'
            ? null
            : CurrencyList.fromJson(json['currencies']),
        demonym: json['demonym'] ?? '',
        independent: json['independent'] as bool?,
        flagIcon: getFlagByCountryCode(json['alpha2Code']),
        flags: json['flags'].toString() != '[]'
            ? json['flags'].cast<String>()
            : [],
        // gini goes here
        // languages: json['languages'] as List<Map<String, String>>,
        latitude: json['latlng'].toString() != '[]'
            ? double.parse(json['latlng'][0].toString())
            : null,
        longitude: json['latlng'].toString() != '[]'
            ? double.parse(json['latlng'][1].toString())
            : null,
        // maps goes here
        name: json['name'],
        nativeName: json['nativeName'] ?? '',
        numericCode: json['numericCode'] as String?,
        // population geos here
        // continent geos here
        // regionalBlocs  geos here
        region: json['region'],
        timeZones: TimeZoneList.fromJson(json['timezones']),
        topLevelDomain: json['topLevelDomain'].cast<String>(),
        translations: json['translations'].toString() == '{}'
            ? null
            : json['translations'] as Map<String, String>?,
        // cioc  geos here
        //countries that share borders with this country
      );

  String? translate(String code) =>
      translations!.containsKey(code) ? translations![code] : '';
}

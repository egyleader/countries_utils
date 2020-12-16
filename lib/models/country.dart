import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  String name;
  String officialName;
  String nativeName;
  String alpha2Code;
  String alpha3Code;
  String numericCode;
  bool independent;
  bool unMember;
  List<String> topLevelDomain;
  Map<String, dynamic> languages;
  String phoneCode;
  String currency;
  String capital;
  String region;
  String subRegion;
  int population;
  double area;
  String flag;
  String olympicCode;
  String phoneSuffixCode;
  List<String> callingCodes;
  List<double> coordinates;
  double latitude;
  double longitude;
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
      this.currency,
      this.capital,
      this.region,
      this.subRegion,
      this.population,
      this.area,
      this.flag,
      this.olympicCode,
      this.phoneSuffixCode,
      this.callingCodes,
      this.coordinates,
      this.latitude,
      this.longitude});

  factory Country.fromJosn(Map<String, dynamic> data) =>
      _$CountryFromJson(data);
}

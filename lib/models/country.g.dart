part of 'country.dart';

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    name: json['name']['common'] as String,
    officialName: json['name']['official'] as String,
    nativeName: json['name']['native'].toString(),
    topLevelDomain: json['tld'].cast<String>(),
    alpha2Code: json['cca2'] as String,
    numericCode: json['ccn3'] as String,
    alpha3Code: json['cca3'] as String,
    olympicCode: json['cioc'] as String,
    independent: json['independent'] as bool,
    unMember: json['unMember'] as bool,
    currency: json['currencies'].toString(), // check this
    phoneCode: json['idd']['root'] as String,
    phoneSuffixCode: json['idd']['suffixes'].toString(),
    capital: json['capital'].toString(), //chosen only one capital
    //? alternative spelling is not added
    region: json['region'] as String,
    subRegion: json['subregion'] as String,
    languages: json['languages'].cast<String, dynamic>(),
    //? translations is not added
    // population: json['population'] as int,
    coordinates: json['latlng'].cast<double>(),
    //? demonyms  is not added
    //? landlocked   is not added
    //? land borders  is not added
    //? timestaps is not added
    //? population  is not added
    area: (json['area'] as num)?.toDouble(), // area in km²
    flag: json['flag'] as String,
    callingCodes: json['callingCodes'].cast<String>() as List<String>,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'officialName': instance.officialName,
      'nativeName': instance.nativeName,
      'topLevelDomain': instance.topLevelDomain,
      'alpha2Code': instance.alpha2Code,
      'numericCode': instance.numericCode,
      'alpha3Code': instance.alpha3Code,
      'numericCode': instance.numericCode,
      'independent': instance.independent,
      'unMember': instance.unMember,
      'languages': instance.languages,
      'phoneCode': instance.phoneCode,
      'currency': instance.currency,
      'capital': instance.capital,
      'region': instance.region,
      'subRegion': instance.subRegion,
      'population': instance.population,
      'coordinates': instance.coordinates,
      'area': instance.area,
      'flag': instance.flag,
    };

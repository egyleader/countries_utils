import 'package:freezed_annotation/freezed_annotation.dart';

import 'currency.dart';
import 'language.dart';
import 'region.dart';
import 'timezone.dart';

part 'country.freezed.dart';

/// A world country with its associated data.
@Freezed(fromJson: false, toJson: false)
class Country with _$Country {
  const Country._();

  const factory Country({
    String? name,
    String? officialName,
    @Default('') String nativeName,
    String? alpha2Code,
    String? alpha3Code,
    String? numericCode,
    /// Olympic/CIOC code.
    String? olympicCode,
    @Default(false) bool independent,
    @Default(false) bool unMember,
    @Default(false) bool landLocked,
    @Default([]) List<String> topLevelDomain,
    String? capital,
    @Default(Region.unknown) Region region,
    @Default('') String subRegion,
    @Default([]) List<Currency> currencies,
    @Default([]) List<Language> languages,
    @Default([]) List<String> borders,
    double? area,
    @Default([]) List<String> flags,
    /// Flag emoji derived from alpha2Code.
    String? flagIcon,
    @Default([]) List<String> callingCodes,
    double? latitude,
    double? longitude,
    @Default([]) List<TimeZone> timeZones,
    @Default({}) Map<String, String> translations,
    @Default([]) List<String> altSpellings,
    String? demonym,
  }) = _Country;

  /// Parses both legacy v2 and v3.1 data schemas.
  factory Country.fromJson(Map<String, dynamic> json) {
    // coordinates
    final latlng = json['latlng'] as List<dynamic>?;
    final lat = latlng != null && latlng.isNotEmpty
        ? (latlng[0] as num).toDouble()
        : null;
    final lng = latlng != null && latlng.length > 1
        ? (latlng[1] as num).toDouble()
        : null;

    // currencies — list of {code, name, symbol}
    final currenciesRaw = json['currencies'];
    final currencies = currenciesRaw is List
        ? currenciesRaw
            .map((e) => Currency.fromJson(e as Map<String, dynamic>))
            .toList()
        : <Currency>[];

    // languages — map {isoCode: name}
    final languagesRaw = json['languages'];
    final languages = languagesRaw is Map
        ? Language.listFromMap(languagesRaw.cast<String, dynamic>())
        : <Language>[];

    // timezones — list of strings (already normalised: no "UTC" prefix)
    final timezonesRaw = json['timezones'] as List<dynamic>? ?? [];
    final timeZones =
        timezonesRaw.map((e) => TimeZone.parse(e as String)).toList();

    // flags — list of strings
    final flagsRaw = json['flags'] as List<dynamic>? ?? [];
    final flags = flagsRaw.cast<String>().toList();

    // translations — {lang: name}
    final translationsRaw = json['translations'];
    final translations = translationsRaw is Map
        ? Map.fromEntries(
            (translationsRaw as Map).entries.map(
              (e) => MapEntry(e.key as String, e.value?.toString() ?? ''),
            ),
          )
        : <String, String>{};

    // flag emoji from alpha2Code
    final alpha2 = json['alpha2Code'] as String?;

    return Country(
      name: json['name'] as String?,
      officialName: json['officialName'] as String?,
      nativeName: json['nativeName'] as String? ?? '',
      alpha2Code: alpha2,
      alpha3Code: json['alpha3Code'] as String?,
      numericCode: json['numericCode'] as String?,
      olympicCode: json['cioc'] as String?,
      independent: json['independent'] as bool? ?? false,
      unMember: json['unMember'] as bool? ?? false,
      landLocked: json['landLocked'] as bool? ?? false,
      topLevelDomain: (json['topLevelDomain'] as List<dynamic>?)
              ?.cast<String>()
              .toList() ??
          const [],
      capital: json['capital'] as String?,
      region: Region.fromString(json['region'] as String?),
      subRegion: json['subRegion'] as String? ?? '',
      currencies: currencies,
      languages: languages,
      borders:
          (json['borders'] as List<dynamic>?)?.cast<String>().toList() ??
              const [],
      area: (json['area'] as num?)?.toDouble(),
      flags: flags,
      flagIcon: alpha2 != null ? _flagEmoji(alpha2) : null,
      callingCodes: (json['callingCodes'] as List<dynamic>?)
              ?.cast<String>()
              .toList() ??
          const [],
      latitude: lat,
      longitude: lng,
      timeZones: timeZones,
      translations: translations,
      altSpellings: (json['altSpellings'] as List<dynamic>?)
              ?.cast<String>()
              .toList() ??
          const [],
      demonym: json['demonym'] as String?,
    );
  }

  /// Returns the translation for the given ISO 639-3 language code, or null.
  String? translate(String code) => translations[code];

  /// Latitude/longitude as a named record. Null if either coordinate is absent.
  ({double lat, double lng})? get coordinates =>
      latitude != null && longitude != null
          ? (lat: latitude!, lng: longitude!)
          : null;
}

/// Converts ISO 3166-1 alpha-2 code to its regional-indicator flag emoji.
/// Returns an empty string if [alpha2] is not exactly two ASCII letters.
String _flagEmoji(String alpha2) {
  final upper = alpha2.toUpperCase();
  if (upper.length != 2 ||
      upper.codeUnitAt(0) < 0x41 ||
      upper.codeUnitAt(0) > 0x5A ||
      upper.codeUnitAt(1) < 0x41 ||
      upper.codeUnitAt(1) > 0x5A) {
    return '';
  }
  const base = 0x1F1E6 - 0x41;
  return String.fromCharCodes(upper.codeUnits.map((c) => base + c));
}

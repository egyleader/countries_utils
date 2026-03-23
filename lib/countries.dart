import 'package:countries_utils/src/models/country.dart';
import 'package:countries_utils/src/models/currency.dart';
import 'package:countries_utils/src/models/language.dart';
import 'package:countries_utils/src/models/region.dart';
import 'package:countries_utils/src/models/timezone.dart';
import 'package:countries_utils/countries_data.dart';
import 'package:countries_utils/src/extensions/country_list_x.dart';

export 'src/models/country.dart';
export 'src/models/currency.dart';
export 'src/models/language.dart';
export 'src/models/region.dart';
export 'src/models/timezone.dart';
export 'src/extensions/country_list_x.dart';

/// Query interface for the offline world countries dataset.
///
/// All methods return immutable [Country] value objects.
/// Single-lookup methods return [Country?] (null when not found).
final class Countries {
  Countries._();

  static final List<Country> _all = List.unmodifiable(
    countriesData.map(Country.fromJson).toList(),
  );

  // ── Collection queries ─────────────────────────────────────────────────────

  /// All 250 countries.
  static List<Country> all() => _all;

  /// Countries in [region].
  static List<Country> byRegion(Region region) => _all.byRegion(region);

  /// Countries using [isoCode] currency (e.g. `'USD'`).
  static List<Country> withCurrency(String isoCode) =>
      _all.withCurrency(isoCode);

  /// Countries with [isoCode] as an official language (ISO 639-3).
  static List<Country> withLanguage(String isoCode) =>
      _all.withLanguage(isoCode);

  /// Countries whose calling code starts with [prefix] (e.g. `'1'`).
  static List<Country> withDialCode(String prefix) =>
      _all.withDialCode(prefix);

  /// Countries sharing a land border with the country identified by [alpha3].
  static List<Country> bordersOf(String alpha3) {
    final country = byAlpha3Code(alpha3);
    if (country == null) return const [];
    return _all.borderingCountries(country.borders);
  }

  /// Countries larger than [km2] km².
  static List<Country> areaBiggerThan(double km2) =>
      _all.areaBiggerThan(km2);

  /// Countries smaller than [km2] km².
  static List<Country> areaSmallerThan(double km2) =>
      _all.areaSmallerThan(km2);

  /// All UN member countries.
  static List<Country> unMembers() => _all.unMembers;

  /// All independent countries.
  static List<Country> independent() => _all.independent;

  /// All landlocked countries.
  static List<Country> landlocked() => _all.landlocked;

  /// Case-insensitive search across name, nativeName, altSpellings, capital.
  static List<Country> search(String query) => _all.search(query);

  /// All unique currencies across all countries.
  static List<Currency> currencies() {
    final seen = <String>{};
    return [
      for (final c in _all)
        for (final cu in c.currencies)
          if (seen.add(cu.code)) cu,
    ];
  }

  /// All unique languages across all countries.
  static List<Language> languages() {
    final seen = <String>{};
    return [
      for (final c in _all)
        for (final l in c.languages)
          if (seen.add(l.code)) l,
    ];
  }

  // ── Single-country lookups (return null when not found) ────────────────────

  /// Country by common name. Returns null if not found.
  static Country? byName(String name) =>
      _all.firstWhereOrNull((c) => c.name == name);

  /// Country by ISO 3166-1 alpha-2 code (e.g. `'US'`). Returns null if not found.
  static Country? byCode(String code) => _all.byCode(code);

  /// Country by ISO 3166-1 alpha-3 code (e.g. `'USA'`). Returns null if not found.
  static Country? byAlpha3Code(String code) =>
      _all.firstWhereOrNull((c) => c.alpha3Code == code);

  /// Country by ISO 3166-1 numeric code (e.g. `'840'`). Returns null if not found.
  static Country? byNumericCode(String code) =>
      _all.firstWhereOrNull((c) => c.numericCode == code);

  /// Country by dial/calling code (e.g. `'1'` for +1). Returns null if not found.
  static Country? byDialCode(String code) =>
      _all.firstWhereOrNull((c) => c.callingCodes.contains(code));

  /// Country by capital city name. Returns null if not found.
  static Country? byCapital(String capital) =>
      _all.firstWhereOrNull((c) => c.capital == capital);

  /// Country by flag emoji (e.g. `'🇺🇸'`). Returns null if not found.
  static Country? byFlag(String flag) =>
      _all.firstWhereOrNull((c) => c.flagIcon == flag);

  /// Countries sharing the given [timeZone] offset.
  static List<Country> byTimeZone(TimeZone timeZone) =>
      _all.where((c) => c.timeZones.contains(timeZone)).toList();
}

// Convenience extension used internally.
extension<T> on List<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (final e in this) {
      if (test(e)) return e;
    }
    return null;
  }
}

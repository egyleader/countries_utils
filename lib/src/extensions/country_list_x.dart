import '../models/country.dart';
import '../models/region.dart';

/// Fluent query extensions on [List<Country>].
extension CountryListX on List<Country> {
  /// All countries in [region].
  List<Country> byRegion(Region region) =>
      where((c) => c.region == region).toList();

  /// Countries whose name, nativeName, altSpellings, or capital contains [query]
  /// (case-insensitive).
  List<Country> search(String query) {
    final q = query.toLowerCase();
    return where((c) =>
        (c.name ?? '').toLowerCase().contains(q) ||
        c.nativeName.toLowerCase().contains(q) ||
        c.altSpellings.any((s) => s.toLowerCase().contains(q)) ||
        (c.capital ?? '').toLowerCase().contains(q)).toList();
  }

  /// Countries using the given ISO 4217 currency code (e.g. `'USD'`).
  List<Country> withCurrency(String isoCode) => where((c) =>
      c.currencies.any((cu) => cu.code.toUpperCase() == isoCode.toUpperCase()))
      .toList();

  /// Countries where [isoCode] is an official language (ISO 639-3).
  List<Country> withLanguage(String isoCode) => where((c) =>
      c.languages.any((l) => l.code.toLowerCase() == isoCode.toLowerCase()))
      .toList();

  /// Countries whose calling code starts with [prefix] (e.g. `'1'` for +1).
  List<Country> withDialCode(String prefix) =>
      where((c) => c.callingCodes.any((cc) => cc.startsWith(prefix))).toList();

  /// Countries bordering [alpha3Codes] (accepts alpha-3 codes).
  List<Country> borderingCountries(List<String> alpha3Codes) =>
      where((c) => alpha3Codes.any((code) => c.borders.contains(code)))
          .toList();

  /// Countries larger than [km2] square kilometres.
  List<Country> areaBiggerThan(double km2) =>
      where((c) => (c.area ?? 0) > km2).toList();

  /// Countries smaller than [km2] square kilometres.
  List<Country> areaSmallerThan(double km2) =>
      where((c) => c.area != null && c.area! < km2).toList();

  /// UN member countries.
  List<Country> get unMembers => where((c) => c.unMember).toList();

  /// Independent countries.
  List<Country> get independent => where((c) => c.independent).toList();

  /// Landlocked countries.
  List<Country> get landlocked => where((c) => c.landLocked).toList();

  /// Sorted alphabetically by [Country.name].
  List<Country> get sortedByName {
    final copy = [...this];
    copy.sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));
    return copy;
  }

  /// Sorted by area, largest first.
  List<Country> get sortedByArea {
    final copy = [...this];
    copy.sort((a, b) => (b.area ?? 0).compareTo(a.area ?? 0));
    return copy;
  }

  /// Look up a single country by alpha-2 code. Returns null if not found.
  Country? byCode(String alpha2) =>
      where((c) => c.alpha2Code?.toUpperCase() == alpha2.toUpperCase())
          .firstOrNull;
}

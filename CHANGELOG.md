# Changelog

## 2.0.0 — 2026-03-23

**Major release.** Full Dart 3 modernization, immutable models via `freezed`, automated data sync pipeline, and a null-safe query API. Not backwards-compatible with 1.x.

### Breaking Changes

| 1.x | 2.0.0 |
|-----|-------|
| `country.currnecies` | `country.currencies` (typo fixed) |
| `country.fromJosn()` | `country.fromJson()` (typo fixed, generated) |
| `Countries.byCode()` returns `Country` (throws on miss) | Returns `Country?` (null-safe) |
| `Countries.byName()` returns `Country` (throws on miss) | Returns `Country?` |
| `Countries.byRegion(String)` | `Countries.byRegion(Region)` — takes enum |
| `Countries.byCallingCode(String)` | `Countries.byDialCode(String)` |
| `CountryList`, `CurrencyList`, `TimeZoneList` wrapper classes | Plain `List<Country>`, `List<Currency>`, etc. |
| `country.region` is `String?` | `country.region` is `Region` enum |
| `country.latitude` / `country.longitude` | `country.coordinates?.lat` / `country.coordinates?.lng` (record) |
| `country.timeZones` is `List<String>` | `country.timeZones` is `List<TimeZone>` |

### Migration Guide

```dart
// 1.x
final country = Countries.byCode('US'); // throws if not found
print(country.currnecies?.currencies?.first?.name);
Countries.byRegion('Asia');
Countries.byCallingCode('93');

// 2.0.0
final country = Countries.byCode('US'); // returns null if not found
print(country?.currencies.first.name);
Countries.byRegion(Region.asia);
Countries.byDialCode('93');
```

### New Features

- **Dart 3** — SDK constraint `>=3.4.0 <4.0.0`, full null-safety
- **`freezed` models** — immutable `Country`, `Currency`, `Language`, `TimeZone` with value equality, `copyWith`, and `toString`
- **`Region` enum** — `africa`, `americas`, `antarctic`, `asia`, `europe`, `oceania`, `unknown` with `displayName`
- **`Country.coordinates`** — Dart record `({double lat, double lng})?` replacing separate lat/lng fields
- **`Country.flagIcon`** — derived flag emoji from `alpha2Code`, no extra field
- **`Country.translate(String isoCode)`** — returns translated name for ISO 639-3 language code
- **New query methods on `Countries`:**
  - `Countries.search(String query)` — fuzzy match on name, nativeName, altSpellings, capital
  - `Countries.withCurrency(String code)` — filter by ISO 4217 currency code
  - `Countries.withLanguage(String code)` — filter by ISO 639-3 language code
  - `Countries.withDialCode(String code)` — filter by calling code prefix
  - `Countries.landlocked()` — all landlocked countries
  - `Countries.bordersOf(String alpha3)` — countries bordering a given alpha-3 code
  - `Countries.currencies()` — all unique `Currency` objects
  - `Countries.languages()` — all unique `Language` objects
  - `Countries.byAlpha3Code(String)`, `Countries.byNumericCode(String)`, `Countries.byFlag(String)`, `Countries.byCapital(String)`
- **`CountryListX` extension** — fluent query methods on `List<Country>`:
  `byRegion`, `search`, `withCurrency`, `withLanguage`, `withDialCode`, `borderingCountries`, `areaBiggerThan`, `areaSmallerThan`, `unMembers`, `independent`, `landlocked`, `sortedByName`, `sortedByArea`, `byCode`
- **Data sync pipeline** — `dart tool/fetch_countries.dart` regenerates `lib/countries_data.dart` from REST Countries API v3.1; see `Makefile`

### Internal Changes

- Data now sourced from REST Countries API v3.1 — fetched in 3 batched requests merged by `cca2`
- `lib/countries_data.dart` is generated, not manually maintained (gitignored)
- Deleted `lib/models/country_list.dart`, `currency_list.dart`, `timezone_list.dart`
- Restructured `lib/` to `lib/src/models/` and `lib/src/extensions/`

---

## 1.0.1

- updated library name and file structures
- added dart docs support and generated docs
- enhanced comments for library and functions
- fixed test package in dependencies

## 1.0.0

- migrated to null safety
- fixed typos and improved stability
- made the package pure dart with no flutter dependencies
- migrated from old package *flutter_country* to **countries_utils**

## 0.1.1

- added Arabic Country names
- added new translate() method
- added timeZone() method
- added byTimeStamp method and test

## 0.1.0

- changed countries data to use restcountries data
- refactored methods to work with new sets
- removed unused methods and models

## 0.0.4

- fixed calling codes double xx in some countries

## 0.0.3

- removed flutter dependency, package now supports plain dart
- fixed bug with native name translation not found
- fixed typos

## 0.0.1

- initial release

# countries_utils

A lightweight, pure-Dart package for offline world countries data with a rich query API.

- **Zero Flutter dependency** — works in any Dart environment
- **Offline** — all data bundled, no network requests at runtime
- **Null-safe** — full Dart 3 null safety; queries return `Country?`, never throw
- **Immutable models** — `freezed`-powered `Country`, `Currency`, `Language`, `TimeZone`
- **Rich query API** — 20+ static methods plus fluent `List<Country>` extensions

> Data sourced from [REST Countries API v3.1](https://restcountries.com) (249 countries).
> Regenerate anytime: `dart tool/fetch_countries.dart`

---

## Installation

```yaml
dependencies:
  countries_utils: ^2.0.0
```

---

## Quick Start

```dart
import 'package:countries_utils/countries_utils.dart';

void main() {
  // Lookup by code — returns null if not found
  final us = Countries.byCode('US')!;
  print('${us.name} ${us.flagIcon}');      // United States 🇺🇸
  print(us.capital);                        // Washington, D.C.
  print(us.region.displayName);             // Americas
  print(us.coordinates?.lat);               // 38.0

  // All countries in a region
  final asia = Countries.byRegion(Region.asia);
  print('Asia: ${asia.length} countries');

  // Search (name, native name, alt spellings, capital)
  final results = Countries.search('united');
  results.forEach((c) => print('${c.name} ${c.flagIcon}'));

  // Currencies of a country
  final eg = Countries.byCode('EG')!;
  for (final c in eg.currencies) {
    print('${c.name} (${c.code}) ${c.symbol}');  // Egyptian Pound (EGP) £
  }

  // Countries using USD
  final usd = Countries.withCurrency('USD');
  print('Countries using USD: ${usd.length}');
}
```

---

## API Reference

### `Countries` — static query class

#### Lookup (return `Country?`)

| Method | Description |
|--------|-------------|
| `Countries.byCode(String alpha2)` | ISO 3166-1 alpha-2 (e.g. `'US'`) |
| `Countries.byAlpha3Code(String)` | ISO 3166-1 alpha-3 (e.g. `'USA'`) |
| `Countries.byNumericCode(String)` | ISO 3166-1 numeric (e.g. `'840'`) |
| `Countries.byName(String)` | Common English name |
| `Countries.byCapital(String)` | Capital city name |
| `Countries.byFlag(String)` | Flag emoji (e.g. `'🇺🇸'`) |
| `Countries.byDialCode(String)` | Calling code (e.g. `'1'`) |
| `Countries.byTimeZone(TimeZone)` | UTC offset (e.g. `TimeZone(offset: '+05:30')`) |

#### Filter (return `List<Country>`)

| Method | Description |
|--------|-------------|
| `Countries.all()` | All 249 countries |
| `Countries.byRegion(Region)` | Countries in a region |
| `Countries.unMembers()` | UN member states |
| `Countries.independent()` | Sovereign independent states |
| `Countries.landlocked()` | Countries with no sea access |
| `Countries.areaBiggerThan(double km2)` | Countries larger than area |
| `Countries.areaSmallerThan(double km2)` | Countries smaller than area |
| `Countries.search(String query)` | Fuzzy search on name, native, alt spellings, capital |
| `Countries.withCurrency(String code)` | Filter by ISO 4217 currency code |
| `Countries.withLanguage(String code)` | Filter by ISO 639-3 language code |
| `Countries.withDialCode(String code)` | Filter by calling code prefix |
| `Countries.bordersOf(String alpha3)` | Countries bordering the given alpha-3 code |

#### Data

| Method | Description |
|--------|-------------|
| `Countries.currencies()` | All unique `Currency` objects |
| `Countries.languages()` | All unique `Language` objects |

---

### `Country` model

```dart
country.name              // 'United States'
country.alpha2Code        // 'US'
country.alpha3Code        // 'USA'
country.numericCode       // '840'
country.officialName      // 'United States of America'
country.nativeName        // native language name
country.capital           // 'Washington, D.C.'
country.region            // Region.americas
country.subRegion         // 'Northern America'
country.continent         // 'North America'
country.flagIcon          // '🇺🇸' (derived from alpha2Code)
country.flags             // ['https://...svg', 'https://...png']
country.currencies        // List<Currency>
country.languages         // List<Language>
country.timeZones         // List<TimeZone>
country.coordinates       // ({double lat, double lng})?
country.area              // 9372610.0 (km²)
country.borders           // ['CAN', 'MEX'] alpha-3 codes
country.landLocked        // false
country.unMember          // true
country.independent       // true
country.altSpellings      // ['US', 'USA', ...]
country.translations      // {'fra': 'États-Unis', 'ara': '...'}
country.demonym           // 'American'
country.callingCodes      // ['1']
country.topLevelDomain    // ['.us']

// Methods
country.translate('fra')  // 'États-Unis'
country.translate('ara')  // Arabic name
```

---

### `Region` enum

```dart
Region.africa
Region.americas
Region.antarctic
Region.asia
Region.europe
Region.oceania
Region.unknown

Region.asia.displayName      // 'Asia'
Region.fromString('Europe')  // Region.europe
```

---

### `CountryListX` — extension on `List<Country>`

```dart
final countries = Countries.all();

countries.byRegion(Region.europe)
countries.search('stan')
countries.withCurrency('EUR')
countries.withLanguage('ara')          // ISO 639-3
countries.withDialCode('1')
countries.borderingCountries(us)
countries.areaBiggerThan(1000000)
countries.areaSmallerThan(1)
countries.unMembers
countries.independent
countries.landlocked
countries.sortedByName()
countries.sortedByArea()
countries.byCode('DE')                 // Country?
```

---

## Data Sync

The bundled data can be regenerated from the upstream API at any time:

```bash
dart tool/fetch_countries.dart
# or
make sync-data
```

Other Makefile targets:

```bash
make generate   # dart run build_runner build
make test       # dart test
make all        # sync-data + generate + test
```

---

## Migration from 1.x

See [CHANGELOG.md](CHANGELOG.md) for the full breaking changes table.

Key changes:
- Typos fixed: `currnecies` → `currencies`, `fromJosn` → `fromJson`
- All single-lookup methods return `Country?` instead of throwing
- `byRegion()` takes `Region` enum instead of `String`
- `byCallingCode()` renamed to `byDialCode()`
- Wrapper classes (`CountryList`, `CurrencyList`, `TimeZoneList`) removed

---

## Contributing

Contributions welcome. For data updates run `make sync-data` to pull the latest from the upstream API before submitting a PR.

## Credits

Data sourced from [REST Countries API v3.1](https://restcountries.com).

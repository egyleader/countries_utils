import 'package:countries_utils/countries.dart';
import 'package:test/test.dart';

void main() {
  test('get all countries data', () {
    final result = Countries.all();
    expect(result.length, greaterThan(200));
    expect(result.length, lessThan(260));
  });

  test('get country by name', () {
    final country = Countries.byName('Afghanistan');
    expect(country!.alpha2Code, equals('AF'));
  });

  test('get country all  Native name translations', () {
    final nativeName = Countries.byName('Afghanistan')!.nativeName;
    expect(nativeName, isNotNull);
    expect(nativeName, isNotEmpty);
  });

  test('get country Native name translations', () {
    final nativeName = Countries.byName('Afghanistan')!.nativeName;
    expect(nativeName, isNotNull);
    expect(nativeName, isNotEmpty);
  });

  test('get country all  name translations', () {
    final translations = Countries.byName('Afghanistan')!.translations;
    expect(translations, isNotNull);
    expect(translations, isNotEmpty);
  });

  test('get country all  name altSpellings', () {
    final altSpellings = Countries.byName('Afghanistan')!.altSpellings;
    expect(altSpellings, isNotNull);
    expect(altSpellings, isNotEmpty);
  });

  test('get country all  name demonym', () {
    final demonym = Countries.byName('Afghanistan')!.demonym;
    expect(demonym, isNotNull);
    expect(demonym, isNotEmpty);
  });

  test('get country all currencies', () {
    final currencies = Countries.byName('Afghanistan')!.currencies;
    expect(currencies, isNotNull);
  });

  test('get country name translated to one language ', () {
    // v3.1 uses ISO 639-3 codes (3-letter: 'ara') not ISO 639-1 (2-letter: 'ar')
    final translated = Countries.byName('Afghanistan')!.translate('ara');
    expect(translated, isNotNull);
    expect(translated, isNotEmpty);
  });

  test('get country by timeZone ', () {
    // TimeZone now has value equality via freezed
    final result = Countries.byTimeZone(const TimeZone(offset: '+04:30'));
    expect(result, isA<List<Country>>());
    expect(result, isNotEmpty);
  });

  test('get country by alpha2Code', () {
    final country = Countries.byCode('AF');
    expect(country!.name, contains('Afghanistan'));
    expect(country.alpha2Code, equals('AF'));
  });

  test('get country by alpha3Code', () {
    final country = Countries.byAlpha3Code('AFG');
    expect(country!.alpha2Code, equals('AF'));
  });

  test('get country by byNumericCode', () {
    final country = Countries.byNumericCode('004');
    expect(country!.alpha2Code, equals('AF'));
  });

  test('get country by byDialCode', () {
    final country = Countries.byDialCode('93');
    expect(country!.alpha2Code, equals('AF'));
  });

  test('get country by capital', () {
    final country = Countries.byCapital('Kabul');
    expect(country!.alpha2Code, equals('AF'));
  });

  test('get country by flag emoji ', () {
    final country = Countries.byFlag('🇦🇫');
    expect(country!.alpha2Code, equals('AF'));
  });

  test('get UN Members countries', () {
    final result = Countries.unMembers();
    expect(result, isNotEmpty);
    expect(result.length, greaterThan(150));
  });

  test('get independent countries', () {
    final result = Countries.independent();
    expect(result, isNotEmpty);
  });

  test('get countries by region ', () {
    final result = Countries.byRegion(Region.asia);
    expect(result, isNotEmpty);
    expect(result.every((c) => c.region == Region.asia), isTrue);
  });

  test('get countries Bigger than given area  ', () {
    final result = Countries.areaBiggerThan(1000000);
    expect(result, isNotEmpty);
    expect(result.any((c) => c.alpha2Code == 'RU'), isTrue);
  });

  test('get countries Smaller than given area  ', () {
    final result = Countries.areaSmallerThan(1);
    expect(result, isNotEmpty);
  });

  test('test country is landlocked', () {
    final landLocked = Countries.byName('Afghanistan')!.landLocked;
    expect(landLocked, isTrue);
  });

  test('test country border countries', () {
    final borders = Countries.byName('Afghanistan')!.borders;
    expect(borders, isNotNull);
    expect(borders, isNotEmpty);
  });

  test('get landlocked countries', () {
    final result = Countries.landlocked();
    expect(result, isNotEmpty);
    expect(result.any((c) => c.alpha2Code == 'AF'), isTrue);
  });

  test('search countries', () {
    final result = Countries.search('afgh');
    expect(result, isNotEmpty);
    expect(result.any((c) => c.alpha2Code == 'AF'), isTrue);
  });

  test('get countries with currency', () {
    final result = Countries.withCurrency('USD');
    expect(result, isNotEmpty);
  });

  test('get countries with language', () {
    final result = Countries.withLanguage('pus');
    expect(result, isNotEmpty);
    expect(result.any((c) => c.alpha2Code == 'AF'), isTrue);
  });

  test('get countries with dial code', () {
    final result = Countries.withDialCode('1');
    expect(result, isNotEmpty);
  });

  test('get all currencies', () {
    final result = Countries.currencies();
    expect(result, isNotEmpty);
  });

  test('get all languages', () {
    final result = Countries.languages();
    expect(result, isNotEmpty);
  });

  // --- TimeZone.parse edge cases ---

  test('TimeZone.parse UTC returns +00:00', () {
    final tz = TimeZone.parse('UTC');
    expect(tz.offset, equals('+00:00'));
  });

  test('TimeZone.parse positive offset', () {
    final tz = TimeZone.parse('UTC+05:30');
    expect(tz.offset, equals('+05:30'));
  });

  test('TimeZone.parse negative offset', () {
    final tz = TimeZone.parse('UTC-03:00');
    expect(tz.offset, equals('-03:00'));
  });

  test('TimeZone.parse throws on malformed string', () {
    expect(() => TimeZone.parse('bad-data'), throwsA(isA<FormatException>()));
  });

  test('TimeZone.parse throws on out-of-range offset', () {
    expect(() => TimeZone.parse('UTC+25:00'), throwsA(isA<FormatException>()));
  });

  // --- Country.fromJson robustness ---

  test('Country.fromJson empty map returns defaults without throwing', () {
    final country = Country.fromJson({});
    expect(country.name, isNull);
    expect(country.currencies, isEmpty);
    expect(country.languages, isEmpty);
    expect(country.timeZones, isEmpty);
    expect(country.region, equals(Region.unknown));
  });

  // --- flagIcon correctness ---

  test('flagIcon for US is the US flag emoji', () {
    final us = Countries.byCode('US')!;
    expect(us.flagIcon, equals('🇺🇸'));
  });

  test('flagIcon for EG is the Egyptian flag emoji', () {
    final eg = Countries.byCode('EG')!;
    expect(eg.flagIcon, equals('🇪🇬'));
  });

  // --- Not-found paths ---

  test('byCode returns null for unknown code', () {
    expect(Countries.byCode('XX'), isNull);
  });

  test('byName returns null for unknown name', () {
    expect(Countries.byName('NonExistentCountry'), isNull);
  });

  // --- Region.fromString ---

  test('Region.fromString returns correct enum value', () {
    expect(Region.fromString('Europe'), equals(Region.europe));
    expect(Region.fromString('Asia'), equals(Region.asia));
  });

  test('Region.fromString returns unknown for unrecognised string', () {
    expect(Region.fromString('Narnia'), equals(Region.unknown));
    expect(Region.fromString(null), equals(Region.unknown));
  });

  // --- Empty / no-match filter results ---

  test('withCurrency returns empty list for unknown code', () {
    expect(Countries.withCurrency('XYZ'), isEmpty);
  });

  test('withLanguage returns empty list for unknown code', () {
    expect(Countries.withLanguage('zzz'), isEmpty);
  });

  test('search with empty string returns all countries', () {
    final result = Countries.search('');
    expect(result.length, equals(Countries.all().length));
  });

  // --- bordersOf ---

  test('bordersOf USA returns countries including Canada and Mexico', () {
    final neighbors = Countries.bordersOf('USA');
    expect(neighbors, isNotEmpty);
    expect(neighbors.any((c) => c.alpha3Code == 'CAN'), isTrue);
    expect(neighbors.any((c) => c.alpha3Code == 'MEX'), isTrue);
  });
}

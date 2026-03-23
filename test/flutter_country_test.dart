import 'package:countries_utils/countries.dart';
import 'package:countries_utils/models/timezone.dart';
import 'package:test/test.dart';

void main() {
  test('get all countries data', () {
    final result = Countries.all();
    expect(result.countries.length, greaterThan(200));
    expect(result.countries.length, lessThan(260));
  });

  test('get country by name', () {
    final country = Countries.byName('Afghanistan');
    expect(country.alpha2Code, equals('AF'));
  });

  test('get country all  Native name translations', () {
    final nativeName = Countries.byName('Afghanistan').nativeName;
    expect(nativeName, isNotNull);
    expect(nativeName, isNotEmpty);
  });

  test('get country Native name translations', () {
    final nativeName = Countries.byName('Afghanistan').nativeName;
    expect(nativeName, isNotNull);
    expect(nativeName, isNotEmpty);
  });

  test('get country all  name translations', () {
    final translations = Countries.byName('Afghanistan').translations;
    expect(translations, isNotNull);
    expect(translations, isNotEmpty);
  });

  test('get country all  name altSpellings', () {
    final altSpellings = Countries.byName('Afghanistan').altSpellings;
    expect(altSpellings, isNotNull);
    expect(altSpellings, isNotEmpty);
  });

  test('get country all  name demonym', () {
    final demonym = Countries.byName('Afghanistan').demonym;
    expect(demonym, isNotNull);
    expect(demonym, isNotEmpty);
  });

  test('get country all currnecies', () {
    final currnecies = Countries.byName('Afghanistan').currnecies;
    expect(currnecies, isNotNull);
  });

  test('get country name translated to one language ', () {
    final translated = Countries.byName('Afghanistan').translate('ar');
    expect(translated, isNotNull);
    expect(translated, isNotEmpty);
  });

  test('get country by timeZone ', () {
    final result = Countries.byTimeZone(
            TimeZone(offset: Duration(hours: 02, minutes: 00), offsetType: '+'))
        .countries
        .length;
    expect(result, greaterThan(0));
  });

  test('get country by alpha2Code', () {
    final country = Countries.byCode('AF');
    expect(country.name, contains('Afghanistan'));
    expect(country.alpha2Code, equals('AF'));
  });

  test('get country by alpha3Code', () {
    final country = Countries.byAlpha3Code('AFG');
    expect(country.alpha2Code, equals('AF'));
  });

  test('get country by byNumericCode', () {
    final country = Countries.byNumericCode('004');
    expect(country.alpha2Code, equals('AF'));
  });

  test('get country by byCallingCode', () {
    final country = Countries.byCallingCode('93');
    expect(country.alpha2Code, equals('AF'));
  });

  test('get country by capital', () {
    final country = Countries.byCapital('Kabul');
    expect(country.alpha2Code, equals('AF'));
  });

  test('get country by flag emoji ', () {
    final country = Countries.byFlag('🇦🇫');
    expect(country.alpha2Code, equals('AF'));
  });

  // test('get country by language  code', () => Countries.byLanguageCode('ara'));

  // test(
  //     'get country by language name', () => Countries.byLanguageName('Arabic'));

  test('get UN Members countries', () {
    final result = Countries.unMembers();
    expect(result.countries.length, greaterThan(150));
  });

  test('get UN Members countries', () {
    final result = Countries.independent();
    expect(result.countries, isNotEmpty);
  });

  test('get countries by region ', () {
    final result = Countries.byRegion('Asia');
    expect(result, isNotEmpty);
    expect(result.every((c) => c.region == 'Asia'), isTrue);
  });

  test('get countries by area  ', () {
    final result = Countries.byArea(1002450);
    expect(result, isNotNull);
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
    final landLocked = Countries.byName('Afghanistan').landLocked;
    expect(landLocked, isNotNull);
  });

  test('test country border countries', () {
    final borders = Countries.byName('Afghanistan').borders;
    expect(borders, isNotNull);
    expect(borders, isNotEmpty);
  });
}

import 'package:flutter_country/flutter_country.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('get all countries data', () {
    Countries.all();
  });
  test('get country by name', () {
    Countries.byName('Aruba');
  });
  test('get country by alpha2Code', () {
    Countries.byCode('EG');
  });
  test('get country by alpha3Code', () {
    Countries.byAlpha3Code('AGO');
  });
  test('get country by capital', () {
    Countries.byCapital('Cairo');
  });
  test('get country by flag emoji ', () {
    Countries.byFlag('\ud83c\uddea\ud83c\uddec');
  });
  test('get country by language  code', () {
    Countries.byLanguageCode('ara').forEach((c) {  print(c.name);});
  });
}

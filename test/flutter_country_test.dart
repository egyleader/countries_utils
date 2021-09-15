import 'package:countries_utils/countries.dart';
import 'package:countries_utils/models/timezone.dart';
import 'package:test/test.dart';

void main() {
  test('get all countries data', () => Countries.all());

  test('get country by name', () => Countries.byName('Egypt'));

  test('get country all  Native name translations',
      () => Countries.byName('Egypt').nativeName);

  test('get country Native name translations',
      () => Countries.byName('Egypt').nativeName);

  test('get country all  name translations',
      () => Countries.byName('Egypt').translations);

  test('get country all  name altSpellings',
      () => Countries.byName('Egypt').altSpellings);

  test(
      'get country all  name demonym', () => Countries.byName('Egypt').demonym);

  test(
      'get country all currnecies', () => Countries.byName('Egypt').currnecies);

  test('get country name translated to one language ',
      () => Countries.byName('Egypt').translate('ar'));

  test(
      'get country by timeZone ',
      () => print(Countries.byTimeZone(TimeZone(
              offset: Duration(hours: 02, minutes: 00), offsetType: '+'))
          .countries
          .length));

  test('get country by alpha2Code', () => Countries.byCode('EG'));

  test('get country by alpha3Code', () => Countries.byAlpha3Code('EGY'));

  test('get country by byNumericCode', () => Countries.byNumericCode('818'));

  test('get country by byCallingCode', () => Countries.byCallingCode('20'));

  test('get country by capital', () => Countries.byCapital('Cairo'));

  test('get country by flag emoji ',
      () => Countries.byFlag('\ud83c\uddea\ud83c\uddec'));

  // test('get country by language  code', () => Countries.byLanguageCode('ara'));

  // test(
  //     'get country by language name', () => Countries.byLanguageName('Arabic'));

  test('get UN Members countries', () => Countries.unMembers());

  test('get UN Members countries', () => Countries.independent());

  test('get countries by region ', () => Countries.byRegion('Africa'));

  test('get countries by area  ', () => Countries.byArea(1002450));
  test('get countries Bigger than given area  ',
      () => Countries.areaBiggerThan(1002450));

  test('get countries Smaller than given area  ',
      () => Countries.areaSmallerThan(1002450));

  test(
      'test country is landlocked', () => Countries.byName('Egypt').landLocked);
  test(
      'test country border countries', () => Countries.byName('Egypt').borders);
}

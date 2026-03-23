import 'package:countries_utils/countries_utils.dart';

void main() {
  // 1. Total count
  final all = Countries.all().countries;
  print('Total countries: ${all.length}');
  print('');

  // 2. Lookup by code
  final us = Countries.byCode('US');
  print('=== United States ===');
  print('  Name:     ${us.name}  ${us.flagIcon}');
  print('  Capital:  ${us.capital}');
  print('  Region:   ${us.region}');
  print('  Area:     ${us.area} km²');
  print('');

  // 3. Countries by region
  final asia = Countries.byRegion('Asia');
  print('Countries in Asia: ${asia.length}');
  asia.take(5).forEach((c) => print('  - ${c.name} ${c.flagIcon}'));
  print('');

  // 4. UN Members
  final unMembers = Countries.unMembers().countries;
  print('UN Members: ${unMembers.length}');
  print('');

  // 5. Largest countries by area
  final large = Countries.areaBiggerThan(2_000_000);
  print('Countries larger than 2,000,000 km²:');
  large.forEach((c) => print('  - ${c.name}: ${c.area} km²'));
  print('');

  // 6. Currencies of a country
  final eg = Countries.byCode('EG');
  final currencies = eg.currnecies?.currencies ?? [];
  print('Egypt currencies:');
  currencies.forEach((c) => print('  - ${c.name} (${c.code}) ${c.symbol}'));
}

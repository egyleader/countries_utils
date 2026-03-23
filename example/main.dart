import 'package:countries_utils/countries_utils.dart';

void main() {
  // 1. Total count
  final all = Countries.all();
  print('Total countries: ${all.length}');
  print('');

  // 2. Lookup by code (returns Country? — null if not found)
  final us = Countries.byCode('US')!;
  print('=== United States ===');
  print('  Name:     ${us.name}  ${us.flagIcon}');
  print('  Capital:  ${us.capital}');
  print('  Region:   ${us.region.displayName}');
  print('  Area:     ${us.area} km²');
  print('');

  // 3. Countries by region (takes Region enum)
  final asia = Countries.byRegion(Region.asia);
  print('Countries in Asia: ${asia.length}');
  asia.take(5).forEach((c) => print('  - ${c.name} ${c.flagIcon}'));
  print('');

  // 4. UN Members
  final unMembers = Countries.unMembers();
  print('UN Members: ${unMembers.length}');
  print('');

  // 5. Largest countries by area
  final large = Countries.areaBiggerThan(2000000);
  print('Countries larger than 2,000,000 km²:');
  for (final c in large) {
    print('  - ${c.name}: ${c.area} km²');
  }
  print('');

  // 6. Currencies of a country
  final eg = Countries.byCode('EG')!;
  print('Egypt currencies:');
  for (final c in eg.currencies) {
    print('  - ${c.name} (${c.code}) ${c.symbol}');
  }
  print('');

  // 7. Search
  final results = Countries.search('united');
  print('Search "united": ${results.length} countries');
  results.forEach((c) => print('  - ${c.name}'));
  print('');

  // 8. Countries with USD currency
  final usd = Countries.withCurrency('USD');
  print('Countries using USD: ${usd.length}');
}

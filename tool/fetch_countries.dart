// To run: dart tool/fetch_countries.dart
// (No extra dependencies needed — uses dart:io HttpClient)

// GENERATED TOOL — fetches country data and regenerates lib/countries_data.dart
// Source: REST Countries API v3.1 (https://restcountries.com)

import 'dart:convert';
import 'dart:io';

// REST Countries v3.1 requires a fields param and limits to ≤10 fields per request.
// We make 3 batched requests and merge results by cca2 code.
const _baseUrl = 'https://restcountries.com/v3.1/all';
const _batches = [
  '$_baseUrl?fields=name,cca2,cca3,ccn3,currencies,languages,capital,region,subregion,timezones',
  '$_baseUrl?fields=cca2,borders,area,flags,latlng,altSpellings,translations,independent,unMember,landlocked',
  '$_baseUrl?fields=cca2,demonyms,idd,tld,cioc,maps,continents',
];

const _outputPath = 'lib/countries_data.dart';

Future<List<dynamic>> _fetch(HttpClient client, String url) async {
  final request = await client.getUrl(Uri.parse(url));
  final response = await request.close();
  if (response.statusCode != 200) {
    stderr.writeln('Error: HTTP ${response.statusCode} for $url');
    client.close();
    exit(1);
  }
  final body = await response.transform(utf8.decoder).join();
  return jsonDecode(body) as List<dynamic>;
}

Future<void> main() async {
  stdout.writeln('Fetching country data from REST Countries v3.1 API (3 batches)...');
  final client = HttpClient();

  // 1. Fetch all 3 batches
  final batch1 = await _fetch(client, _batches[0]);
  stdout.writeln('  Batch 1: ${batch1.length} countries');
  final batch2 = await _fetch(client, _batches[1]);
  stdout.writeln('  Batch 2: ${batch2.length} countries');
  final batch3 = await _fetch(client, _batches[2]);
  stdout.writeln('  Batch 3: ${batch3.length} countries');
  client.close();

  // 2. Merge batches by cca2 code
  final merged = <String, Map<String, dynamic>>{};
  for (final b in [batch1, batch2, batch3]) {
    for (final entry in b) {
      final c = entry as Map<String, dynamic>;
      final code = c['cca2'] as String? ?? '';
      if (merged.containsKey(code)) {
        merged[code]!.addAll(c);
      } else {
        merged[code] = Map<String, dynamic>.from(c);
      }
    }
  }

  // 3. Map each merged country to internal schema
  final List<dynamic> raw = merged.values.toList();

  // 3. Map each country to internal schema
  final countries = raw
      .map((e) => _mapCountry(e as Map<String, dynamic>))
      .toList();

  // 4. Sort countries by name for stable output
  countries.sort((a, b) {
    final nameA = (a['name'] as String? ?? '').toLowerCase();
    final nameB = (b['name'] as String? ?? '').toLowerCase();
    return nameA.compareTo(nameB);
  });

  // 5. Generate Dart source code string
  final timestamp = DateTime.now().toUtc().toIso8601String();
  final buffer = StringBuffer();
  buffer.writeln('// GENERATED — do not edit by hand.');
  buffer.writeln('// Run: dart tool/fetch_countries.dart');
  buffer.writeln('// Source: REST Countries API v3.1 (https://restcountries.com)');
  buffer.writeln('// Generated: $timestamp — ${countries.length} countries');
  buffer.writeln();
  buffer.writeln('// ignore_for_file: lines_longer_than_80_chars, constant_identifier_names, inference_failure_on_collection_literal');
  buffer.writeln();
  buffer.writeln('const List<Map<String, dynamic>> countriesData = [');

  for (final country in countries) {
    buffer.write('  ');
    buffer.write(_dartMapLiteral(country, indent: '  '));
    buffer.writeln(',');
  }

  buffer.writeln('];');

  // 6. Write to lib/countries_data.dart
  final outFile = File(_outputPath);
  await outFile.writeAsString(buffer.toString());

  // 7. Print summary
  stdout.writeln('✓ Wrote ${countries.length} countries to $_outputPath');
}

/// Maps a single v3.1 API country object to the internal schema.
Map<String, dynamic> _mapCountry(Map<String, dynamic> c) {
  // name fields
  final nameObj = c['name'] as Map<String, dynamic>? ?? {};
  final name = nameObj['common'] as String? ?? '';
  final officialName = nameObj['official'] as String? ?? '';
  final nativeNameMap = nameObj['nativeName'] as Map<String, dynamic>?;
  String nativeName = '';
  if (nativeNameMap != null && nativeNameMap.isNotEmpty) {
    final first = nativeNameMap.values.first as Map<String, dynamic>?;
    nativeName = first?['common'] as String? ?? '';
  }

  // codes
  final alpha2Code = c['cca2'] as String? ?? '';
  final alpha3Code = c['cca3'] as String? ?? '';
  final numericCode = c['ccn3'] as String? ?? '';
  final cioc = c['cioc'] as String? ?? '';

  // currencies: map → list of {code, name, symbol}
  final currenciesRaw = c['currencies'] as Map<String, dynamic>?;
  final currencies = <Map<String, dynamic>>[];
  if (currenciesRaw != null) {
    for (final entry in currenciesRaw.entries) {
      final val = entry.value as Map<String, dynamic>? ?? {};
      currencies.add({
        'code': entry.key,
        'name': val['name'] as String? ?? '',
        'symbol': val['symbol'] as String? ?? '',
      });
    }
  }

  // languages: keep as map {code: name}
  final languagesRaw = c['languages'] as Map<String, dynamic>?;
  final languages = <String, String>{};
  if (languagesRaw != null) {
    for (final entry in languagesRaw.entries) {
      languages[entry.key] = entry.value as String? ?? '';
    }
  }

  // capital: first element of array
  final capitalList = c['capital'] as List<dynamic>?;
  final capital = capitalList != null && capitalList.isNotEmpty
      ? capitalList.first as String? ?? ''
      : '';

  // latlng: pass through
  final latlng = (c['latlng'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList() ??
      <double>[];

  // timezones: strip "UTC" prefix
  final timezonesRaw = c['timezones'] as List<dynamic>? ?? [];
  final timezones = timezonesRaw.map((tz) {
    final s = tz as String;
    if (s == 'UTC') return '00:00';
    return s.startsWith('UTC') ? s.substring(3) : s;
  }).toList();

  // flags: [svg, png]
  final flagsObj = c['flags'] as Map<String, dynamic>? ?? {};
  final flags = <String>[
    flagsObj['svg'] as String? ?? '',
    flagsObj['png'] as String? ?? '',
  ];

  // callingCodes: idd.root + first suffix
  final idd = c['idd'] as Map<String, dynamic>? ?? {};
  final iddRoot = idd['root'] as String? ?? '';
  final iddSuffixes = idd['suffixes'] as List<dynamic>? ?? [];
  final callingCodes = <String>[];
  if (iddRoot.isNotEmpty && iddSuffixes.isNotEmpty) {
    final code = '$iddRoot${iddSuffixes.first}';
    // strip leading '+' to match existing data format (e.g. "93" not "+93")
    callingCodes.add(code.startsWith('+') ? code.substring(1) : code);
  } else if (iddRoot.isNotEmpty) {
    final code = iddRoot;
    callingCodes.add(code.startsWith('+') ? code.substring(1) : code);
  }

  // other fields
  final landlocked = c['landlocked'] as bool? ?? false;
  final tld = (c['tld'] as List<dynamic>?)?.cast<String>() ?? <String>[];
  final demonymsObj = c['demonyms'] as Map<String, dynamic>? ?? {};
  final demonymEng = demonymsObj['eng'] as Map<String, dynamic>? ?? {};
  final demonym = demonymEng['m'] as String? ?? '';

  // translations: {"lang": {"common": "name"}} → {"lang": "name"}
  final translationsRaw = c['translations'] as Map<String, dynamic>? ?? {};
  final translations = <String, String>{};
  for (final entry in translationsRaw.entries) {
    final val = entry.value as Map<String, dynamic>? ?? {};
    translations[entry.key] = val['common'] as String? ?? '';
  }

  // pass-through fields
  final altSpellings =
      (c['altSpellings'] as List<dynamic>?)?.cast<String>() ?? <String>[];
  final borders =
      (c['borders'] as List<dynamic>?)?.cast<String>() ?? <String>[];
  final area = (c['area'] as num?)?.toDouble() ?? 0.0;
  // region from v3.1 = broad region (Asia, Europe…); subregion = detailed
  final region = c['region'] as String? ?? '';
  final subRegion = c['subregion'] as String? ?? '';
  // ignore: unused_local_variable — used below in return map
  final independent = c['independent'] as bool? ?? false;
  final unMember = c['unMember'] as bool? ?? false;
  final continentsList = c['continents'] as List<dynamic>? ?? [];
  final continent = continentsList.isNotEmpty
      ? continentsList.first as String? ?? ''
      : '';

  // maps
  final mapsObj = c['maps'] as Map<String, dynamic>? ?? {};
  final maps = <String, String>{
    'gmaps': mapsObj['googleMaps'] as String? ?? '',
    'openstreetmap': mapsObj['openStreetMaps'] as String? ?? '',
  };

  return {
    'alpha2Code': alpha2Code,
    'alpha3Code': alpha3Code,
    'altSpellings': altSpellings,
    'area': area,
    'borders': borders,
    'callingCodes': callingCodes,
    'capital': capital,
    'currencies': currencies,
    'demonym': demonym,
    'independent': independent,
    'flags': flags,
    'languages': languages,
    'latlng': latlng,
    'maps': maps,
    'name': name,
    'officialName': officialName,
    'nativeName': nativeName,
    'numericCode': numericCode,
    'continent': continent,
    'region': region,
    'subRegion': subRegion,
    'timezones': timezones,
    'topLevelDomain': tld,
    'translations': translations,
    'cioc': cioc,
    'landLocked': landlocked,
    'unMember': unMember,
  };
}

/// Renders a Dart const map/list/string literal recursively.
String _dartMapLiteral(dynamic value, {String indent = ''}) {
  if (value == null) return 'null';
  if (value is bool) return value.toString();
  if (value is num) {
    if (value is double && value == value.truncateToDouble()) {
      return '${value.toInt()}.0';
    }
    return value.toString();
  }
  if (value is String) return _dartString(value);

  if (value is Map) {
    if (value.isEmpty) return '<String, dynamic>{}';
    final childIndent = '$indent  ';
    final sb = StringBuffer();
    sb.writeln('{');
    for (final entry in value.entries) {
      sb.write('$childIndent${_dartString(entry.key.toString())}: ');
      sb.write(_dartMapLiteral(entry.value, indent: childIndent));
      sb.writeln(',');
    }
    sb.write('$indent}');
    return sb.toString();
  }

  if (value is List) {
    if (value.isEmpty) return '[]';
    final childIndent = '$indent  ';
    final sb = StringBuffer();
    sb.writeln('[');
    for (final item in value) {
      sb.write(childIndent);
      sb.write(_dartMapLiteral(item, indent: childIndent));
      sb.writeln(',');
    }
    sb.write('$indent]');
    return sb.toString();
  }

  return value.toString();
}

/// Escapes a Dart string literal.
String _dartString(String s) {
  final escaped = s
      .replaceAll(r'\', r'\\')
      .replaceAll("'", r"\'")
      .replaceAll(r'$', r'\$')
      .replaceAll('\n', r'\n')
      .replaceAll('\r', r'\r')
      .replaceAll('\t', r'\t');
  return "'$escaped'";
}

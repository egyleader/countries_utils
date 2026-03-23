import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.freezed.dart';
part 'language.g.dart';

/// A language spoken in a country.
@freezed
class Language with _$Language {
  const factory Language({
    required String code,
    required String name,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  /// Build a [Language] list from the v3.1 API map format `{isoCode: name}`.
  static List<Language> listFromMap(Map<String, dynamic>? map) {
    if (map == null || map.isEmpty) return const [];
    return map.entries
        .map((e) => Language(code: e.key, name: e.value as String? ?? ''))
        .toList();
  }
}

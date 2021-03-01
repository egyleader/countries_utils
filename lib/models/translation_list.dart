import 'package:flutter_country/models/translation.dart';

class TranslationList {
  final List<Translation> translations;

  TranslationList({this.translations});

  factory TranslationList.fromJson(Map<String, dynamic> parsedJson) {
    List<Translation> translations = List<Translation>();
    parsedJson.forEach((key, value) {
      translations.add(Translation.fromJson({key: value}));
    });
    return TranslationList(
      translations: translations,
    );
  }

  Translation translate(String code) =>
      this.translations.where((t) => t.languageCode == code).isNotEmpty
          ? this.translations.where((t) => t.languageCode == code).first
          : this.translations.first;
}

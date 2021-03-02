import 'package:flutter_country/models/translation.dart';

class TranslationList {
  final List<Translation> translations;

  TranslationList({this.translations});

  factory TranslationList.fromJson(Map<String, dynamic> parsedJson) {
    var translations = <Translation>[];
    parsedJson.forEach((key, value) {
      translations.add(Translation.fromJson({key: value}));
    });
    return TranslationList(
      translations: translations,
    );
  }

  Translation translate(String code) =>
      translations.where((t) => t.languageCode == code).isNotEmpty
          ? translations.where((t) => t.languageCode == code).first
          : translations.first;
}

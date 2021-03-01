class Translation {
  final String languageCode;
  final String official;
  final String common;

  Translation({this.languageCode, this.official, this.common});

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
      languageCode: json.keys.first,
      official: json.values.first['official'],
      common: json.values.first['common']);
}

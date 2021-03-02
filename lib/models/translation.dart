class Translation {
  final String languageCode;
  final String name;

  Translation({this.languageCode, this.name});

  factory Translation.fromJson(Map<String, dynamic> json) =>
      Translation(languageCode: json.keys.first, name: json.values.first);
}

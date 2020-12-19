class Demonym {
  Demonym({this.lang, this.female, this.male});

  final String lang;
  final String male;
  final String female;

  factory Demonym.fromJson(Map<String, dynamic> json) => Demonym(
        lang: json.keys.first,
        male: json.values.first['m'],
        female: json.values.first['f'],
      );
}

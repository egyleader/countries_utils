class Currency {
  final String code;
  final String name;
  final String symbol;

  Currency({this.code, this.name, this.symbol});

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
      code: json.keys.first,
      name: json.values.first['name'],
      symbol: json.values.first['symbol']);
}

import 'package:flutter_country/models/currency.dart';

class CurrencyList {
  final List<Currency> currencies;

  CurrencyList({this.currencies});

  factory CurrencyList.fromJson(Map<String, dynamic> parsedJson) {
    List<Currency> currencies = List<Currency>();
    parsedJson.forEach((key, value) {
      currencies.add(Currency.fromJson({key: value}));
    });
    return CurrencyList(
      currencies: currencies,
    );
  }
}

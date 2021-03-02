import 'package:flutter_country/models/currency.dart';

class CurrencyList {
  final List<Currency> currencies;

  CurrencyList({this.currencies});

  factory CurrencyList.fromJson(List<Map<String, dynamic>> parsedJson) {
    List<Currency> currencies = List<Currency>();
    parsedJson.forEach((currency) {
      currencies.add(Currency.fromJson(currency));
    });
    return CurrencyList(
      currencies: currencies,
    );
  }
}

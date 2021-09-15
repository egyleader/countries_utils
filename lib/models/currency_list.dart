import 'package:countries_utils/models/currency.dart';

class CurrencyList {
  final List<Currency>? currencies;

  CurrencyList({this.currencies});

  factory CurrencyList.fromJson(List<Map<String, dynamic>> parsedJson) {
    var currencies = <Currency>[];
    parsedJson.forEach((currency) {
      currencies.add(Currency.fromJson(currency));
    });
    return CurrencyList(
      currencies: currencies,
    );
  }
}

import 'package:countries_utils/models/currency.dart';

class CurrencyList {
  final List<Currency>? currencies;

  CurrencyList({this.currencies});

  factory CurrencyList.fromJson(List<Map<String, dynamic>> parsedJson) {
    var currencies = <Currency>[];
    for (var currency in parsedJson) {
      currencies.add(Currency.fromJson(currency));
    }
    return CurrencyList(
      currencies: currencies,
    );
  }
}

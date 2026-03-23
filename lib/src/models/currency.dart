import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency.freezed.dart';
part 'currency.g.dart';

/// A currency used by a country.
@freezed
class Currency with _$Currency {
  const factory Currency({
    required String code,
    @Default('') String name,
    @Default('') String symbol,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}

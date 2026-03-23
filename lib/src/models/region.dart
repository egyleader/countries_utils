import 'package:json_annotation/json_annotation.dart';

/// Broad geographic region of a country.
enum Region {
  @JsonValue('Africa')
  africa,
  @JsonValue('Americas')
  americas,
  @JsonValue('Antarctic')
  antarctic,
  @JsonValue('Asia')
  asia,
  @JsonValue('Europe')
  europe,
  @JsonValue('Oceania')
  oceania,
  @JsonValue('')
  unknown;

  /// Convert a raw string from JSON data to a [Region].
  static Region fromString(String? value) {
    if (value == null || value.isEmpty) return Region.unknown;
    return Region.values.firstWhere(
      (r) => r.name.toLowerCase() == value.toLowerCase(),
      orElse: () => Region.unknown,
    );
  }

  /// Human-readable display name.
  String get displayName => switch (this) {
        Region.africa => 'Africa',
        Region.americas => 'Americas',
        Region.antarctic => 'Antarctic',
        Region.asia => 'Asia',
        Region.europe => 'Europe',
        Region.oceania => 'Oceania',
        Region.unknown => '',
      };
}

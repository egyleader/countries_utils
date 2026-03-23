import 'package:freezed_annotation/freezed_annotation.dart';

part 'timezone.freezed.dart';
part 'timezone.g.dart';

/// A UTC timezone offset, e.g. `"+05:30"`, `"-03:00"`, `"00:00"`.
@freezed
class TimeZone with _$TimeZone {
  const factory TimeZone({
    /// Offset string without the "UTC" prefix.
    required String offset,
  }) = _TimeZone;

  factory TimeZone.fromJson(Map<String, dynamic> json) =>
      _$TimeZoneFromJson(json);

  /// Regex for a valid UTC offset: ±HH:MM (hours 00-14, minutes 00-59).
  static final _validOffset = RegExp(r'^[+-](?:0\d|1[0-4]):[0-5]\d$');

  /// Parse a raw timezone string (e.g. "UTC+05:30" → "+05:30", "UTC" → "+00:00").
  ///
  /// Throws [FormatException] if the normalized offset is not a valid ±HH:MM string.
  /// Note: [fromJson] handles Map-based deserialization; this method handles
  /// the raw UTC string list stored in [Country.timeZones].
  static TimeZone parse(String raw) {
    if (raw == 'UTC') return const TimeZone(offset: '+00:00');
    final normalized = raw.startsWith('UTC') ? raw.substring(3) : raw;
    // Bare "00:00" is valid UTC zero offset — normalise to "+00:00".
    if (normalized == '00:00') return const TimeZone(offset: '+00:00');
    if (!_validOffset.hasMatch(normalized)) {
      throw FormatException('Invalid UTC offset: "$raw"');
    }
    return TimeZone(offset: normalized);
  }
}

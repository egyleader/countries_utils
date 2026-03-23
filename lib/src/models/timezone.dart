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

  /// Parse a raw timezone string (e.g. "UTC+05:30" → "+05:30", "UTC" → "00:00").
  static TimeZone parse(String raw) {
    if (raw == 'UTC') return const TimeZone(offset: '00:00');
    final normalized = raw.startsWith('UTC') ? raw.substring(3) : raw;
    return TimeZone(offset: normalized);
  }
}

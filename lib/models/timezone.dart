class TimeZone {
  Duration? offset;
  String? offsetType;

  TimeZone({this.offset, this.offsetType});

  factory TimeZone.fromJson(String timezone) {
    if (timezone.isEmpty) return TimeZone();
   List<String> _timeZoneSplit = timezone.split(':');
    int _hours = int.parse(_timeZoneSplit[0].substring(0));
    int _mintues = _timeZoneSplit.length >1 ? int.parse(timezone.split(':')[1]) : 0;
    return TimeZone(
        offsetType: timezone.startsWith('-') ? '-' : '+',
        offset: Duration(hours: _hours, minutes: _mintues));
  }
}

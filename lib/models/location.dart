class Location {
  final String name;
  final String region;
  final String country;
  final double latitude;
  final double longitude;
  final String timezoneId;
  final int localtimeEpoch;
  final String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.timezoneId,
    required this.localtimeEpoch,
    required this.localtime,
  });
}

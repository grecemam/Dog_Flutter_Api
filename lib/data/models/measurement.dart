class Measurement {
  final String imperial;
  final String metric;

  Measurement({required this.imperial, required this.metric});

  factory Measurement.fromJson(Map<String, dynamic> json) {
    return Measurement(
      imperial: json['imperial'],
      metric: json['metric'],
    );
  }
}

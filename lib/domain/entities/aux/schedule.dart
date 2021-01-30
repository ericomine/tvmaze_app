class Schedule {
  final String time;
  final List<String> days;

  const Schedule({this.time, this.days});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return Schedule(
      time: json['time'] as String,
      days: List<String>.from(json['days'] as List),
    );
  }
}

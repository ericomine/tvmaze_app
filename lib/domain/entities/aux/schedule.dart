import 'package:tvmaze_app/app/common/string_x.dart';

class Schedule {
  final String time;
  final List<int> daysOfWeek;

  const Schedule({this.time, this.daysOfWeek});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final daysAsStrings = List<String>.from(json['days'] as List);
    final daysAsInt = daysAsStrings.map((day) => day.toDayOfWeek()).toList();

    return Schedule(
      time: json['time'] as String,
      daysOfWeek: daysAsInt,
    );
  }
}

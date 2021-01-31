import 'package:flutter/material.dart';
import 'package:tvmaze_app/app/common/int_x.dart';
import 'package:tvmaze_app/domain/entities/aux/schedule.dart';

class ScheduleView extends StatelessWidget {
  final Schedule schedule;

  const ScheduleView({Key key, this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 75,
      child: Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: dayOfWeekBox(context, index + 1),
                );
              })),
    );
  }

  Widget dayOfWeekBox(BuildContext context, int index) {
    final airsThisDay = schedule.daysOfWeek.contains(index);
    final color = airsThisDay ? Colors.lime : Colors.grey.withOpacity(0.5);

    return AspectRatio(
      aspectRatio: 1,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: color),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(index.toShortDayOfWeek(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontWeight: FontWeight.bold)),
              if (airsThisDay)
                Text(schedule.time)
              else
                const Icon(Icons.thumb_down_alt_outlined),
            ],
          )),
    );
  }
}

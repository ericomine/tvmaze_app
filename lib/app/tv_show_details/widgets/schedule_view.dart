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
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: dayOfWeekBox(context, index + 1),
            );
          }),
    );
  }

  Widget dayOfWeekBox(BuildContext context, int index) {
    final airsThisDay = schedule.daysOfWeek.contains(index);
    final color = airsThisDay ? Colors.lime : Colors.grey[300];

    return PhysicalModel(
      elevation: 4,
      color: Colors.black,
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white54),
              color: color,
            ),
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
      ),
    );
  }
}

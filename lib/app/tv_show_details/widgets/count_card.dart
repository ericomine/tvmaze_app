import 'package:flutter/material.dart';

class CountCard extends StatelessWidget {
  final int counter;
  final String title;

  const CountCard({Key key, this.counter, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.black,
      borderRadius: BorderRadius.circular(20),
      elevation: 4,
      child: Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.lime,
              border: Border.all(color: Colors.white54),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(counter.toString(),
                  style: Theme.of(context).textTheme.headline4),
              Text(title, style: Theme.of(context).textTheme.caption)
            ],
          )),
    );
  }
}

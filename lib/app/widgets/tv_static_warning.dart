import 'package:flutter/material.dart';

class TvStaticWarning extends StatelessWidget {
  final String message;

  const TvStaticWarning({
    Key key,
    this.message = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PhysicalModel(
            color: Colors.black,
            shape: BoxShape.circle,
            elevation: 8,
            child: Container(
              height: 240,
              width: 240,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/tvstatic.gif"),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(message, style: Theme.of(context).textTheme.headline6),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BigProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        width: 200,
        child: CircularProgressIndicator(
          backgroundColor: Colors.black87,
          valueColor:
              AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          strokeWidth: 30,
        ),
      ),
    );
  }
}

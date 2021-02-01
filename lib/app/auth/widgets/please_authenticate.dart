import 'package:flutter/material.dart';

class PleaseAuthenticate extends StatelessWidget {
  final void Function() onTap;

  const PleaseAuthenticate({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: MediaQuery.of(context).size,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("When you're ready:",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.fingerprint),
              label: const Text("please, click to authenticate."),
              onPressed: onTap,
            ),
          ],
        ),
      ),
    );
  }
}

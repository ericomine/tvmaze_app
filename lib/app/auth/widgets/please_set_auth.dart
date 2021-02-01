import 'package:flutter/material.dart';

class PleaseSetAuth extends StatelessWidget {
  final void Function(bool) setUseAuth;

  const PleaseSetAuth({Key key, this.setUseAuth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: MediaQuery.of(context).size,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.fingerprint, size: 60),
            const SizedBox(height: 20),
            Text("Would you like to use your fingerprint to authenticate?",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.check),
              label: const Text("Yes, please!"),
              onPressed: () => setUseAuth(true),
            ),
            FlatButton.icon(
              icon: const Icon(Icons.close),
              label: const Text("Not really"),
              onPressed: () => setUseAuth(false),
            ),
          ],
        ),
      ),
    );
  }
}

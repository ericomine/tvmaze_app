import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PleaseAuthenticate extends StatelessWidget {
  final void Function() onAuthenticate;
  final void Function() onWillNotAuthenticate;
  final void Function() onHandleNoBiometrics;
  final bool hasBiometrics;

  const PleaseAuthenticate({
    Key key,
    this.onAuthenticate,
    this.onWillNotAuthenticate,
    this.onHandleNoBiometrics,
    this.hasBiometrics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = hasBiometrics
        ? "When you're ready"
        : "Your devices has no fingerprint sensor";

    return SizedBox.fromSize(
      size: MediaQuery.of(context).size,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 20),
            if (hasBiometrics) ...[
              ElevatedButton.icon(
                icon: const Icon(Icons.fingerprint),
                label: const Text("please, click to authenticate"),
                onPressed: onAuthenticate,
              ),
              FlatButton.icon(
                  icon: const Icon(Icons.close),
                  label: const Text("or cancel."),
                  onPressed: onWillNotAuthenticate),
            ] else
              ElevatedButton.icon(
                icon: const Icon(Icons.close),
                label: const Text("continue without authentication"),
                onPressed: onHandleNoBiometrics,
              ),
          ],
        ),
      ),
    );
  }
}

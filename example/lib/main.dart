import 'package:flutter/material.dart';
import 'package:flutter_athlete_app_support/flutter_athlete_app_support.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Open settings"),
                onPressed: () => FlutterAthleteAppSupport.openSettings(),
              ),
              RaisedButton(
                child: Text("Check has vibrator"),
                onPressed: () async => print(
                    (await FlutterAthleteAppSupport.hasVibrator())
                        ? "Has vibrator"
                        : "Does not have vibrator"),
              ),
              RaisedButton(
                child: Text("Vibrate"),
                onPressed: () => FlutterAthleteAppSupport.vibrate(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:navigation_detector/navigation_detector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String navigationMode = "Checking...";

  @override
  void initState() {
    super.initState();
    checkNavigationMode();
  }

  Future<void> checkNavigationMode() async {
    String mode = await NavigationDetector.getNavigationMode();
    setState(() {
      navigationMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Navigation Detector Example")),
        body: Center(
          child: Text(
            "Navigation Mode: $navigationMode",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

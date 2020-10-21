import 'package:flutter/material.dart';

import 'StarterHandler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: StarterHandler.showQubicPage(context),
    );
  }
}

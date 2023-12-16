import 'package:WatchApp/APIdata.dart';
import 'package:WatchApp/models/APIseries.dart';
import 'package:WatchApp/screens/widgets/serieswidget.dart';
import 'package:WatchApp/screens/mainmenu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const IMDbApp());
}

class IMDbApp extends StatelessWidget {
  const IMDbApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
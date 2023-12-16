import 'package:clash_royale_app/APIdata.dart';
import 'package:clash_royale_app/models/APIseries.dart';
import 'package:clash_royale_app/screens/widgets/serieswidget.dart';
import 'package:clash_royale_app/screens/mainmenu.dart'
import 'package:flutter/material.dart';

void main() {
  runApp(const IMDbApp());
}

class IMDbApp extends StatelessWidget {
  const IMDbApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOP 100 BEST SERIES',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: HomePage(),
    );
  }
}

import 'dart:ui';

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
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse},
        ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
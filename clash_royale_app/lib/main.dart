import 'package:clash_royale_app/beerApi.dart';
import 'package:clash_royale_app/models/APIdata.dart';
import 'package:clash_royale_app/screens/widgets/beerwidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BeerApp());
}

class BeerApp extends StatelessWidget {
  const BeerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: apiLoadUsers(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Beer>> snapshot,
          ) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final userList = snapshot.data!;
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (BuildContext context, int index) {
                return BeerListItem(beer: userList[index]);
              },
            );
          },
        ),
      ),
    );
  }
}

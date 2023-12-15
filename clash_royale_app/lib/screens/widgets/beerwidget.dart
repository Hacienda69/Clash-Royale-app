import 'package:clash_royale_app/models/APIdata.dart';
import 'package:flutter/material.dart';

class BeerListItem extends StatelessWidget {
  const BeerListItem({
    super.key,
    required this.beer,
  });

  final Beer beer;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${beer.name} ${beer.first_brewed}"),
      subtitle: Text(beer.description),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(beer.image_url),
      ),
    );
  }
}

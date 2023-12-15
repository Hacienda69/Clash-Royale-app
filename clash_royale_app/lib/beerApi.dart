import 'dart:convert';
import 'package:clash_royale_app/models/APIdata.dart';
import 'package:http/http.dart' as http;

Future<List<Beer>> apiLoadUsers() async {
  final uri = Uri.parse("https://api.punkapi.com/v2/beers");
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonUserList = json["results"];
  final List<Beer> userList = [];
  for (final jsonUser in jsonUserList) {
    final user = Beer.fromJson(jsonUser);
    userList.add(user);
  }
  return userList;
}

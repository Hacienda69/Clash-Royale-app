import 'dart:convert';
import 'package:clash_royale_app/models/APIseries.dart';
import 'package:http/http.dart' as http;

class SeriesApi {
  static Future<List<Series>> apiLoadSeries() async {
    var uri = Uri.https('imdb-top-100-movies.p.rapidapi.com', '/series/');

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '0b2becce6dmsh2f0d3f886257d27p1146cbjsnef6865783b09',
      'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com'
    });

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      if (data != null && data is List) {
        List<Series> seriesData =
            data.map((item) => Series.fromJson(item)).toList();
        return seriesData;
      } else {
        throw Exception('Failed to load series');
      }
    } else {
      throw Exception('Failed to load series: ${response.statusCode}');
    }
  }
}

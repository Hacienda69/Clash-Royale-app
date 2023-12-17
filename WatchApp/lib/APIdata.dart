import 'dart:convert';
import 'package:WatchApp/models/APImovies.dart';
import 'package:WatchApp/models/APIseries.dart';
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

      List<Series> seriesData =
          data.map((item) => Series.fromJson(item)).toList();
      return seriesData;
        } else {
      throw Exception('Failed to load series: ${response.statusCode}');
    }
  }
}

class MoviesApi {
    static Future<List<Movies>> apiLoadMovies() async {
    var uri = Uri.https('imdb-top-100-movies.p.rapidapi.com');

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '0b2becce6dmsh2f0d3f886257d27p1146cbjsnef6865783b09',
      'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com'
    });

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      List<Movies> moviesData =
          data.map((item) => Movies.fromJson(item)).toList();
      return moviesData;
        } else {
      throw Exception('Failed to load movies: ${response.statusCode}');
    }
  }
}
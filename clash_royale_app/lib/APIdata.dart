import 'dart:convert';
import 'package:clash_royale_app/models/APIseries.dart';
import 'package:http/http.dart' as http;
/*
const axios = require('axios');

const options = {
  method: 'GET',
  url: 'https://imdb-top-100-movies.p.rapidapi.com/series/',
  headers: {
    'X-RapidAPI-Key': '0b2becce6dmsh2f0d3f886257d27p1146cbjsnef6865783b09',
    'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com'
  }
};

try {
	const response = await axios.request(options);
	console.log(response.data);
} catch (error) {
	console.error(error);
}*/
class SeriesApi{
  static Future<List<Series>> apiLoadSeries() async {
    var uri = Uri.https('https://imdb-top-100-movies.p.rapidapi.com', '/series/')
    
    final response = await http.get(uri, headers:{
      'X-RapidAPI-Key': '0b2becce6dmsh2f0d3f886257d27p1146cbjsnef6865783b09',
      'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com'
    });

    Map data = jsonDecode(response.body);

    List seriesData = [];

    for(var i in data['']){
      seriesData.add(i); //hacemos un for que vaya por cada serie (?)
    }

    return Series.seriesFromSnapshot(seriesData);

    /* COMO LO HIZO EL PROFE
    final uri = Uri.parse("https://imdb-top-100-movies.p.rapidapi.com/series/");
    final response = await http.get(uri); 
    final json = jsonDecode(response.body);
    final jsonSeriesList = json["results"];
    final List<Series> seriesList = [];
    for (final jsonSeries in jsonSeriesList) {
      final series = Series.fromJson(jsonSeries);
      seriesList.add(series);
    }

    return seriesList;
    */
  }
}

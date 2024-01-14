import 'package:WatchApp/models/APImovies.dart';
import 'package:WatchApp/models/APIseries.dart';

class Filters {
  // --------- FILTER BY GENRE ---------
  //Returns a list of all the movies where 1 of their 3 genres coincide with the target one
  static List<Movies> filterMoviesByGenre(
      String targetGenre, List<Movies> list) {
    List<Movies> filteredList = list
        .where((movie) => (movie.genres.elementAt(0) == targetGenre ||
            movie.genres.elementAt(1) == targetGenre ||
            movie.genres.elementAt(2) == targetGenre))
        .toList();
    return filteredList;
  }

  //Returns a list of all the series where 1 of their 3 genres coincide with the target one
  static List<Series> filterSeriesByGenre(
      String targetGenre, List<Series> list) {
    List<Series> filteredList = list
        .where((serie) => (serie.genres.elementAt(0) == targetGenre ||
            serie.genres.elementAt(1) == targetGenre ||
            serie.genres.elementAt(2) == targetGenre))
        .toList();
    return filteredList;
  }

  // --------- FILTER BY TITLE ---------
  // Returns a list of all the movies their titles coincide with "targetTitle"
  static List<Movies> filterMoviesByTitle(String targetTitle, List<Movies> list) {
    List<Movies> filteredList = [];

    for (var movie in list) {
      if (movie.title.toLowerCase().contains(targetTitle.toLowerCase())) {
        filteredList.add(movie);
      }
    }
    return filteredList;
  }

  // Returns a list of all the series their titles coincide with "targetTitle"
  static List<Series> filterSeriesByTitle(String targetTitle, List<Series> list) {
    List<Series> filteredList = [];

    for (var series in list) {
      if (series.title.toLowerCase().contains(targetTitle.toLowerCase())) {
        filteredList.add(series);
      }
    }
    return filteredList;
  }
  
  // --------- FILTER BY YEAR ---------
  // --------- FILTER BY RANK ---------
  // --------- FILTRE BY RATING ---------
}

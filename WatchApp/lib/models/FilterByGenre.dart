import 'package:WatchApp/models/APImovies.dart';
import 'package:WatchApp/models/APIseries.dart';

class FilterByGenre {
  //Returns a list of all the movies where 1 of their 3 genres coincide with the target one
  static List<Movies> filterMoviesByGenre(
      String targetGenre, List<Movies> list) {
    List<Movies> filteredList = list
        .where((movie) => (movie.genres[0] == targetGenre ||
            movie.genres[1] == targetGenre ||
            movie.genres[2] == targetGenre))
        .toList();

    return filteredList;
  }

  //Returns a list of all the series where 1 of their 3 genres coincide with the target one
  static List<Series> filterSeriesByGenre(
      String targetGenre, List<Series> list) {
    List<Series> filteredList = list
        .where((serie) => (serie.genre1 == targetGenre ||
            serie.genre2 == targetGenre ||
            serie.genre3 == targetGenre))
        .toList();

    return filteredList;
  }
}

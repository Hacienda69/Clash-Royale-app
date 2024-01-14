import 'dart:ui';
import 'package:WatchApp/APIdata.dart';
import 'package:WatchApp/models/APImovies.dart';
import 'package:WatchApp/models/APIseries.dart';
import 'package:WatchApp/screens/mainmenu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MediaModel()),
        ChangeNotifierProvider(create: (context) => LoadingContent()),
        ChangeNotifierProvider(create: (context) => SavedMediaModel()),
        ChangeNotifierProvider(create: (context) => SearchMediaModel()),
        ],
    child: const IMDbApp(),
  ));
}

class MediaModel with ChangeNotifier {
  List<Movies> _moviesList = [];
  List<Movies> get moviesList => _moviesList;

  List<Series> _seriesList = [];
  List<Series> get seriesList => _seriesList;

  void setMoviesList(List<Movies> moviesList) {
    _moviesList = moviesList;
    notifyListeners();
  }

  void setSeriesList(List<Series> seriesList) {
    _seriesList = seriesList;
    notifyListeners();
  }
}

class LoadingContent with ChangeNotifier {
  bool _isLoadingSeries = true;
  bool get isLoadingSeries => _isLoadingSeries;

  bool _isLoadingMovies = true;
  bool get isLoadingMovies => _isLoadingMovies;

  void setLoadingSeries(bool x) {
    _isLoadingSeries = x;
    notifyListeners();
  }
  void setLoadingMovies(bool x) {
    _isLoadingMovies = x;
    notifyListeners();
  }
}

class SavedMediaModel with ChangeNotifier{
  List<Movies> _savedMovies = [];
  List<Movies> get savedMovies => _savedMovies;

  List<Series> _savedSeries = [];
  List<Series> get savedSeries => _savedSeries;

  void addSavedMovie(Movies x) {
    _savedMovies.add(x);
    notifyListeners();
  }
  void addSavedSerie(Series x) {
    _savedSeries.add(x);
    notifyListeners();
  }
  void substractMovie(Movies x) {
    _savedMovies.remove(x);
    notifyListeners();
  }
  void substractSerie(Series x) {
    _savedSeries.remove(x);
  }
}

class SearchMediaModel with ChangeNotifier{
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  bool _onlyMovies = true;
  bool get onlyMovies => _onlyMovies;

  String _genreQuery = '';
  String get genreQuery => _genreQuery;

  int _yearQuery = 0;
  int get yearQuery => _yearQuery;

  int _rankQuery = 0;
  int get rankQuery => _rankQuery;

  String _ratingQuery = '';
  String get ratingQuery => _ratingQuery;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setOnlyMovies(bool x){
    _onlyMovies = x;
    notifyListeners();
  }

  void setGenreQuery(String x){
    _genreQuery = x;
    notifyListeners();
  }

  void setYearQuery(int x){
    _yearQuery = x;
    notifyListeners();
  }

  void setRankQuery(int x){
    _rankQuery = x;
    notifyListeners();
  }

  void setRatingQuery(String x){
    _ratingQuery = x;
    notifyListeners();
  }
}

class IMDbApp extends StatefulWidget {
  const IMDbApp({super.key});

  @override
  State<IMDbApp> createState() => _IMDbAppState();
}

class _IMDbAppState extends State<IMDbApp> {
  List<Series> _series = []; // Inicializa _series con una lista vacía
  List<Movies> _movies = []; // Inicializa _movies con una lista vacía
  
  @override
  void initState() {
    super.initState();
    getMovies();
    getSeries(); // Llama a la función para cargar las series
  }

  Future<void> getSeries() async {
    // Utiliza await para esperar la respuesta de la API y luego actualiza el estado
    _series = await SeriesApi.apiLoadSeries();
    setState(() {
      Provider.of<LoadingContent>(context, listen: false).setLoadingSeries(false);
    });
    Provider.of<MediaModel>(context, listen: false).setSeriesList(_series);
  }

  Future<void> getMovies() async {
    // Utiliza await para esperar la respuesta de la API y luego actualiza el estado
    _movies = await MoviesApi.apiLoadMovies();
    setState(() {
      Provider.of<LoadingContent>(context, listen: false).setLoadingMovies(false);
    });
    Provider.of<MediaModel>(context, listen: false).setMoviesList(_movies);
  }

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

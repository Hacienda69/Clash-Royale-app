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
      var loadingContent = Provider.of<LoadingContent>(context, listen: false);
      loadingContent.setLoadingSeries(false);
    });
    var mediaModel = Provider.of<MediaModel>(context, listen: false);
    mediaModel.setSeriesList(_series);
  }

  Future<void> getMovies() async {
    // Utiliza await para esperar la respuesta de la API y luego actualiza el estado
    _movies = await MoviesApi.apiLoadMovies();
    setState(() {
      var loadingContent = Provider.of<LoadingContent>(context, listen: false);
      loadingContent.setLoadingMovies(false);
    });
    var savedMoviesList = Provider.of<SavedMediaModel>(context, listen: false);
    savedMoviesList.addSavedMovie(_movies.elementAt(0));
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

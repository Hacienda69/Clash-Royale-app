import 'package:WatchApp/models/APImovies.dart';
import 'package:WatchApp/models/FilterByGenre.dart';
import 'package:WatchApp/screens/widgets/sectionWidget.dart';
import 'package:flutter/material.dart';
import 'package:WatchApp/APIdata.dart';
import 'package:WatchApp/models/APIseries.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Series> _series = []; // Inicializa _series con una lista vacía
  List<Movies> _movies = []; // Inicializa _movies con una lista vacía
  bool _isLoadingSeries = true;
  bool _isLoadingMovies = true;

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
      _isLoadingSeries = false;
    });
  }

    Future<void> getMovies() async {
    // Utiliza await para esperar la respuesta de la API y luego actualiza el estado
    _movies = await MoviesApi.apiLoadMovies();
    setState(() {
      _isLoadingMovies = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color backGroundColor = const Color.fromARGB(255, 17, 17, 17);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.black,
        elevation: 10,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            Text(
              "WatchWeb",
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
      backgroundColor: backGroundColor,
      body: _isLoadingSeries && _isLoadingMovies
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [

                  //MOVIES
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Movies",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Section(title: "Top 100 Movies", list: _movies),
                  Section(
                    title: "Crime Movies",
                    list: FilterByGenre.filterMoviesByGenre("Crime", _movies),
                  ),
                  Section(
                    title: "Action Movies",
                    list: FilterByGenre.filterMoviesByGenre("Action", _movies),
                  ),

                  // SERIES
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Series",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Section(title: "Top 100 Series", list: _series),
                  Section(
                    title: "Drama Series", 
                    list: FilterByGenre.filterSeriesByGenre("Drama", _series),
                    ),
                  Section(
                    title: "Comedy Series", 
                    list: FilterByGenre.filterSeriesByGenre("Comedy", _series),
                    ),
                ],
              ));
  }
}
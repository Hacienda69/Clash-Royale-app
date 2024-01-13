import 'package:WatchApp/models/APImovies.dart';
import 'package:WatchApp/models/FilterByGenre.dart';
import 'package:WatchApp/screens/MyListScreen.dart';
import 'package:WatchApp/screens/DescriptionScreen.dart';
import 'package:WatchApp/screens/SearchScreen.dart';
import 'package:WatchApp/screens/widgets/mediaWidget.dart';
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        shadowColor: Colors.black,
        elevation: 10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
            ),
            const Text(
              "WatchWeb",
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyListScreen(),
                  ),
                );
              },
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
                const MediaTypeTitle(title: "Movies"),
                Section(title: "Top 100 Movies", list: _movies),
                Section(
                  title: "Crime Movies",
                  list: FilterByGenre.filterMoviesByGenre("Crime", _movies),
                ),
                Section(
                  title: "Action Movies",
                  list: FilterByGenre.filterMoviesByGenre("Action", _movies),
                ),
                const MediaTypeTitle(title: "Series"),
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
            ),
    );
  }
}

class MediaTypeTitle extends StatelessWidget {
  final String title;

  const MediaTypeTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.fromLTRB(15, 8, 0, 0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final List list;

  const Section({
    super.key,
    required this.title,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.fromLTRB(15, 8, 0, 0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        MediaRow(list: list),
      ],
    );
  }
}

class MediaRow extends StatelessWidget {
  final List list;

  const MediaRow({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListItem(
            title: list[index].title,
            image: list[index].image,
            rating: list[index].rating.toString(),
          );
        },
      ),
    );
  }
}

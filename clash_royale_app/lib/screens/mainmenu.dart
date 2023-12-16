import 'package:flutter/material.dart';
import 'package:clash_royale_app/screens/widgets/serieswidget.dart';
import 'package:clash_royale_app/APIdata.dart';
import 'package:clash_royale_app/models/APIseries.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Series> _series = []; // Inicializa _series con una lista vacía
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getSeries(); // Llama a la función para cargar las series
  }

  Future<void> getSeries() async {
    // Utiliza await para esperar la respuesta de la API y luego actualiza el estado
    _series = await SeriesApi.apiLoadSeries();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color backGroundColor = const Color.fromARGB(255, 33, 33, 33);

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
            Icon(
              Icons.abc,
              color: Colors.white,
              size: 50,
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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _series.length,
              itemBuilder: (context, index) {
                return SeriesListItem(
                  rank: _series[index].rank,
                  title: _series[index].title,
                  rating: _series[index].rating.toString(),
                  image: _series[index].image,
                );
              },
            ),
    );
  }
}

import 'package:WatchApp/screens/widgets/widgetRowScroll.dart';
import 'package:flutter/material.dart';
import 'package:WatchApp/screens/widgets/serieswidget.dart';
import 'package:WatchApp/APIdata.dart';
import 'package:WatchApp/models/APIseries.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
          : ScrollableWidgetRow(seriesList: _series),
    );
  }
}

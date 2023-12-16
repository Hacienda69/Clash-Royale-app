import 'package:flutter/material.dart';
import 'package:clash_royale_app/screens/widgets/serieswidget.dart';
import 'package:clash_royale_app/APIdata.dart';
import 'package:clash_royale_app/models/APIseries.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   List<Series> _series;
    bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    SeriesApi.apiLoadSeries();
  }

   Future<void> geTSeries() async {
    _series = await SeriesApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon(Icons.movies),
              SizedBox(width: 10),
              Text('TOP 100 SERIES')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _series.length,
                itemBuilder: (context, index) {
                  return SeriesListItem(
                      rank: _series[index].rank,
                      title: _series[index].title,
                      rating: _series[index].rating.toString(),
                      image: _series[index].image);
                },
              ));
  }
}
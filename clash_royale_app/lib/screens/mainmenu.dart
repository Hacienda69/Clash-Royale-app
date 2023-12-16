import 'package:flutter/material.dart';
import 'package:clash_royale_app/models/serieswidget.dart';

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
    apiLoadSeries();
  }

   Future<void> getRecipes() async {
    _series = await RecipeApi.getRecipe();
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
              Icon(Icons.movies),
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
                  return RecipeCard(
                      rank: _series[index].rank,
                      title: _series[index].title,
                      rating: _series[index].rating.toString(),
                      image: _series[index].image);
                },
              ));
  }
}
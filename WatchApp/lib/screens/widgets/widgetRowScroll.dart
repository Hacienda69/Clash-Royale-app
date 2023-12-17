import 'package:flutter/material.dart';
import 'package:WatchApp/models/APIseries.dart';
import 'serieswidget.dart';

class ScrollableWidgetRow extends StatelessWidget{
  final List<Series> seriesList;

  const ScrollableWidgetRow({super.key, required this.seriesList,});

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: seriesList.length,
      itemBuilder: (context, index){
      return SeriesListItem(
        rank: seriesList[index].rank,
        title: seriesList[index].title,
        image: seriesList[index].image,
        rating: seriesList[index].rating.toString(),
      );}
    );
  }
}
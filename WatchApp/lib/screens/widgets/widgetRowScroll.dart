import 'package:flutter/material.dart';
import 'serieswidget.dart';

class ScrollableWidgetRow extends StatelessWidget{
  final List list;

  const ScrollableWidgetRow({super.key, required this.list,});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: ScrollController(),
        itemCount: list.length,
        itemBuilder: (context, index){
        return SeriesListItem(
          rank: list[index].rank,
          title: list[index].title,
          image: list[index].image,
          rating: list[index].rating.toString(),
        );}
      ),
    );
  }
}
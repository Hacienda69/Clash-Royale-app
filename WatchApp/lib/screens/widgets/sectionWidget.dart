import 'package:flutter/material.dart';
import 'widgetRowScroll.dart';

class Section extends StatelessWidget{
  final String title;
  final List list;

  const Section({super.key, required this.title, required this.list,});

  @override
  Widget build(BuildContext context){
    return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title, 
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                ),
                ScrollableWidgetRow(list: list),
              ],
            ),
          );
  }
}
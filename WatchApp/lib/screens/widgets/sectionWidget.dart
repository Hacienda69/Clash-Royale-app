import 'package:WatchApp/screens/widgets/mediaWidget.dart';
import 'package:flutter/material.dart';

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
          return MediaItem(
            media: list[index],
          );
        },
      ),
    );
  }
}
import 'package:WatchApp/screens/DescriptionScreen.dart';
import 'package:WatchApp/models/APImovies.dart';
import 'package:WatchApp/models/APIseries.dart';
import 'package:flutter/material.dart';

class MediaItem extends StatelessWidget {
  final dynamic media; // Can be either Movies or Series

  const MediaItem({
    super.key,
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    String title = media.title;
    String image = media.image;
    String rating = media.rating.toString();

    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DescriptionScreen(
                  media: media,
                  isMovie: media is Movies,
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
            width: 100,
            height: 142,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(7.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(1),
                  offset: const Offset(
                    0.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: -5.0,
                ),
              ],
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 9,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 11,
              ),
              const SizedBox(width: 2),
              Text(
                rating,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

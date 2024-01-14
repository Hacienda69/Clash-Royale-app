import 'package:WatchApp/screens/DescriptionScreen.dart';
import 'package:WatchApp/models/APImovies.dart';
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
        SizedBox(
          width: 110,
          child: Center(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 9,
              ),
            ),
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

class MediaItemReduced extends StatelessWidget {
  MediaItemReduced({
    super.key,
    required this.media,
  });

  final dynamic media;

  @override
  Widget build(BuildContext context) {
    String image = media.image;
    String title = media.title;
    String rating = media.rating;

    bool isMovie = media is Movies;
    String mediaType;
    if (isMovie) {mediaType = "Movie";}
    else {mediaType = "Series";}

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DescriptionScreen(
              media: media,
              isMovie: isMovie,
            ),
          ),
        );
      },
      child: Container(
        height: 100,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 40, 40, 40),
          border: Border.symmetric(
            vertical: BorderSide(color: Colors.black),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  height: 85,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mediaType,
                    style: TextStyle(
                      color: Colors.yellow,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

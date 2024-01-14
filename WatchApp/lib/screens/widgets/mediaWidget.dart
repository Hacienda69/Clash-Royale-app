import 'package:WatchApp/main.dart';
import 'package:WatchApp/screens/DescriptionScreen.dart';
import 'package:WatchApp/models/APImovies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class MediaItemReduced extends StatefulWidget {
  const MediaItemReduced({
    super.key,
    required this.media,
  });

  final dynamic media;

  @override
  State<MediaItemReduced> createState() => _MediaItemReducedState();
}

class _MediaItemReducedState extends State<MediaItemReduced> {
  bool? isHovered;
  Color backGroundColorHovered = const Color.fromARGB(255, 40, 40, 40);
  Color backGroundColorNotHovered = const Color.fromARGB(255, 17, 17, 17);

  late bool isSaved = false;
  late bool isMovie = false;

  @override
  Widget build(BuildContext context) {
    var savedMedia = Provider.of<SavedMediaModel>(context, listen: true);

    GlobalKey inkWellKey = GlobalKey();
    isMovie = widget.media is Movies;

    String image = widget.media.image;
    String title = widget.media.title;
    String rating = widget.media.rating.toString();

    double screenWidth = MediaQuery.of(context).size.width;

    String mediaType;
    if (isMovie) {
      mediaType = "Movie";
    } else {
      mediaType = "Series";
    }

    return SizedBox(
      child: InkWell(
        key: inkWellKey,
        onHover: (hovered) {
          setState(() {
            isHovered = hovered;
          });
        },
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DescriptionScreen(
                media: widget.media,
                isMovie: isMovie,
              ),
            ),
          );
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: isHovered ?? false
                ? backGroundColorHovered
                : backGroundColorNotHovered,
            border: const Border.symmetric(
              vertical: BorderSide(color: Colors.black),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                          style: const TextStyle(
                            color: Colors.yellow,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.65,
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSaved = !isSaved;
                      if (isMovie) {
                        if (isSaved) {
                          savedMedia.addSavedMovie(widget.media);
                        } else {
                          savedMedia.substractMovie(widget.media);
                        }
                      } else {
                        if (isSaved) {
                          savedMedia.addSavedSerie(widget.media);
                        } else {
                          savedMedia.substractSerie(widget.media);
                        }
                      }
                    });
                  },
                  //backgroundColor: Colors.yellow,
                  icon: Icon(
                    isSaved ? Icons.bookmark_added : Icons.bookmark,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

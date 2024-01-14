import 'package:flutter/material.dart';
import 'package:WatchApp/main.dart';
import 'package:provider/provider.dart';

class DescriptionScreen extends StatefulWidget {
  final dynamic media;
  final bool isMovie;

  const DescriptionScreen({
    super.key,
    required this.media,
    required this.isMovie,
  });

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    var savedMedia = Provider.of<SavedMediaModel>(context, listen: false);
    bool isSaved;

    if (widget.isMovie) {
      isSaved = savedMedia.savedMovies.contains(widget.media);
    } else {
      isSaved = savedMedia.savedSeries.contains(widget.media);
    }

    String title = widget.isMovie ? widget.media.title : widget.media.title;
    String image = widget.isMovie ? widget.media.image : widget.media.image;
    String rating = widget.isMovie
        ? widget.media.rating.toString()
        : widget.media.rating.toString();
    int year = widget.isMovie
        ? widget.media.year
        : int.tryParse(widget.media.year) ?? 0;
    String description =
        widget.isMovie ? widget.media.description : widget.media.description;
    List<String> genres =
        widget.isMovie ? widget.media.genres : widget.media.genres;
    String imdbLink =
        widget.isMovie ? widget.media.imdbLink : widget.media.imdb_link;

    double screenWidth = MediaQuery.of(context).size.width;

    Color backGroundColor = const Color.fromARGB(255, 17, 17, 17);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        shadowColor: Colors.black,
        elevation: 10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              width: screenWidth * 0.6,
              child: Center(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: backGroundColor,
      body: ListView(
        children: [
          SizedBox(
            height: 600,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Image.network(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        var savedMedia = Provider.of<SavedMediaModel>(context,
                            listen: false);

                        // Esto es el Add to my list + comprueba si la peli ya está metida o no
                        if (widget.isMovie) {
                          if (savedMedia.savedMovies.contains(widget.media)) {
                            savedMedia.substractMovie(widget.media);
                          } else {
                            savedMedia.addSavedMovie(widget.media);
                          }
                        } else {
                          if (savedMedia.savedSeries.contains(widget.media)) {
                            savedMedia.substractSerie(widget.media);
                          } else {
                            savedMedia.addSavedSerie(widget.media);
                          }
                        }
                      },
                      backgroundColor: Colors.yellow,
                      child: Icon(
                        isSaved ? Icons.bookmark_added : Icons.bookmark,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                _buildInfoItem('Rating', rating),
                _buildInfoItem('Year', widget.isMovie ? year.toString() : ''),
                _buildInfoItem('Description', description),
                _buildInfoItem('Genres', genres.join(', ')),
                _buildInfoItem('IMDb Link', imdbLink),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label:',
          style: const TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

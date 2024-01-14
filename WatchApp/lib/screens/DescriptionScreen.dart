import 'package:flutter/material.dart';
import 'package:WatchApp/main.dart';
import 'package:provider/provider.dart';
import 'package:WatchApp/screens/MyListScreen.dart';

class DescriptionScreen extends StatefulWidget {
  final dynamic media;
  final bool isMovie;

  const DescriptionScreen({
    Key? key,
    required this.media,
    required this.isMovie,
  }) : super(key: key);

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  late bool isSaved;

  @override
  void initState() {
    super.initState();
    var savedMedia = Provider.of<SavedMediaModel>(context, listen: false);
    isSaved = widget.isMovie
        ? savedMedia.savedMovies.contains(widget.media)
        : savedMedia.savedSeries.contains(widget.media);
  }

  @override
  Widget build(BuildContext context) {
    var savedMedia = Provider.of<SavedMediaModel>(context, listen: false);

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
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyListScreen(),
                  ),
                );
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
                        setState(() {
                          isSaved = !isSaved;

                          if (widget.isMovie) {
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
                      backgroundColor: Colors.yellow,
                      child: Icon(
                        isSaved ? Icons.bookmark_added : Icons.bookmark,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                _buildInfoItem('Rating', rating),
                if (widget.isMovie)
                  _buildInfoItem('Year', year != 0 ? year.toString() : ''),
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

import 'package:flutter/material.dart';
import 'package:WatchApp/main.dart';
import 'package:provider/provider.dart';

class DescriptionScreen extends StatelessWidget {
  final dynamic media;
  final bool isMovie;

  const DescriptionScreen({
    super.key,
    required this.media,
    required this.isMovie,
  });

  @override
  Widget build(BuildContext context) {
    String title = isMovie ? media.title : media.title;
    String image = isMovie ? media.image : media.image;
    String rating = isMovie ? media.rating.toString() : media.rating.toString();
    int rank = isMovie ? media.rank : media.rank;
    int year = isMovie ? media.year : int.tryParse(media.year) ?? 0;
    String description = isMovie ? media.description : media.description;
    List<String> genres = isMovie ? media.genres : media.genres;
    String imdbLink = isMovie ? media.imdbLink : media.imdb_link;
    String trailer = isMovie ? media.trailer : media.trailer;

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
          Container(
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
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildInfoItem('Rating', rating),
                _buildInfoItem('Year', year.toString()),
                _buildInfoItem('Description', description),
                _buildInfoItem('Genres', genres.join(', ')),
                _buildInfoItem('IMDb Link', imdbLink),
                if (trailer != null && trailer.isNotEmpty)
                  ElevatedButton(
                    onPressed: () {
                      var savedMedia =
                          Provider.of<SavedMediaModel>(context, listen: false);

                      // Esto es el Add to my list + comprueba si la peli ya está metida o no
                      if (isMovie) {
                        if (savedMedia.savedMovies.contains(media)) {
                          savedMedia.substractMovie(media);
                        } else {
                          savedMedia.addSavedMovie(media);
                        }
                      } else {
                        if (savedMedia.savedSeries.contains(media)) {
                          savedMedia.substractSerie(media);
                        } else {
                          savedMedia.addSavedSerie(media);
                        }
                      }
                    },
                    child:
                        Text(isMovie ? 'Add to My Movies' : 'Add to My Series'),
                  ),
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

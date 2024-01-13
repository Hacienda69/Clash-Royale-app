import 'package:WatchApp/screens/mainmenu.dart';
import 'package:flutter/material.dart';
import 'package:WatchApp/models/APImovies.dart';
import 'package:WatchApp/models/APIseries.dart';

class DescriptionScreen extends StatelessWidget {
  final dynamic media;
  final bool isMovie;

  DescriptionScreen({
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
              width: 228,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
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
            SizedBox(
              width: 228,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(image),
            SizedBox(height: 20),
            Text(
              'Title: $title',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rank: $rank',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Rating: $rating',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Year: $year',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Description: $description',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Genres: ${genres.join(", ")}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'IMDb Link: $imdbLink',
              style: TextStyle(fontSize: 16),
            ),
            if (trailer != null && trailer.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  // Handle trailer button click
                },
                child: Text('Watch Trailer'),
              ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}

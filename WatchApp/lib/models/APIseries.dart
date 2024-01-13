class Series {
  final int rank;
  final String title;
  final String thumbnail;
  final num rating; // Cambiado a tipo num para aceptar tanto int como double
  final String year;
  final String image;
  final String description;
  final List<String> genres;
  final String imdb_link;
  final String trailer;

  Series({
    required this.rank,
    required this.title,
    required this.thumbnail,
    required this.rating,
    required this.year,
    required this.image,
    required this.description,
    required this.genres,
    required this.imdb_link,
    required this.trailer,
  });

  factory Series.fromJson(Map<String, dynamic> json) {
    List<dynamic> auxGenres = json["genre"] as List<dynamic>;
    List<String> defGenres = [...auxGenres.cast<String>()];

    while (defGenres.length < 3) {
      defGenres.add(" ");
    }

    return Series(
      rank: json["rank"] as int,
      title: json["title"] as String,
      thumbnail: json["thumbnail"] as String,
      rating: json["rating"],
      year: json["year"] as String,
      image: json["image"] as String,
      description: json["description"] as String,
      genres: defGenres,
      imdb_link: json["imdb_link"] as String,
      trailer: json["trailer"] as String? ?? " ",
    );
  }

  static List<Series> seriesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Series.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Series {rank: $rank, title: $title, thumbnail: $thumbnail, rating: $rating, year: $year, image: $image, description: $description, genre: $genres, imdb_link: $imdb_link}';
  }
}

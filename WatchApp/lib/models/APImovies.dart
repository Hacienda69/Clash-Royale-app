class Movies {
  final int rank;
  final String title;
  final String thumbnail;
  final String rating; // Cambiado a tipo num para aceptar tanto int como double
  final int year;
  final String image;
  final String description;
  final List<String> genres;
  final List<String> directors;
  final List<String> writers;
  final String imdbLink;
  final String trailer;

  Movies({
    required this.rank,
    required this.title,
    required this.thumbnail,
    required this.rating,
    required this.year,
    required this.image,
    required this.description,
    required this.genres,
    required this.directors,
    required this.writers,
    required this.imdbLink,
    required this.trailer,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    List<dynamic> auxGenres = json["genre"] as List<dynamic>;
    List<String> defGenres = [...auxGenres.cast<String>()];
    while (defGenres.length < 3) { defGenres.add(" "); }

    List<dynamic>? auxDirectors = json["director"] as List<dynamic>?;
    List<String> defDirectors = auxDirectors?.cast<String>() ?? [];
    while (defDirectors.length < 3) { defDirectors.add(" "); }

    List<dynamic>? auxWriters = json["writers"] as List<dynamic>?;
    List<String> defWriters = auxWriters?.cast<String>() ?? [];
    while (defWriters.length < 3) { defWriters.add(" "); }

    return Movies(
      rank: json["rank"] as int,
      title: json["title"] as String,
      thumbnail: json["thumbnail"] as String,
      rating: json["rating"],
      year: json["year"] as int,
      image: json["image"] as String,
      description: json["description"] as String,
      genres: defGenres,
      directors: defDirectors,
      writers: defWriters,
      imdbLink: json["imdb_link"] as String,
      trailer: json["trailer"] as String? ?? " ",
    );
  }

  static List<Movies> moviesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Movies.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Movies {rank: $rank, title: $title, thumbnail: $thumbnail, rating: $rating, year: $year, image: $image, description: $description,  genre: $genres, director: $directors, writers: $writers, imdb_link: $imdbLink, trailer: $trailer}';
  }
}

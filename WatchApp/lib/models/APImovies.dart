class Movies {
  final int rank;
  final String title;
  final String thumbnail;
  final String rating; // Cambiado a tipo num para aceptar tanto int como double
  final int year;
  final String image;
  final String description;
  final String trailer;
  final List<String> genres;
  final List<String> directors;
  final List<String> writers;
  final String linkImdb;

  Movies({
    required this.rank,
    required this.title,
    required this.thumbnail,
    required this.rating,
    required this.year,
    required this.image,
    required this.description,
    required this.trailer,
    required this.genres,
    required this.directors,
    required this.writers,
    required this.linkImdb,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      rank: json["rank"] as int,
      title: json["title"] as String,
      thumbnail: json["thumbnail"] as String,
      rating: json["rating"],
      year: json["year"] as int,
      image: json["image"] as String,
      description: json["description"] as String,
      trailer: json["trailer"] as String,
      genres: json["genre"] as List<String>,
      directors: json["director"] as List<String>,
      writers: json["writers"] as List<String>,
      linkImdb: json["linkImdb"] as String,
    );
  }

  static List<Movies> moviesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Movies.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Movies {title: $title, rating: $rating, image: $image,  genre: $genres, director: $directors, writers: $writers}';
  }
}

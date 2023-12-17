class Movies {
  final int rank;
  final String title;
  final String rating; // Cambiado a tipo num para aceptar tanto int como double
  final String image;

  Movies({
    required this.rank,
    required this.title,
    required this.rating,
    required this.image,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      rank: json["rank"] as int,
      title: json["title"] as String,
      rating: json["rating"] as String,// No necesita ser convertido explícitamente a double
      image: json["image"] as String,
    );
  }

  static List<Movies> moviesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Movies.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Movies {rank: $rank, title: $title, rating: $rating, image: $image}';
    //return 'Movies {rank: $rank, title: $title, image: $image}';
  }
}

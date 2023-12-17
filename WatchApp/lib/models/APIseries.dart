class Series {
  final String title;
  final num rating; // Cambiado a tipo num para aceptar tanto int como double
  final String image;
  final String genre1;
  final String genre2;
  final String genre3;

  Series({
    required this.title,
    required this.rating,
    required this.image,
    required this.genre1,
    required this.genre2,
    required this.genre3,
  });

factory Series.fromJson(Map<String, dynamic> json) {
  List<dynamic> genres = json["genre"] as List<dynamic>;

  while (genres.length < 3) {
    genres.add(" ");
  }

  return Series(
    title: json["title"] as String,
    rating: json["rating"], // No necesita ser convertido explícitamente a double
    image: json["image"] as String,
    genre1: genres.elementAt(0) as String? ?? " ",
    genre2: genres.elementAt(1) as String? ?? " ",
    genre3: genres.elementAt(2) as String? ?? " ",
  );
}

  static List<Series> seriesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Series.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Series {title: $title, rating: $rating, image: $image, genre1: $genre1, genre2: $genre2, genre3: $genre3}';
  }
}

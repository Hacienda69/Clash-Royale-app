class Series {
  final int rank;
  final String title;
  final num rating; // Cambiado a tipo num para aceptar tanto int como double
  final String image;

  Series({
    required this.rank,
    required this.title,
    required this.rating,
    required this.image,
  });

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      rank: json["rank"] as int,
      title: json["title"] as String,
      rating: json["rating"], // No necesita ser convertido explícitamente a double
      image: json["image"] as String,
    );
  }

  static List<Series> seriesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Series.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Series {rank: $rank, title: $title, rating: $rating, image: $image}';
  }
}

class Series {
  final int rank;
  final String title;
  final double rating;
  final String image;

  Series({this.rank, this.title, this.rating, this.image});

  factory Series.fromJson(Map<String, dynamic> json){
      return Series(
        rank: json["rank"] as int,
        title: json["title"] as String,
        rating: json["rating"] as double,
        image: json["image"] as String,
    )
  }
  
  static List<Series> seriesFromSnapshot(List snapshot){
    return snapshot.map((data){
      return Series.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Series {rank: $rank, title: $title, rating: $rating, image: $image}';
  }
}

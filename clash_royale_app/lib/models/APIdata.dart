class Beer {
  final int id;
  final String name;
  final String first_brewed;
  final String description;
  final String image_url;

  Beer.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        first_brewed = json["first_brewed"],
        description = json["description"],
        image_url = json["picture"]["large"];
}

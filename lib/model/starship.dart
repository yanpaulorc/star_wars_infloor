class Starship {
  Starship({
    required this.name,
    required this.model,
  });

  String name;
  String model;

  factory Starship.fromJsonMap(Map<String, dynamic> json) => Starship(
        name: json["name"],
        model: json["model"],
      );
}

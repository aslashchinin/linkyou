class CityHighlighted {
  final int id;
  final String title;
  final bool highlighted;

  CityHighlighted({
    required this.id,
    required this.title,
    required this.highlighted,
  });

  factory CityHighlighted.fromJson(Map<String, dynamic> json) {
    return CityHighlighted(
      id: json['id'],
      title: json['title'],
      highlighted: json['highlighted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'highlighted': highlighted,
    };
  }
}
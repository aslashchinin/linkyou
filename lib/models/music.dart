class Music {
  final int id;
  final String datetime;
  final String link;
  final String source;
  final BigInt userId;

  Music({
    required this.id,
    required this.datetime,
    required this.link,
    required this.source,
    required this.userId,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      id: json['id'],
      datetime: json['datetime'],
      link: json['link'],
      source: json['source'],
      userId: BigInt.from(json['user_id']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'datetime': datetime,
      'link': link,
      'source': source,
      'user_id': userId,
    };
  }
}

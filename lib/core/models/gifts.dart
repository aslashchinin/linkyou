class Gifts {
  final int count;
  final int freeGifts;

  Gifts({
    required this.count,
    required this.freeGifts,
  });

  factory Gifts.fromJson(Map<String, dynamic> json) {
    return Gifts(
      count: json['count'],
      freeGifts: json['free_gifts'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'free_gifts': freeGifts,
    };
  }
}

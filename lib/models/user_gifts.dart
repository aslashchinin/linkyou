class UserGifts {
  final int count;
  final int freeGifts;

  UserGifts({
    required this.count,
    required this.freeGifts,
  });

  factory UserGifts.fromJson(Map<String, dynamic> json) {
    return UserGifts(
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

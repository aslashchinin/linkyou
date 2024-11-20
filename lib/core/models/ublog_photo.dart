class UblogPhoto {
  final String id;
  final String src;

  UblogPhoto({
    required this.id,
    required this.src,
  });

  factory UblogPhoto.fromJson(Map<String, dynamic> json) {
    return UblogPhoto(
      id: json['id'],
      src: json['src'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'src': src,
    };
  }
}

class PhotoInput {
  final String src;

  PhotoInput({required this.src});

  Map<String, dynamic> toJson() {
    return {
      'src': src,
    };
  }
}

class PhotoEditInput {
  final String description;

  PhotoEditInput({required this.description});

  Map<String, dynamic> toJson() {
    return {
      'description': description,
    };
  }
}

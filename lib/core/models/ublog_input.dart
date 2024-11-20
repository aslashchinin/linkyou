class UblogInput {
  final String text;
  final String? videoLink;
  final String? audioLink;
  final List<String>? photos;

  UblogInput({
    required this.text,
    this.videoLink,
    this.audioLink,
    this.photos,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'video_link': videoLink,
      'audio_link': audioLink,
      'photos': photos,
    };
  }
}

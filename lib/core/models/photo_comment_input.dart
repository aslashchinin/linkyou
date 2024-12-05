class PhotoCommentInput {
  final String comment;

  PhotoCommentInput({required this.comment});

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
    };
  }
}

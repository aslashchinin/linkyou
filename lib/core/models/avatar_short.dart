import 'src.dart';

class AvatarShort {
  final int id;
  final Src src;

  AvatarShort({
    required this.id,
    required this.src,
  });

  factory AvatarShort.fromJson(Map<String, dynamic> json) {
    return AvatarShort(
      id: json['id'],
      src: Src.fromJson(json['src']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'src': src.toJson(),
    };
  }
}

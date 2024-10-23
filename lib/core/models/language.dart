import 'language_data.dart';
import 'level.dart';

class Language {
  final bool deleted;
  final int id;
  final LanguageData language;
  final String lastUpdate;
  final Level level;
  final int userId;

  Language({
    required this.deleted,
    required this.id,
    required this.language,
    required this.lastUpdate,
    required this.level,
    required this.userId,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      deleted: json['deleted'],
      id: json['id'],
      language: LanguageData.fromJson(json['language']),
      lastUpdate: json['last_update'],
      level: Level.fromJson(json['level']),
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deleted': deleted,
      'id': id,
      'language': language.toJson(),
      'last_update': lastUpdate,
      'level': level.toJson(),
      'user_id': userId,
    };
  }
}

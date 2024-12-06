import 'zodiac.dart';

class Birthday {
  final String age;
  final String? date;
  final Zodiac? zodiac;

  Birthday({
    required this.age,
    required this.date,
    required this.zodiac,
  });

  factory Birthday.fromJson(Map<String, dynamic> json) {
    return Birthday(
      age: json['age'],
      date: json['date'],
      zodiac: json['zodiac'] != null ? Zodiac.fromJson(json['zodiac']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'date': date,
      'zodiac': zodiac?.toJson(),
    };
  }
}

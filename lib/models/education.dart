import 'education_type.dart';
import 'institution.dart';
import 'speciality.dart';

class Education {
  final int id;
  final BigInt userId;
  final Speciality speciality;
  final EducationType educationType;
  final bool active;
  final bool deleted;
  final String lastUpdate;
  final Institution institution;

  Education({
    required this.id,
    required this.userId,
    required this.speciality,
    required this.educationType,
    required this.active,
    required this.deleted,
    required this.lastUpdate,
    required this.institution,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      id: json['id'],
      userId: BigInt.from(json['user_id']),
      speciality: Speciality.fromJson(json['speciality']),
      educationType: EducationType.fromJson(json['educationType']),
      active: json['active'],
      deleted: json['deleted'],
      lastUpdate: json['last_update'],
      institution: Institution.fromJson(json['institution']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'speciality': speciality.toJson(),
      'education_type': educationType.toJson(),
      'active': active,
      'deleted': deleted,
      'last_update': lastUpdate,
      'institution': institution.toJson(),
    };
  }
}

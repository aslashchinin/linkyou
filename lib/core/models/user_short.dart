import 'avatar_short.dart';
import 'gender_short.dart';
import 'birthday.dart';
import 'job_short.dart';
import 'location_short.dart';
import 'likes_short.dart';

class UserShort {
  final BigInt id;
  final AvatarShort avatar;
  final String name;
  final GenderShort gender;
  final int role;
  final Birthday birthday; // Можно оставить, если полное поле нужно
  final String roleStatus;
  final String lastAuth;
  final bool isTop100;
  final bool isPremium;
  final bool isVip;
  final JobShort job;
  final LocationShort location;
  final LikesShort likes;
  final int photosCount;
  final int ubLogsCount;
  final bool isOnline;

  UserShort({
    required this.id,
    required this.avatar,
    required this.name,
    required this.gender,
    required this.role,
    required this.birthday,
    required this.roleStatus,
    required this.lastAuth,
    required this.isTop100,
    required this.isPremium,
    required this.isVip,
    required this.job,
    required this.location,
    required this.likes,
    required this.photosCount,
    required this.ubLogsCount,
    required this.isOnline,
  });

  factory UserShort.fromJson(Map<String, dynamic> json) {
    return UserShort(
      id: BigInt.from(json['id']),
      avatar: AvatarShort.fromJson(json['avatar']),
      name: json['name'],
      gender: GenderShort.fromJson(json['gender']),
      role: json['role'],
      birthday: Birthday.fromJson(json['birthday']),
      roleStatus: json['role_status'],
      lastAuth: json['last_auth'],
      isTop100: json['is_top100'],
      isPremium: json['is_premium'],
      isVip: json['is_vip'],
      job: JobShort.fromJson(json['job']),
      location: LocationShort.fromJson(json['location']),
      likes: LikesShort.fromJson(json['likes']),
      photosCount: json['photos_count'],
      ubLogsCount: json['ublogs_count'],
      isOnline: json['is_online'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'avatar': avatar.toJson(),
      'name': name,
      'gender': gender.toJson(),
      'role': role,
      'birthday': birthday.toJson(),
      'role_status': roleStatus,
      'last_auth': lastAuth,
      'is_top100': isTop100,
      'is_premium': isPremium,
      'is_vip': isVip,
      'job': job.toJson(),
      'location': location.toJson(),
      'likes': likes.toJson(),
      'photos_count': photosCount,
      'ublogs_count': ubLogsCount,
      'is_online': isOnline,
    };
  }
}

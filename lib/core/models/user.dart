import 'avatar.dart';
import 'gender.dart';
import 'nationality.dart';
import 'goal.dart';
import 'looking_for.dart';
import 'children.dart';
import 'relationship.dart';
import 'smoking.dart';
import 'alcohol.dart';
import 'age.dart';
import 'job.dart';
import 'location.dart';
import 'birthday.dart';
import 'language.dart';
import 'rating.dart';
import 'gifts.dart';
import 'interests.dart';
import 'likes.dart';
import 'religion.dart';

class User {
  final int id;
  final Avatar avatar;
  final String name;
  final Gender gender;
  final int role;
  final bool isInvisible;
  final String roleStatus;
  final String lastAuth;
  final bool isTop100;
  final bool isPremium;
  final bool isVip;
  final Nationality? nationality;
  final Goal goal;
  final LookingFor lookingFor;
  final Children? children;
  final Relationship? relationship;
  final Smoking? smoking;
  final Alcohol? alcohol;
  final Age age;
  final int? height;
  final String? about;
  final Job? job;
  final Location location;
  final Birthday birthday;
  final List<Language> languages;
  final Rating rating;
  final Gifts? gifts;
  final Interests? interests;
  final Likes likes;
  final int photosCount;
  final bool isFavorited;
  final bool isBlacklisted;
  final int ubLogsCount;
  final bool isOnline;
  final Religion? religion;

  User({
    required this.id,
    required this.avatar,
    required this.name,
    required this.gender,
    required this.role,
    required this.isInvisible,
    required this.roleStatus,
    required this.lastAuth,
    required this.isTop100,
    required this.isPremium,
    required this.isVip,
    required this.nationality,
    required this.goal,
    required this.lookingFor,
    required this.children,
    required this.relationship,
    required this.smoking,
    required this.alcohol,
    required this.age,
    required this.height,
    required this.about,
    required this.job,
    required this.location,
    required this.birthday,
    required this.languages,
    required this.rating,
    required this.gifts,
    required this.interests,
    required this.likes,
    required this.photosCount,
    required this.isFavorited,
    required this.isBlacklisted,
    required this.ubLogsCount,
    required this.isOnline,
    required this.religion,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      avatar: Avatar.fromJson(json['avatar']),
      name: json['name'],
      gender: Gender.fromJson(json['gender']),
      role: json['role'],
      isInvisible: json['is_invisible'] ?? false,
      roleStatus: json['role_status'],
      lastAuth: json['last_auth'],
      isTop100: json['is_top100'] ?? false,
      isPremium: json['is_premium'] ?? false,
      isVip: json['is_vip'] ?? false,
      nationality: json['nationality'] != null
          ? Nationality.fromJson(json['nationality'])
          : null,
      goal: Goal.fromJson(json['goal']),
      lookingFor: LookingFor.fromJson(json['lookingFor']),
      children: json['children'] != null
          ? Children.fromJson(json['children'])
          : null,
      relationship: json['relationship'] != null
          ? Relationship.fromJson(json['relationship'])
          : null,
      smoking: json['smoking'] != null
          ? Smoking.fromJson(json['smoking'])
          : null,
      alcohol: json['alcohol'] != null
          ? Alcohol.fromJson(json['alcohol'])
          : null,
      age: Age.fromJson(json['age']),
      height: json['height'],
      about: json['about'],
      job: json['job'] != null ? Job.fromJson(json['job']) : null,
      location: Location.fromJson(json['location']),
      birthday: Birthday.fromJson(json['birthday']),
      languages: List<Language>.from(
          json['languages'].map((x) => Language.fromJson(x))),
      rating: Rating.fromJson(json['rating']),
      gifts: Gifts.fromJson(json['gifts']),
      interests: Interests.fromJson(json['interests']),
      likes: Likes.fromJson(json['likes']),
      photosCount: json['photos_count'],
      isFavorited: json['is_favorited'],
      isBlacklisted: json['is_blacklisted'],
      ubLogsCount: json['ublogs_count'],
      isOnline: json['is_online'],
      religion: json['religion'] != null
          ? Religion.fromJson(json['religion'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'avatar': avatar.toJson(),
      'name': name,
      'gender': gender.toJson(),
      'role': role,
      'is_invisible': isInvisible,
      'role_status': roleStatus,
      'last_auth': lastAuth,
      'is_top100': isTop100,
      'is_premium': isPremium,
      'is_vip': isVip,
      'nationality': nationality?.toJson(),
      'goal': goal.toJson(),
      'lookingFor': lookingFor.toJson(),
      'children': children?.toJson(),
      'relationship': relationship?.toJson(),
      'smoking': smoking?.toJson(),
      'alcohol': alcohol?.toJson(),
      'age': age.toJson(),
      'height': height,
      'about': about,
      'job': job?.toJson(),
      'location': location.toJson(),
      'birthday': birthday.toJson(),
      'languages': List<dynamic>.from(languages.map((x) => x.toJson())),
      'rating': rating.toJson(),
      'gifts': gifts?.toJson(),
      'interests': interests?.toJson(),
      'likes': likes.toJson(),
      'photos_count': photosCount,
      'is_favorited': isFavorited,
      'is_blacklisted': isBlacklisted,
      'ublogs_count': ubLogsCount,
      'is_online': isOnline,
      'religion': religion?.toJson(),
    };
  }
}

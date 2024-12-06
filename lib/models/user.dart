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
import 'user_gifts.dart';
import 'interests.dart';
import 'likes.dart';
import 'religion.dart';
import 'orientation.dart';
import 'education.dart';
import 'book.dart';
import 'pet.dart';
import 'music.dart';
import 'ublog_post.dart';
import 'package:linkyou/core/base/model_interface_base.dart';

class User implements ModelInterfaceBase {
  final BigInt id;
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
  final Orientation? orientation;
  final Children? children;
  final Relationship? relationship;
  final Smoking? smoking;
  final Alcohol? alcohol;
  final Age age;
  final int? height;
  final int? weight;
  final String? about;
  final Job? job;
  final Location location;
  final Birthday birthday;
  final List<Language> languages;
  final List<Education>? education;
  final Rating? rating;
  final UserGifts? gifts;
  final Interests? interests;
  final Likes likes;
  final int photosCount;
  final bool isFavorited;
  final bool isBlacklisted;
  final int ubLogsCount;
  final bool isOnline;
  final Religion? religion;
  final List<Book>? books;
  final List<Pet>? pets;
  final List<Music>? music;
  final UblogPost? ublogPost;

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
    required this.orientation,
    required this.children,
    required this.relationship,
    required this.smoking,
    required this.alcohol,
    required this.age,
    required this.height,
    required this.weight,
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
    required this.education,
    required this.books,
    required this.pets,
    required this.music,
    required this.ublogPost,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    try {
      return User(
        id: BigInt.from(json['id']),
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
        orientation: json['orientation'] != null
            ? Orientation.fromJson(json['orientation'])
            : null,
        children: json['children'] != null
            ? Children.fromJson(json['children'])
            : null,
        relationship: json['relationship'] != null
            ? Relationship.fromJson(json['relationship'])
            : null,
        smoking:
            json['smoking'] != null ? Smoking.fromJson(json['smoking']) : null,
        alcohol:
            json['alcohol'] != null ? Alcohol.fromJson(json['alcohol']) : null,
        education: json['education'] != null
            ? List<Education>.from(
                json['education'].map((x) => Education.fromJson(x)))
            : null,
        age: Age.fromJson(json['age']),
        books: json['books'] != null
            ? List<Book>.from(json['books'].map((x) => Book.fromJson(x)))
            : [],
        pets: json['pets'] != null
            ? List<Pet>.from(json['pets'].map((x) => Pet.fromJson(x)))
            : [],
        music: json['music'] != null
            ? List<Music>.from(json['music'].map((x) => Music.fromJson(x)))
            : [],
        height: json['height'],
        weight: json['weight'],
        about: json['about'],
        job: json['job'] != null ? Job.fromJson(json['job']) : null,
        location: Location.fromJson(json['location']),
        birthday: Birthday.fromJson(json['birthday']),
        languages: List<Language>.from(
            json['languages'].map((x) => Language.fromJson(x))),
        rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
        gifts: json['gifts'] != null ? UserGifts.fromJson(json['gifts']) : null,
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
        ublogPost: (json['ublogs'] != null &&
                json['ublogs']['last'] != null &&
                json['ublogs']['last'].isNotEmpty)
            ? UblogPost.fromJson(json['ublogs']['last'])
            : null,
      );
    } catch (e, stackTrace) {
      print('Ошибка: $e');
      print('Стек вызовов: $stackTrace');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    try {
      return {
        'id': id.toString(),
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
        'orientation': orientation?.toJson(),
        'children': children?.toJson(),
        'relationship': relationship?.toJson(),
        'smoking': smoking?.toJson(),
        'alcohol': alcohol?.toJson(),
        'age': age.toJson(),
        'height': height,
        'weight': weight,
        'about': about,
        'job': job?.toJson(),
        'location': location.toJson(),
        'birthday': birthday.toJson(),
        'languages': List<dynamic>.from(languages.map((x) => x.toJson())),
        'rating': rating?.toJson(),
        'gifts': gifts?.toJson(),
        'interests': interests?.toJson(),
        'likes': likes.toJson(),
        'photos_count': photosCount,
        'is_favorited': isFavorited,
        'is_blacklisted': isBlacklisted,
        'ublogs_count': ubLogsCount,
        'is_online': isOnline,
        'religion': religion?.toJson(),
        'books': books != null
            ? List<dynamic>.from(books!.map((x) => x.toJson()))
            : [],
        'pets': pets != null
            ? List<dynamic>.from(pets!.map((x) => x.toJson()))
            : [],
        'music': music != null
            ? List<dynamic>.from(music!.map((x) => x.toJson()))
            : [],
        'ublogs': {
          'last': ublogPost?.toJson(),
        },
      };
    } catch (e, stackTrace) {
      print('Ошибка: $e');
      print('Стек вызовов: $stackTrace');
      rethrow;
    }
  }
}

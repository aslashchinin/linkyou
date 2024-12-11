import 'package:flutter/material.dart';
import 'package:linkyou/pages/welcome/welcome_screen.dart';
import 'package:linkyou/pages/home/home_screen.dart';
import 'package:linkyou/pages/auth/auth_screen.dart';
import 'package:linkyou/pages/top/top_screen.dart';
import 'package:linkyou/pages/search/search_screen.dart';
import 'package:linkyou/pages/about/about_screen.dart';
import 'package:linkyou/pages/user/user_screen.dart';
import 'package:linkyou/pages/likeyou/likeyou_screen.dart';
import 'package:linkyou/pages/photo_comment/photo_comment_page.dart';
import 'package:linkyou/models/photo.dart';
import 'package:linkyou/models/dialog.dart' as dialog_library;
import 'package:linkyou/pages/photo/photo_screen.dart';
import 'package:linkyou/pages/dialog/dialog_screen.dart';
import 'package:linkyou/pages/dialog_message/dialog_message_screen.dart';

class RouteService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static const String welcome = '/welcome';
  static const String registration = '/registration';
  static const String login = '/login';
  static const String home = '/home';
  static const String top = '/top';
  static const String search = '/search';
  static const String about = '/about';
  static const String user = '/user';
  static const String likeYou = '/likeyou';
  static const String userUblogs = '/user_ublogs';
  static const String photoComment = '/photo_comment';
  static const String photo = '/photo';
  static const String dialog = '/dialog';
  static const String dialogMessage = '/dialog_message';
  
  static Map<String, WidgetBuilder> get routes {    
    return {
      welcome: (context) => const WelcomeScreen(),
      registration: (context) => const AuthScreen(initialTab: 1),
      login: (context) => const AuthScreen(initialTab: 0),
      home: (context) => const HomeScreen(),
      top: (context) => const TopScreen(),
      search: (context) => const SearchScreen(),
      about: (context) => const AboutScreen(),
      user: (context) => UserScreen(
          userId: ModalRoute.of(context)!.settings.arguments as BigInt),
      likeYou: (context) => const LikeYouScreen(),
      photoComment: (context) => PhotoCommentScreen(
          photo: ModalRoute.of(context)!.settings.arguments as Photo),
      photo: (context) {
        final args = ModalRoute.of(context)!.settings.arguments as List<Photo>;
        return PhotoScreen(
            photos: args, initialIndex: 0); // добавьте свой индекс
      },
      dialog: (context) => const DialogScreen(),
      dialogMessage: (context) {
        final args = ModalRoute.of(context)!.settings.arguments
            as List<dialog_library.Dialog>;
        return DialogMessageScreen(dialog: args[0]);
      },
    };
  }
}

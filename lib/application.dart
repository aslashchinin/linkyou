import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/providers/api_provider.dart';
import 'routes.dart';
import 'common/providers/auth_provider.dart';

class LinkYouApp extends StatelessWidget {
  const LinkYouApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiProvider>(
          create: (_) => ApiProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'LinkYou Mobile',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.blue,
            ),
          ),
        ),
        initialRoute: '/',
        routes: AppRoutes.routes,
      ),
    );
  }
}

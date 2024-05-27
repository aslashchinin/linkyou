import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes/app_routes.dart';
import 'services/api_service.dart';
import 'providers/auth_provider.dart';

void main() {
  runApp(LinkYouApp());
}

class LinkYouApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     providers: [
        Provider<ApiService>(
          create: (_) => ApiService(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'LinkYou Mobile',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: AppRoutes.routes,
      ),
    );
  }
}
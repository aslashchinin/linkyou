import 'package:flutter/material.dart';
import 'package:linkyou/core/services/locator_service.dart';
import 'package:linkyou/application.dart';
import 'package:intl/intl_standalone.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  ServiceLocator.setup();
  WidgetsFlutterBinding.ensureInitialized();
  String? locale = await findSystemLocale();
  await initializeDateFormatting(locale, null);
  runApp(const LinkYouApp());
}

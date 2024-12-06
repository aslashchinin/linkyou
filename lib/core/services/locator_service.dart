library locator_service;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Providers
import 'package:linkyou/core/providers/auth_provider.dart';

// ViewModels
import 'package:linkyou/ui/blocks/users_top/users_top_viewmodel.dart';
import 'package:linkyou/ui/blocks/users_new/users_new_viewmodel.dart';
import 'package:linkyou/ui/blocks/users_daily/users_daily_viewmodel.dart';
import 'package:linkyou/ui/blocks/users_daily_cities/users_daily_cities_viewmodel.dart';
import 'package:linkyou/ui/blocks/form_login/form_login_viewmodel.dart';
import 'package:linkyou/pages/user/user_viewmodel.dart';
import 'package:linkyou/ui/blocks/user_photos/user_photo_viewmodel.dart';
import 'package:linkyou/ui/blocks/gifts_slider/gifts_slider_viewmodel.dart';
import 'package:linkyou/pages/splash/splash_viewmodel.dart';
import 'package:linkyou/ui/blocks/layout_appbar/layout_appbar_viewmodel.dart';
import 'package:linkyou/ui/blocks/layout_menu/layout_menu_viewmodel.dart';
import 'package:linkyou/pages/auth/auth_viewmodel.dart';
import 'package:linkyou/ui/blocks/form_registration/form_registration_viewmodel.dart';
import 'package:linkyou/ui/blocks/form_password_recovery/form_password_recovery_viewmodel.dart';
import 'package:linkyou/pages/welcome/welcome_viewmodel.dart';
import 'package:linkyou/pages/photo/photo_viewmodel.dart';
import 'package:linkyou/ui/blocks/photo_comments/photo_comments_viewmodel.dart';

// Services
import 'package:linkyou/data/user/user_service.dart';
import 'package:linkyou/data/ublog/ublog_service.dart';
import 'package:linkyou/data/auth/auth_service.dart';
import 'package:linkyou/data/photo/photo_service.dart';

// Repositories
import 'package:linkyou/data/user/user_repository.dart';
import 'package:linkyou/data/ublog/ublog_repository.dart';
import 'package:linkyou/data/auth/auth_repository.dart';
import 'package:linkyou/data/photo/photo_repository.dart';

// Repository Interfaces
import 'package:linkyou/data/user/user_repository_interface.dart';
import 'package:linkyou/data/ublog/ublog_repository_interface.dart';
import 'package:linkyou/data/auth/auth_repository_interface.dart';
import 'package:linkyou/data/photo/photo_repository_interface.dart';

part 'locator_service_providers.dart';
part 'locator_service_services.dart';
part 'locator_service_repositories.dart';
part 'locator_service_viewmodels.dart';

final serviceLocator = GetIt.instance;

class ServiceLocator {
  static void setup() {
    _setupProviders();
    _setupServices();
    _setupRepositories();
    _setupViewModels();
  }

  static List<ChangeNotifierProvider> getProviders() {
    return _getProvidersList();
  }
}

import 'package:flutter/material.dart';
import 'package:linkyou/views/blocks/form_password_recovery/form_password_recovery_block.dart';
import 'package:linkyou/core/providers/auth_provider.dart';
import 'package:linkyou/views/screens/home/home_screen.dart';
import 'package:linkyou/core/services/locator_service.dart';
import 'package:linkyou/data/auth/auth_repository_interface.dart';
import 'package:linkyou/core/models/auth_signin_input.dart';

class FormLoginViewModel extends ChangeNotifier {
  FormLoginViewModel({required AuthRepositoryInterface repository})
      : _repository = repository;

  final AuthRepositoryInterface _repository;
  AuthRepositoryInterface get repository => _repository;

  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      // Ждем ответ от метода входа
      final response = await repository.signIn(AuthSigninInput(
        login: email,
        password: password,
      ));

      // Получаем экземпляр AuthProvider
      final authProvider = serviceLocator<AuthProvider>();

      // Обновляем состояние AuthProvider
      authProvider.login(response.data);

      // Проверка токена и переход на HomeScreen
      if (authProvider.token != null) {
        // Ждем завершения обновления состояния
        notifyListeners();
        // Переход на основной экран
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else {
        throw Exception('Токен отсутствует');
      }
    } catch (e) {
      // Обработка ошибок
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Авторизация не удалась')),
      );
      // Логируем ошибку (по желанию)
      print(e.toString());
    }
  }

  void showPasswordRecoveryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const FormPasswordRecoveryBlock();
      },
    );
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:linkyou/common/widgets/RoundedButton.dart';
import 'package:linkyou/common/widgets/TextInput.dart';
import 'password_recovery_dialog.dart';
import 'package:provider/provider.dart';
import 'package:linkyou/common/providers/auth_provider.dart';
import 'package:linkyou/routes.dart';
import 'package:linkyou/common/services/api_services.dart';

class LoginTab extends StatefulWidget {
  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signIn() async {
    final apiService = ApiService();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      final response = await apiService.signIn(
          _emailController.text, _passwordController.text);
      if (response['token'] != null) {
        authProvider.setToken(response['token']);
        authProvider.setUser(response['user']);
        Navigator.pushReplacementNamed(context, AppRoutes.main);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Авторизация не удалась')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Произошла ошибка: $e')),
      );
    }
  }

  void _showPasswordRecoveryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return PasswordRecoveryDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextInput(
            controller: _emailController,
            hint: 'E-mail',
          ),
          const SizedBox(height: 20),
          TextInput(
            controller: _passwordController,
            hint: 'Пароль',
            obscureText: true,
          ),
          const SizedBox(height: 20),
          RoundedButton(
            text: 'Войти',
            onPressed: _signIn,
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => _showPasswordRecoveryDialog(context),
            child: const Text(
              'Забыли пароль?',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/api_service.dart';

class PasswordRecoveryDialog extends StatefulWidget {
  @override
  _PasswordRecoveryDialogState createState() => _PasswordRecoveryDialogState();
}

class _PasswordRecoveryDialogState extends State<PasswordRecoveryDialog> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _message = '';
  Color _messageColor = Colors.green;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _recoverPassword() async {
    final apiService = Provider.of<ApiService>(context, listen: false);
    try {
      final response =
          await apiService.postForgotPassword(_emailController.text);
      if (response['done']) {
        _message =
            'На вашу почту было отправлено сообщение с инструкцией по восстановлению пароля';
        _messageColor = Colors.green;
      }
    } catch (e) {
      _message = 'Ошибка: Логин не найден в базе данных!';
      _messageColor = Colors.red;
    } finally {
      Navigator.of(context).pop(); // Закрываем диалог восстановления пароля
      _emailController.clear(); // Очищаем форму
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_message),
          backgroundColor: _messageColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Восстановить пароль'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            hintText: 'E-mail',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Пожалуйста, введите E-mail';
            }
            final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
            if (!emailRegExp.hasMatch(value)) {
              return 'Введите правильный E-mail';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _recoverPassword();
            }
          },
          child: Text('Восстановить'),
        ),
      ],
    );
  }
}

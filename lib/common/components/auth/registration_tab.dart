import 'package:flutter/material.dart';
import 'package:linkyou/common/widgets/RoundedButton.dart';
import 'package:linkyou/common/widgets/TextInput.dart';

class RegistrationTab extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextInput(hint: 'E-mail', controller: _emailController),
          const SizedBox(height: 10),
          TextInput(
            controller: _passwordController,
            hint: 'Пароль',
            obscureText: true,
          ),
          const SizedBox(height: 20),
          RoundedButton(
            onPressed: () {
              // Add registration logic here
            },
            text: 'Зарегистрироваться',
          ),
          const SizedBox(height: 10),
          const Text(
            'Регистрируясь на сайте вы соглашаетесь с условиями использования и политикой безопасности',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

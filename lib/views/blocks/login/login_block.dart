import 'package:flutter/material.dart';
import 'package:linkyou/views/widgets/inputs/round_input.dart';
import 'package:linkyou/views/widgets/buttons/round_button.dart';
import 'package:provider/provider.dart';
import 'login_viewmodel.dart';

class LoginBlock extends StatefulWidget {
  const LoginBlock({super.key});

  @override
  _LoginBlockState createState() => _LoginBlockState();
}

class _LoginBlockState extends State<LoginBlock> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          RoundInput(
            controller: _emailController,
            hint: 'E-mail',
          ),
          const SizedBox(height: 20),
          RoundInput(
            controller: _passwordController,
            hint: 'Пароль',
            obscureText: true,
          ),
          const SizedBox(height: 20),
          RoundButton(
            text: 'Войти',
            isBlue: true,
            onPressed: () => viewModel.login(context),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => viewModel.showPasswordRecoveryDialog(context),
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

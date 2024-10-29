import 'package:flutter/material.dart';
import 'package:linkyou/views/widgets/controlls/round_input.dart';
import 'package:linkyou/views/widgets/controlls/round_button.dart';
import 'package:provider/provider.dart';
import 'form_registration_viewmodel.dart';

class FormRegistrationBlock extends StatelessWidget {
  const FormRegistrationBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FormRegistrationViewModel>(context);
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          RoundInput(hint: 'E-mail', controller: _emailController),
          const SizedBox(height: 10),
          RoundInput(
            controller: _passwordController,
            hint: 'Пароль',
            obscureText: true,
          ),
          const SizedBox(height: 20),
          RoundButton(
            onPressed: () => viewModel.register(context),
            isBlue: true,
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

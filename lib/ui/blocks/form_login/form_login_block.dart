import 'package:flutter/material.dart';
import 'package:linkyou/ui/widgets/controlls/round_input.dart';
import 'package:linkyou/ui/widgets/controlls/round_button.dart';
import 'package:provider/provider.dart';
import 'form_login_viewmodel.dart';

class FormLoginBlock extends StatefulWidget {
  const FormLoginBlock({super.key});

  @override
  FormLoginBlockState createState() => FormLoginBlockState();
}

class FormLoginBlockState extends State<FormLoginBlock> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FormLoginViewModel>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
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
            onPressed: () => viewModel.login(context, _emailController.text, _passwordController.text),
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

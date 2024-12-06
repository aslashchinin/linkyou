import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'form_password_recovery_viewmodel.dart';

class FormPasswordRecoveryBlock extends StatefulWidget {
  const FormPasswordRecoveryBlock({super.key});

  @override
  FormPasswordRecoveryBlockState createState() => FormPasswordRecoveryBlockState();
}

class FormPasswordRecoveryBlockState extends State<FormPasswordRecoveryBlock> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FormPasswordRecoveryViewModel>(context);
    return AlertDialog(
      title: const Text('Восстановить пароль'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(
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
              viewModel.recover(context);
            }
          },
          child: const Text('Восстановить'),
        ),
      ],
    );
  }
}

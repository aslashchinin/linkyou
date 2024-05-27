import 'package:flutter/material.dart';
import 'password_recovery_dialog.dart';
import 'package:provider/provider.dart';
import '../../services/api_service.dart';
import '../../providers/auth_provider.dart';
import '../../routes/app_routes.dart';

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
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Sign In Failed')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('An error occurred: $e')));
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
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'E-mail',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: 'Пароль',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _signIn,
            child: Text('Войти'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () => _showPasswordRecoveryDialog(context),
            child: Text('Забыли пароль?'),
          ),
        ],
      ),
    );
  }
}

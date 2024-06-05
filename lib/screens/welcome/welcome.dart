import 'package:flutter/material.dart';
import 'widgets/custom_button.dart';
import '../../routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo/logo.png'),
                  const SizedBox(width: 10),
                  const Text(
                    'ЗНАКОМЬТЕСЬ\nПО ПРОФЕССИИ',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: Image.asset('assets/wellcomeTizer/welcome.png'),
              ),
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  'LinkYou – это закрытый клуб знакомств, где Вы можете найти равного себе партнера для жизни',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 60),
              Container(
                width: 250,
                child: Column(
                  children: [
                    CustomButton(
                      text: 'Регистрация',
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.registration);
                      },
                      isGreen: true,
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: 'Войти',
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.login);
                      },
                      isOutlined: true,
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: 'Гостевой вход',
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.main);
                      },
                      isGreen: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

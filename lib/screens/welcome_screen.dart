import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_button.dart';
import '../routes/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
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
              Text(
                'LINKYOU',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'ЗНАКОМЬТЕСЬ ПО ПРОФЕССИИ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'LinkYou – это закрытый клуб знакомств, где Вы можете найти равного себе партнера для жизни',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Container(
                width:
                    200, // Устанавливаем фиксированную ширину для всех кнопок
                child: Column(
                  children: [
                    CustomButton(
                      text: 'Регистрация',
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.registration);
                      },
                      isGreen: true,
                    ),
                    SizedBox(height: 10),
                    CustomButton(
                      text: 'Войти',
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.login);
                      },
                      isOutlined: true,
                    ),
                    SizedBox(height: 10),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'welcome_viewmodel.dart';
import 'package:linkyou/views/widgets/buttons/round_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WelcomeViewModel>(context);
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
              SizedBox(
                width: 250,
                child: Column(
                  children: [
                    RoundButton(
                      text: 'Регистрация',
                      onPressed: () => viewModel.register(context),
                      isGreen: true,
                    ),
                    const SizedBox(height: 10),
                    RoundButton(
                      text: 'Войти',
                      onPressed: () => viewModel.login(context),
                      isOutlined: true,
                    ),
                    const SizedBox(height: 10),
                    RoundButton(
                      text: 'Гостевой вход',
                      onPressed: () => viewModel.home(context),
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

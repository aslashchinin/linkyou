import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';
import 'package:linkyou/views/widgets/pictures/picture.dart';
import 'package:linkyou/views/widgets/buttons/round_button.dart';

class AboutScreen extends ScreenBase {
  const AboutScreen({super.key});
  @override
  AboutScreenState createState() => AboutScreenState();
}

class AboutScreenState extends ScreenBaseState<AboutScreen> {
  @override
  Widget buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Миссия
          const Text(
            'Наша миссия — помогать людям создавать по-настоящему крепкие пары.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Люди с похожими профессиями всегда найдут общие темы для общения.',
          ),
          const SizedBox(height: 20),
          // Картинка
          Picture(path: 'assets/about/mission.png'),
          const SizedBox(height: 20),

          // Поиск по профессии
          const Text(
            'Поиск по профессии поможет найти людей, с которыми у вас много общего',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Например, мужчина хирург познакомится с женским врачом. Топ-менеджер найдет для себя очаровательную и успешную спутницу жизни.',
          ),
          const SizedBox(height: 20),
          Picture(path: 'assets/about/profession.png'),
          const SizedBox(height: 20),

          // Поиск по национальности
          const Text(
            'Поиск по национальности и вероисповеданию',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Теперь Вы можете искать людей своей национальности и вероисповедания. Мы уважаем все религии и народы.',
          ),
          const SizedBox(height: 20),
          Picture(path: 'assets/about/nationality.png'),
          const SizedBox(height: 20),

          // Живые люди
          const Text(
            'Никаких роботов — только живые люди на сайте.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Мы за честность. Поэтому мы не создавали тысячи поддельных анкет, чтобы водить людей за нос.',
          ),
          const SizedBox(height: 20),
          Picture(path: 'assets/about/robot.png'),
          const SizedBox(height: 20),

          // Против хамства
          const Text(
            'Link You против хамства и предложений интима',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Нашли на LinkYou скрытую рекламу интим услуг или Вас оскорбляет другой участник сервиса? Просто расскажите нам об этом через службу технической поддержки.',
          ),
          const SizedBox(height: 20),
          Picture(path: 'assets/about/misbehavior.png'),
          const SizedBox(height: 20),

          // Полезные функции
          const Text(
            'Масса полезных функций и приятных сюрпризов',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Команда LinkYou не прекращает работать над улучшением своего сервиса, чтобы сделать его более эффективным и удобным для Вас.',
          ),
          const SizedBox(height: 20),
          Picture(path: 'assets/about/surprise.png'),
          const SizedBox(height: 20),
          // Кнопка "Начать поиск"
          Center(
            child: RoundButton(
              onPressed: () {},
              isBlue: true,
              text: 'Начать поиск',
            ),
          ),
        ],
      ),
    );
  }
}

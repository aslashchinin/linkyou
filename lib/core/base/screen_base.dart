import 'package:flutter/material.dart';
import 'package:linkyou/views/blocks/layout_appbar/layout_appbar_block.dart';
import 'package:linkyou/views/blocks/layout_menu/layout_menu_block.dart';

// Абстрактный базовый класс виджета
abstract class ScreenBase extends StatefulWidget {
  const ScreenBase({Key? key}) : super(key: key);

  @override
  ScreenBaseState createState();
}

// Абстрактный базовый класс состояния
abstract class ScreenBaseState<T extends ScreenBase> extends State<T> {
  // Флаг для управления отображением drawer
  bool get showDrawer => true;

  // Флаг для управления отображением AppBar
  bool get showAppBar => true;

  // Можно переопределить для изменения цвета фона
  Color get backgroundColor => Colors.white;

  // Можно переопределить для изменения отступов контента
  EdgeInsets get contentPadding => const EdgeInsets.all(16.0);

  // Абстрактный метод для построения содержимого экрана
  Widget buildContent(BuildContext context);

  // Метод для построения AppBar, может быть переопределен
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return showAppBar ? const LayoutAppBarBlock() : null;
  }

  // Метод для построения drawer, может быть переопределен
  Widget? buildDrawer(BuildContext context) {
    return showDrawer ? const LayoutMenuBlock() : null;
  }

  // Метод для построения нижней навигации, если нужна
  Widget? buildBottomNavigation(BuildContext context) {
    return null;
  }

  // Метод для добавления floating action button, если нужен
  Widget? buildFloatingActionButton(BuildContext context) {
    return null;
  }

  // Базовая реализация build метода
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: buildDrawer(context),      
      backgroundColor: backgroundColor,
      bottomNavigationBar: buildBottomNavigation(context),
      floatingActionButton: buildFloatingActionButton(context),
      body: buildContent(context),
    );
  }
}

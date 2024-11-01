import 'package:flutter/material.dart';
import 'package:linkyou/views/widgets/controlls/circular_progress_blue.dart';
import 'package:provider/provider.dart';
import 'gifts_slider_viewmodel.dart';
import 'package:linkyou/views/widgets/tiles/gift_tile.dart';
import 'package:linkyou/core/models/gifts.dart';
import 'dart:async';

class GiftsSliderBlock extends StatefulWidget {
  const GiftsSliderBlock({super.key});

  @override
  State<GiftsSliderBlock> createState() => _GiftsSliderBlockState();
}

class _GiftsSliderBlockState extends State<GiftsSliderBlock> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    Provider.of<GiftsSliderViewModel>(context, listen: false).loadGiftsList();
    _pageController = PageController(initialPage: 0);

    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      // Программно переключаемся на нужную страницу
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GiftsSliderViewModel>(context, listen: true);

    return viewModel.gifts.isEmpty
        ? const Center(child: CircularProgressBlue())
        : SizedBox(
            height: 100,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 4,
              itemBuilder: (context, index) {
                Gifts category = viewModel.gifts[index];
                return Row(
                  children: category.items
                      .asMap()
                      .entries
                      .take(3)
                      .map((entry) => GiftTile(gift: entry.value))
                      .toList(),
                );
              },
            ),
          );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Отменяем таймер при завершении работы
    _pageController.dispose(); // Освобождаем контроллер
    super.dispose();
  }
}

import 'package:intl/intl.dart';

class PluralizerHelper {
  static String getCount(
      int count, String singularForm, String pluralForm, String genitiveForm) {
    if (count % 10 == 1 && count % 100 != 11) {
      return '$count $singularForm';
    } else if ((count % 10 >= 2 && count % 10 <= 4) &&
        (count % 100 < 12 || count % 100 > 14)) {
      return '$count $pluralForm';
    } else {
      return '$count $genitiveForm';
    }
  }

  static String formatDate(DateTime date) {
    final now = DateTime.now();

    // Проверка на сегодня
    if (now.year == date.year &&
        now.month == date.month &&
        now.day == date.day) {
      return 'Сегодня';
    }

    // Проверка на вчера
    final yesterday = now.subtract(Duration(days: 1));
    if (yesterday.year == date.year &&
        yesterday.month == date.month &&
        yesterday.day == date.day) {
      return 'Вчера';
    }

    // Форматирование даты
    return DateFormat('d MMM, y').format(date); // Пример: 31 окт, 2024
  }
}

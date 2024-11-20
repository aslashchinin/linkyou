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
}

import 'package:flutter/material.dart';
import 'package:linkyou/core/models/education.dart';
import 'package:linkyou/core/models/language.dart';

class BuildHelper {
  static Widget buildLanguage(Language language, bool isShowTitle) {
    String title = '${language.language.name} (${language.level.name})';
    return buildRow(isShowTitle ? 'Знание языков' : '', title);
  }

  static Widget buildEducation(Education education) {
    return Column(
      children: [
        buildRow('Образования', education.educationType.name),
        buildRow('Название учебного заведения', education.institution.name),
        buildRow('Специальность', education.speciality.name),
      ],
    );
  }

  static Widget buildRow(String key, String value) {
    if (value.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              key,
              textAlign: TextAlign.left,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildIconInfo(IconData icon, String info) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 18,
        ),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            info,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ],
    );
  }

  static Widget buildInfo(String info) {
    return Chip(
      label: Text(info),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

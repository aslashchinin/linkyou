import 'package:flutter/material.dart';
import 'package:linkyou/core/models/user.dart';
import 'package:linkyou/core/models/education.dart';
import 'package:linkyou/core/models/language.dart';

class UserEducation extends StatelessWidget {
  final User user;

  const UserEducation({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    print(user.education);
    return Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.school, color: Colors.grey[700]),
                const SizedBox(width: 8),
                const Text(
                  'Образование',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            user.education != null
                ? Column(
                    children: user.education!.map(_buildEducation).toList(),
                  )
                : const SizedBox.shrink(),
            user.languages.isNotEmpty
                ? Column(
                    children: user.languages.map(_buildLanguage).toList(),
                  )
                : const SizedBox.shrink(),
          ],
        ));
  }

  Widget _buildLanguage(Language language) {
    return _buildRow('Знание языков', language.language.name);
  }

  Widget _buildEducation(Education education) {
    return Column(
      children: [
        _buildRow('Образования', education.educationType.name),
        _buildRow('Название учебного заведения', education.institution.name),
        _buildRow('Специальность', education.speciality.name)
      ],
    );
  }

  Widget _buildRow(String key, String value) {
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
              textAlign: TextAlign.right, // Выравниваем значение вправо
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Picture extends StatelessWidget {
  final String path;
  Picture({required this.path});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }
}

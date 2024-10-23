import 'package:flutter/material.dart';
import 'package:linkyou/core/base/screen_base.dart';

class SearchScreen extends ScreenBase {
  const SearchScreen({super.key});
  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends ScreenBaseState<SearchScreen> {
  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        Text('Search Screen'),
      ],
    );
  }
}

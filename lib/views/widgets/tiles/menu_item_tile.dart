import 'package:flutter/material.dart';

class MenuItemTile extends StatelessWidget {
  const MenuItemTile({
    required this.title,
    required this.onTap,
    required this.leading,
    super.key,
  });

  final String title;
  final VoidCallback onTap;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListTile(
        leading: leading,
        title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
        onTap: onTap,
      ),
    );
  }
}

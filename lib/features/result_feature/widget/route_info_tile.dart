import 'package:flutter/material.dart';

class RouteInfoTile extends StatelessWidget {
  const RouteInfoTile({
    required this.text,
    required this.icon,
    super.key,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        title: Text(text),
        leading: Icon(icon),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}

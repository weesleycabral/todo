import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Widget? trailing;
  final void Function()? onTap;

  const MyDrawerTile({
    super.key,
    required this.text,
    this.icon,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        trailing: trailing,
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        onTap: onTap,
      ),
    );
  }
}

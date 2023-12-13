import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const CustomIconButton({super.key, required this.onPressed, required this.icon,});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      disabledColor: Colors.grey,
      splashColor: Colors.indigo.withOpacity(0.3),
      icon: Icon(
        icon,
        size: 32,
        color: Theme.of(context).colorScheme.primary
      ),
    );
  }
}
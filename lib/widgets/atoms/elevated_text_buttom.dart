import 'package:flutter/material.dart';

class ElevatedTextButtonDefault extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Icon? icon;
  final Size? size;
  final double? fontSize;

  const ElevatedTextButtonDefault(
      {required this.onPressed,
      required this.text,
      this.icon,
      this.size,
      this.fontSize,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          elevation: 10,
          backgroundColor: Theme.of(context).colorScheme.primary,
          fixedSize: size ?? Size(MediaQuery.of(context).size.width / 2.3, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
      ),
      onPressed: onPressed,
      icon: icon ?? Container(),
      label: Text(text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary, 
            fontSize: fontSize ?? 12,      
          )
      ),
    );
  }
}
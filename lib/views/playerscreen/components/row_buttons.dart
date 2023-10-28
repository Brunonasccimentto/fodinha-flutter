import 'package:flutter/material.dart';

class RowButtons extends StatelessWidget {
  final List<Widget> buttons;

  const RowButtons({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(bottom: 60),
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: buttons,
              )
    );
  }
}
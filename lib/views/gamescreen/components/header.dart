import 'package:flutter/material.dart';
import 'package:fodinha_flutter/core/app_icons.dart';

class Header extends StatelessWidget {
  final int round;
  final int cards;

  const Header({super.key, required this.round, required this.cards});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Round $round",
          style: TextStyle(
            fontSize: 32,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcons().cards,
            Text(
              "Cards $cards",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
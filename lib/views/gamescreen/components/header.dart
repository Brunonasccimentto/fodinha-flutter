import 'package:flutter/material.dart';

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
          style: const TextStyle(
            fontSize: 32,
            color: Colors.white70,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.play_for_work_rounded),
            Text(
              "Cards $cards",
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
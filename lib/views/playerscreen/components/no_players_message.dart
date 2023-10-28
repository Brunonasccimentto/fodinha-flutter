import 'package:flutter/material.dart';

class NoPlayersMessage extends StatelessWidget {
  const NoPlayersMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          "Nenhum jogador",
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
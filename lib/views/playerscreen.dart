

import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(side: BorderSide(width: 100)),
          padding: const EdgeInsets.all(15)
        ),
        child: const Icon(Icons.add, size: 24,)),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:fodinha_flutter/views/playerscreen/controller/playerscreen_controller.dart';

class DropPlayerTarget extends StatelessWidget {
  final Function(int playerID) onAccept;
  final PlayerScreenController controller;

  const DropPlayerTarget({super.key, required this.onAccept, required this.controller});

  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      onMove: (details) {
        HapticFeedback.vibrate();
      },
      builder: (BuildContext context, List<int?> accepted, List<dynamic> rejected) {
        return AnimatedSize(
          curve: Curves.easeInOut,
          duration: const Duration(seconds: 1),
          child: ShakeWidget(
            autoPlay: true,
            shakeConstant: ShakeRotateConstant1(),
            child: Icon(
              Icons.delete_forever_rounded,
              color: const Color.fromARGB(255, 255, 27, 11),
              size: controller.size,
            ),
          ),
        );
      },
      onAccept: (int playerID) {
        controller.updateSize();
        onAccept(playerID);
      },
    );
  }
}
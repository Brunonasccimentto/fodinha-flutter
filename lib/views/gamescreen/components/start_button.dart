import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fodinha_flutter/components/atoms/elevated_text_buttom.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class StartRoundButton extends StatelessWidget {
  final int sum;
  final int cards;

  const StartRoundButton({super.key, required this.sum, required this.cards});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: 40,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedTextButtonDefault(
          onPressed: () {

            if (cards == sum) {
              HapticFeedback.vibrate();
              MotionToast.error(
                title: const Text("Erro"),
                height: 100,
                description: const Text("O número de rounds que cada jogador irá fazer somado, não pode ser igual ao número de cartas"),
                position: MotionToastPosition.top,
              ).show(context);
              return;
            }

            Navigator.pushReplacementNamed(context, "/GameScreenEndRound");
          },
          text: "Iniciar rodada",
        ),
      ),
    );
  }
}
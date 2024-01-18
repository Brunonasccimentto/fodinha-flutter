import 'package:flutter/material.dart';
import 'package:fodinha_flutter/widgets/atoms/elevated_text_buttom.dart';

class StartRoundButton extends StatelessWidget {
  final VoidCallback onPressed;

  const StartRoundButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: 40,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedTextButtonDefault(
          onPressed: onPressed,
          text: "Iniciar rodada",
        ),
      ),
    );
  }
}
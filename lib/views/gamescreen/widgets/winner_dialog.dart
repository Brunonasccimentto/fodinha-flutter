import 'package:flutter/material.dart';
import 'package:fodinha_flutter/core/app_assets.dart';
import 'package:fodinha_flutter/widgets/atoms/elevated_text_buttom.dart';

class WinnerDialog extends StatelessWidget {
  final String winner;
  final VoidCallback onContinuePressed;
  final VoidCallback onNewGamePressed;

  const WinnerDialog({
    super.key,
    required this.winner,
    required this.onContinuePressed,
    required this.onNewGamePressed,
  });

  @override
  Widget build(BuildContext context) {
    return winner.isNotEmpty
        ? Stack(
            children: [
              Positioned(
                bottom: 0, 
                child: AppAssets().fireworks
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      width: MediaQuery.of(context).size.width - 60,
                      height: MediaQuery.of(context).size.height / 1.6,
                      color: Theme.of(context)
                          .colorScheme
                          .primary,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            winner,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          AppAssets().trophy,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedTextButtonDefault(
                                onPressed: onContinuePressed,
                                size: const Size(120, 40),
                                text: 'Continuar'),
                              ElevatedTextButtonDefault(
                                onPressed: onNewGamePressed,
                                size: const Size(120, 40),
                                text: 'Novo jogo'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0, 
                child: AppAssets().fireworks
              ),
            ],
          )
        : Container();
  }
}
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WinnerWidget extends StatelessWidget {
  final String winner;
  final VoidCallback onContinuePressed;
  final VoidCallback onNewGamePressed;

  const WinnerWidget({super.key, 
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
                child: Lottie.asset(
                  'assets/fireworks.json',
                  height: 500,                
                  repeat: true,
                ),
              ),
              Positioned(
                
                child: Align(
                  alignment: Alignment.center,
                  child: Container(                
                    padding: const EdgeInsets.all(16.0),
                    width: MediaQuery.of(context).size.width - 60,
                    height: MediaQuery.of(context).size.height / 2,
                    color: const Color.fromARGB(255, 125, 139, 218).withOpacity(0.7),
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
                        Lottie.asset(
                          'assets/trophy.json',
                          height: 250,                        
                          repeat: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: onContinuePressed,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo,
                              ),
                              child: const Text(
                                'Continuar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: onNewGamePressed,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo,
                              ),
                              child: const Text(
                                'Novo jogo',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Lottie.asset(
                  'assets/fireworks.json',
                  height: 500,                
                  repeat: true,
                ),
              ),
             
            ],
          )
        : Container();
  }
}
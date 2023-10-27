// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fodinha_flutter/components/atoms/app_screen.dart';
import 'package:fodinha_flutter/components/atoms/elevated_text_buttom.dart';
import 'package:fodinha_flutter/view_model/player_view_model/player_view_model.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  @override
  void initState() {
    Provider.of<PlayerViewModel>(context, listen: false).getPlayerList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PlayerViewModel>(context);

    return AppScreen(
      backgroundColor: Theme.of(context).colorScheme.primary,
      aligment: MainAxisAlignment.center,
      widgets: [
        Image.asset("assets/adaptive-icon.png"),

        Column(
          children: [
            ElevatedTextButtonDefault(              
              onPressed: () async {                   
                await store.newGame();
                Navigator.pushNamed(context, "/PlayerScreen");
              }, 
              text: 'Novo jogo',
              size: const Size(150, 30),
            ),

            ElevatedTextButtonDefault(               
              onPressed: () {                    
                if(store.playerList.isNotEmpty && store.playerList.length >= 2){
                  Navigator.pushNamed(context, "/GameScreen");
                  return;
                }
                
                MotionToast.error(
                  title:  const Text("Erro"),                    
                  description:  const Text("Não existe nenhum jogo salvo"),
                  position: MotionToastPosition.top,
                ).show(context);
              }, 
              text: "Carregar jogo",
              size: const Size(150, 30),
            ),
          ],
        )
      ]
    );
  }
}
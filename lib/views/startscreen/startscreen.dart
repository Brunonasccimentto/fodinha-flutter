// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
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

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/adaptive-icon.png"),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)) 
                    ),
                    onPressed: () async {                   
                      await store.newGame();
                      Navigator.pushNamed(context, "/PlayerScreen");
                    }, 
                    child: const Text("Novo jogo")),

                  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)) 
                  ),
                  onPressed: () async {                    
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
                  child: const Text("Carregar jogo")),

                ],
              )
            ]),
      ),
    );
  }
}
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fodinha_flutter/components/atoms/elevated_text_buttom.dart';
import 'package:fodinha_flutter/views/playerscreen/components/drop_player_target.dart';
import 'package:fodinha_flutter/views/playerscreen/components/grid.dart';
import 'package:fodinha_flutter/views/playerscreen/components/no_players_message.dart';
import 'package:fodinha_flutter/model/scoreboard/scoreboard.dart';
import 'package:fodinha_flutter/view_model/gamescreen_view_model/gamescreen_view_model.dart';
import 'package:fodinha_flutter/views/playerscreen/components/player_creation_dialog.dart';
import 'package:fodinha_flutter/views/playerscreen/components/row_buttons.dart';
import 'package:fodinha_flutter/views/playerscreen/controller/playerscreen_controller.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:provider/provider.dart';
import 'package:fodinha_flutter/view_model/player_view_model/player_view_model.dart';

class MainList extends StatelessWidget {
  final PlayerScreenController controller;
 
  const MainList({required this.controller, Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    final store = Provider.of<PlayerViewModel>(context);
    
    return Expanded(
      child: Column(
        children: [
          Observer(
            builder: (BuildContext context) { 
              return store.playerList.isEmpty
              ? const NoPlayersMessage()
              : DraggableGridPlayerItem(
                pageController: controller, 
                store: store
              );
            }, 
          ),
      
          Observer(
            builder: (BuildContext context){
              return controller.size == 0 ?
                RowButtons(
                  buttons: [
                    ElevatedTextButtonDefault(                
                      text: "Adicionar jogador", 
                      icon: const Icon(Icons.add),                  
                      onPressed: () {
                        const PlayerCreationDialog();             
                      }
                    ),

                    ElevatedTextButtonDefault(                  
                      text: "Começar jogo",
                      icon: const Icon(Icons.sports_esports_outlined),
                      onPressed: () async {
                        if(store.playerList.length < 2){
                          MotionToast.error(
                            title:  const Text("Erro"),               
                            description:  const Text("Deve ter no mínimo dois jogadores para começar"),
                            position: MotionToastPosition.top,
                          ).show(context);
                          return;
                        }
                        await store.resetStats();
                        await Provider.of<GamescreenViewModel>(context, listen: false).newGame(ScoreboardModel(), store.playerList);
                        
                        Navigator.pushReplacementNamed(context, "/GameScreen");
                      }
                    )
                  ]
                ) : 
                DropPlayerTarget(
                  controller: controller,
                  onAccept: (int playerID) { 
                    store.deletePlayer(playerID);
                  }, 
                ); 
            }
          ),
        ],
      ),
    );
  }
}

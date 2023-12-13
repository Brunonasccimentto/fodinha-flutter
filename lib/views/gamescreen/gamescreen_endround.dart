import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fodinha_flutter/view_model/gamescreen_view_model/gamescreen_view_model.dart';
import 'package:fodinha_flutter/view_model/player_view_model/player_view_model.dart';
import 'package:fodinha_flutter/views/gamescreen/components/eliminated_stamp.dart';
import 'package:fodinha_flutter/views/gamescreen/components/winner_dialog.dart';
import 'package:fodinha_flutter/widgets/atoms/app_screen.dart';
import 'package:fodinha_flutter/widgets/atoms/avatar_player_circle.dart';
import 'package:fodinha_flutter/widgets/atoms/elevated_text_buttom.dart';
import 'package:fodinha_flutter/widgets/molecules/player.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:provider/provider.dart';

class GameScreenEndRound extends StatelessWidget {
  const GameScreenEndRound({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PlayerViewModel>(context);
    final gameScreenStore = Provider.of<GamescreenViewModel>(context);

    void openDialog() {
      showDialog(
        context: context, 
        builder: (BuildContext context) {
          return WinnerDialog(
            winner: gameScreenStore.winner, 
            onContinuePressed: () { 
              store.resetStats();
              gameScreenStore.resetStats();
              Navigator.pushReplacementNamed(context, '/GameScreen');
             }, 
            onNewGamePressed: () { 
              store.newGame();
              Navigator.pushReplacementNamed(context, '/PlayerScreen');
             },
            );
        });
    }
    
    return AppScreen(
      widgets: [
        Observer(
          builder: (BuildContext context) { 
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 30),
              child: Text("Quem perdeu a rodada ${gameScreenStore.scoreboard.round} ?",
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white70,
              )),
            );
          },                   
        ),
            
        Expanded(
          child: Stack(
            children: [
              Observer(
                builder: (BuildContext context) { 
                  return GridView.builder(                
                  itemCount: store.playerList.length,                
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5), 
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        GestureDetector(
                          child: Player(
                            data: store.playerList[index],
                            showCounter: false,            
                            child: AvatarPlayerCircle(data: store.playerList[index],
                            filter: gameScreenStore.playersLostRound.contains(store.playerList[index].playerID) ? 
                            ColorFilter.mode(Colors.indigo.shade300, BlendMode.modulate) : const ColorFilter.mode(Colors.transparent, BlendMode.color)) 
                          ),
                          onTap: () {
                            gameScreenStore.playersLostRound.contains(store.playerList[index].playerID) ?
                            gameScreenStore.playersLostRound.remove(store.playerList[index].playerID) :                              
                            gameScreenStore.playersLostRound = store.playerList[index].playerID;
                    
                            store.getPlayerList();                                  
                          },
                        ),

                        Positioned.fill(                                                        
                          child: Align(
                            alignment: Alignment.center,
                            child: store.playerList[index].points == 5 ? 
                            SvgPicture.asset("assets/selo-eliminado.svg",
                            // ignore: deprecated_member_use
                            color: Theme.of(context).colorScheme.error,
                            width: 100,
                            height: 150) 
                            : Container(),
                          ),
                        ),
                      ],
                    );
                  });
                },
              ),
              Positioned.fill(                      
                bottom: 40,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedTextButtonDefault(
                    onPressed: () async { 
                      if(gameScreenStore.playersLostRound.isEmpty){
                        MotionToast.error(
                          title:  const Text("Erro"),
                          height: 80,
                          description:  const Text("Selecione o jogador que perdeu a rodada"),
                          position: MotionToastPosition.top,
                        ).show(context);
                        return;
                      }

                      await store.updatePlayersLostRound(gameScreenStore.playersLostRound);
                      gameScreenStore.gameWinner(store.playerList);  

                      if(gameScreenStore.winner.isNotEmpty) {
                        openDialog();
                      } else {
                          await store.roundDealer();                                                                                                         
                          await gameScreenStore.updateRound(gameScreenStore.scoreboard.scoreboardID);                                              
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacementNamed(context, "/GameScreen");
                      }
                    },
                    text: "Finalizar rodada"),
                ),
              )
            ],
          ),
        ),
      ]
    );
  }
}
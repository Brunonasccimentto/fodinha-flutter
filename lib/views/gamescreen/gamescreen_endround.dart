import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fodinha_flutter/components/atoms/avatar_player_circle.dart';
import 'package:fodinha_flutter/components/atoms/elevated_text_buttom.dart';
import 'package:fodinha_flutter/components/molecules/player.dart';
import 'package:fodinha_flutter/view_model/player_view_model.dart';
import 'package:fodinha_flutter/views/gamescreen/controller/gamescreen_controller.dart';
import 'package:provider/provider.dart';

class GameScreenEndRound extends StatefulWidget {
  const GameScreenEndRound({super.key});

  @override
  State<GameScreenEndRound> createState() => _GameScreenEndRoundState();
}

class _GameScreenEndRoundState extends State<GameScreenEndRound> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PlayerViewModel>(context);
    final controller = Provider.of<GameScreenController>(context);
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 139, 218),
      body: SafeArea(
        child: Center(
          child: Column(
            
            children: [              
                           
                Observer(
                  builder: (BuildContext context) { 
                    return Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 30),
                      child: Text("Quem perdeu a rodada ${controller.round} ?",
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
                                  filter: controller.playersLostRound.contains(store.playerList[index].playerID) ? 
                                  ColorFilter.mode(Colors.indigo.shade300, BlendMode.modulate) : const ColorFilter.mode(Colors.transparent, BlendMode.color)) 
                                ),
                                onTap: () {
                                  controller.playersLostRound.contains(store.playerList[index].playerID) ?
                                  controller.playersLostRound.remove(store.playerList[index].playerID) :                              
                                  controller.playersLostRound = store.playerList[index].playerID;
                          
                                  store.getPlayerList();
                                    
                                },
                              ),

                              Container(                                                       
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(bottom: store.playerList.length - 1 == index ? 70 : 0),
                                  child: store.playerList[index].points == 5 ? 
                                  SvgPicture.asset("assets/selo-eliminado.svg",
                                  // ignore: deprecated_member_use
                                  color: Colors.red,
                                  width: 100,
                                  height: 100) 
                                  : Container(),
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
                          onPressed: () {    
                            controller.howManyCards();
                            store.roundDealer();                                                                           
                            store.updatePlayersLostRound(controller.playersLostRound);
                            
                            Navigator.pushReplacementNamed(context, "/GameScreen");
                          }, 
                          text: "Finalizar rodada"),
                      ),
                    )
                  ],
                ),
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}
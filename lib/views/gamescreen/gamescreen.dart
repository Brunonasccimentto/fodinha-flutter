import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fodinha_flutter/components/atoms/elevated_text_buttom.dart';
import 'package:fodinha_flutter/components/molecules/player.dart';
import 'package:fodinha_flutter/view_model/player_view_model.dart';
import 'package:fodinha_flutter/views/gamescreen/controller/gamescreen_controller.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PlayerViewModel>(context);
    final _controller = GameScreenController();
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 139, 218),
      body: SafeArea(
        child: Center(
          child: Column(
            
            children: [              
             
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Round ${_controller.round}",
                    style: const TextStyle(
                      fontSize: 32,
                      color: Colors.white70,
                    ),),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.play_for_work_rounded),
                        Text("Cards ${_controller.cards.value}",
                        style: const TextStyle(                       
                          color: Colors.white70,
                        ),), 
                      ],
                    )
                  ],
                ),
           
      
              Expanded(
                child: Stack(
                  children: [
                    Observer(
                      builder: (BuildContext context) { 
                        return GridView.builder(                
                        itemCount: store.playerList.length,
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: store.playerList.length - 1 == index ? 60 : 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,                            
                              children: [
                                
                                Player(
                                  data: store.playerList[index],
                                  showCounter: true,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${store.playerList[index].count}",
                                    style: const TextStyle(
                                      fontSize: 22,
                                      color: Colors.white70
                                    )),
                                    OverflowBar(
                                      children: [
                                        
                                        IconButton(                                 
                                        onPressed: () {
                                          if(store.playerList[index].count > 0 ) {
                                            store.countHowManyRoundsPlayerDo(store.playerList[index].count - 1, store.playerList[index].playerID);                      
                                            return;
                                          }                     
                                        },  
                                        disabledColor: Colors.grey,  
                                        splashColor: Colors.indigo.withOpacity(0.3),                                       
                                        icon: const Icon(Icons.remove_circle,
                                        size: 32,
                                        color: Colors.indigo )), 
                                                          
                                        IconButton(
                                        onPressed: () {
                                          if(store.playerList[index].count < _controller.cards.value ) {
                                            store.countHowManyRoundsPlayerDo(store.playerList[index].count + 1, store.playerList[index].playerID);                     
                                            return;
                                          }                                
                                        }, 
                                        disabledColor: Colors.grey,  
                                        splashColor: Colors.indigo.withOpacity(0.3),
                                        icon: const Icon(Icons.add_circle,                                 
                                        size: 32,
                                        color: Colors.indigo))
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
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
                            var sum = _controller.sumAllPlayerCountValues(store.playerList);

                              if (_controller.cards.value == sum) {
                                 //error
                                 return;
                              }
                              
                              //navitation todo
                          }, 
                          text: "Iniciar rodada"),
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
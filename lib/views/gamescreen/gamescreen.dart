import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fodinha_flutter/components/atoms/avatar_player_circle.dart';
import 'package:fodinha_flutter/components/atoms/elevated_text_buttom.dart';
import 'package:fodinha_flutter/components/molecules/player.dart';
import 'package:fodinha_flutter/view_model/player_view_model.dart';
import 'package:fodinha_flutter/views/gamescreen/controller/gamescreen_controller.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<PlayerViewModel>(context).getPlayerList();
  }

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
                  return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Round ${controller.round}",
                    style: const TextStyle(
                      fontSize: 32,
                      color: Colors.white70,
                    )),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.play_for_work_rounded),
                        Text("Cards ${controller.cards.value}",
                        style: const TextStyle(                       
                          color: Colors.white70,
                        )) 
                      ],
                    ),

                    
                  ],
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
                          childAspectRatio: 1), 
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: store.playerList.length >= 8 ? store.playerList.length - 2 <= index ? 70 : 0 : 0),
                            child: Stack(
                              children: [
                                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,                                                             
                                  children: [
                                    
                                    Player(
                                      data: store.playerList[index],
                                      showCounter: true, 
                                      child: AvatarPlayerCircle(data: store.playerList[index])),
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
                                              if(store.playerList[index].count < controller.cards.value ) {
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
                                                                                    
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: store.playerList[index].points == 5 ? 
                                    SvgPicture.asset("assets/selo-eliminado.svg",
                                    // ignore: deprecated_member_use
                                      color: Colors.red,
                                      width: 100,
                                      height: 100
                                    ) 
                                    : Container(),
                                  ),
                                ),                                                         
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
                            var sum = controller.sumAllPlayerCountValues(store.playerList);
                
                              if (controller.cards.value == sum) {
                                HapticFeedback.vibrate(); 
                                MotionToast.error(
                                  title:  const Text("Erro"),
                                  height: 100,
                                  description:  const Text("O número de rounds que cada jogador irá fazer somado, não pode ser igual ao número de cartas"),
                                  position: MotionToastPosition.top,
                                ).show(context);
                                 return;
                              }
                              
                              Navigator.pushReplacementNamed(context, "/GameScreenEndRound");
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
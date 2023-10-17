import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:fodinha_flutter/components/atoms/avatar_player_circle.dart';
import 'package:fodinha_flutter/components/atoms/custom_field.dart';
import 'package:fodinha_flutter/components/atoms/elevated_text_buttom.dart';
import 'package:fodinha_flutter/components/molecules/player.dart';
import 'package:fodinha_flutter/components/organism/dialogs.dart';
import 'package:fodinha_flutter/model/scoreboard/scoreboard.dart';
import 'package:fodinha_flutter/shared/constants/avatar.dart';
import 'package:fodinha_flutter/model/player/player.dart';
import 'package:fodinha_flutter/view_model/gamescreen_view_model.dart';
import 'package:fodinha_flutter/views/playerscreen/controller/playerscreen_controller.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:provider/provider.dart';
import '../../view_model/player_view_model.dart';

class MainList extends StatelessWidget {
  final PlayerScreenController controller;
 
  const MainList({required this.controller, Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const avatarData = avatar;
    final store = Provider.of<PlayerViewModel>(context);
    final _formKey = GlobalKey<FormState>();
    final inputController = TextEditingController();
    
    return Column(
      children: [
        Observer(
            builder: (BuildContext context) { 
              return store.playerList.isEmpty
              ? Container(
                height: MediaQuery.of(context).size.height / 1.2,
                alignment: Alignment.center,
                child: const Text("Nenhum jogador",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold))
                )
              : GridView.builder(
                  shrinkWrap: true,
                  itemCount: store.playerList.length,
                  itemBuilder: (context, index) {
                    return Draggable(
                      onDragStarted: () {                                             
                        controller.updateSize();   
                      },
                      onDraggableCanceled: (velocity, offset){
                        controller.updateSize();                       
                      },
                                      
                      data: store.playerList[index].playerID,
                      childWhenDragging: AvatarPlayerCircle(
                        data: store.playerList[index],
                        opacity: 0.5, 
                        margin: const EdgeInsets.only(top: 34),
                      ),               
                      feedback: AvatarPlayerCircle(
                        data: store.playerList[index],
                        margin: const EdgeInsets.only(top: 34) 
                      ),
                      child: Player(
                        data: store.playerList[index],
                        onLongPress: ()=> store.setDealer(store.playerList[index].playerID),
                        onTap: () {
                          if(store.playerList[index].picture != ""){
                            controller.setPicture(store.playerList[index].picture);
                          }   
                          
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialogs(
                                data: store.playerList[index], 
                                avatarData: avatarData, 
                                controller: controller,
                                onSave: ()=> store.updatePicture(store.playerList[index].playerID, controller.svg));
                              },
                          );
                        }, showCounter: false,
                        child: AvatarPlayerCircle(data: store.playerList[index]))
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                );
            },
         
        ),
    
        Observer(
          builder: (context){
            return 
            Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 60),
              child: controller.size == 0 ?
                Row(                               
                mainAxisAlignment: MainAxisAlignment.spaceAround,               
                children: [
                  ElevatedTextButtonDefault(                
                    text: "Adicionar jogador", 
                    icon: const Icon(Icons.add),                  
                    onPressed: (){
                      // inputController.text = "";
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              content: Form(
                                key: _formKey,
                                child: CustomField(
                                  labelText: "Nome do jogador",
                                  autoFocus: true,
                                  controller: inputController,                                
                                  validator: (String? value) {                                   
                                    if (value == null || value.isEmpty) {
                                      return "Campo não preenchido";
                                    }
                                    return null;
                                  }),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      inputController.text = "";
                                    },
                                    child: const Text("Cancelar")),
                                TextButton(
                                    onPressed: () {
                                      if(_formKey.currentState!.validate()){
                                        Provider.of<PlayerViewModel>(context, listen: false).createPlayer(PlayerModel(name: inputController.text));
                                        inputController.text = "";
                                        Navigator.pop(context, 3);
                                      }                                     
                                    },
                                    child: const Text("Criar"))
                              ],
                            )
                        );
                        
                    }),
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
                      store.resetStats();
                      await Provider.of<GamescreenViewModel>(context, listen: false).newGame(ScoreboardModel(), store.playerList);
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacementNamed(context, "/GameScreen");
                    }
                  )
                ],
                ) :  DragTarget<int>(
                      onMove: (details){
                        HapticFeedback.vibrate();                           
                      },
                      builder: (BuildContext context,
                      List<int?> accepted,
                      List<dynamic> rejected) {
                        return Observer(
                          builder: (context) {
                            return AnimatedSize(
                              curve: Curves.easeInOut,
                              duration: const Duration(seconds: 1),
                              child: ShakeWidget(                       
                                autoPlay: true,
                                shakeConstant: ShakeRotateConstant1(),
                                child: Icon(Icons.delete_forever_rounded,
                                color:const Color.fromARGB(255, 255, 27, 11),
                                size: controller.size,),
                              ),
                            );
                          }
                        );
                      },
                      onAccept: (int playerID)  {                       
                        controller.updateSize();
                        store.deletePlayer(playerID);
                      },
                    ),
            )); 
            }
          ),
      ],
    );
  }
}

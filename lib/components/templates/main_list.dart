import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:fodinha_flutter/components/atoms/avatar_player_circle.dart';
import 'package:fodinha_flutter/components/atoms/custom_field.dart';
import 'package:fodinha_flutter/components/atoms/elevated_text_buttom.dart';
import 'package:fodinha_flutter/components/molecules/player.dart';
import 'package:fodinha_flutter/components/organism/dialogs.dart';
import 'package:fodinha_flutter/shared/constants/avatar.dart';
import 'package:fodinha_flutter/model/player.dart';
import 'package:fodinha_flutter/views/playerscreen/controller/playerscreen_controller.dart';
import 'package:provider/provider.dart';
import '../../view_model/player_view_model.dart';

class MainList extends StatelessWidget {
  final PlayerScreenController controller;
 
  const MainList({required this.controller, Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const avatarData = avatar;
    var store = Provider.of<PlayerViewModel>(context);
    final _formKey = GlobalKey<FormState>();
    final inputController = TextEditingController();
    
    return Center(
    child: Column(
      children: [
        Observer(
            builder: (BuildContext context) { 
              return store.playerList.isEmpty
              ? const Text("Nenhum jogador")
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
                        },)
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
                    onPressed: (){
                          
                    })
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
    ),
    );
  }
}
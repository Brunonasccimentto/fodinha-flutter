import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:fodinha_flutter/components/atoms/avatar_player_circle.dart';
import 'package:fodinha_flutter/components/molecules/player.dart';
import 'package:fodinha_flutter/components/organism/dialogs.dart';
import 'package:fodinha_flutter/constants/avatar.dart';
import 'package:fodinha_flutter/views/controller/playerscreen_controller.dart';
import 'package:provider/provider.dart';
import '../../view_model/player_view_model.dart';

class MainList extends StatefulWidget {
 
 const MainList({ Key? key}) : super(key: key);

  @override
  State<MainList> createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  @override
  Widget build(BuildContext context) {
    const avatarData = avatar;
    var store = Provider.of<PlayerViewModel>(context);
    var pageController = Provider.of<PlayerScreenController>(context);
    
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
                        pageController.updateSize();   
                      },
                      onDraggableCanceled: (velocity, offset){
                        pageController.updateSize();                       
                      },
                                      
                      data: store.playerList[index].playerID,
                      childWhenDragging: AvatarPlayerCircle(
                        data: store.playerList,
                        opacity: 0.5, 
                      ),               
                      feedback: AvatarPlayerCircle(
                        data: store.playerList, 
                      ),
                      child: Player(
                        data: store.playerList[index],
                        onLongPress: ()=> store.setDealer(store.playerList[index].playerID),
                        onTap: () {
                          if(store.playerList[index].picture != ""){
                            pageController.setPicture(store.playerList[index].picture);
                          }   
                          
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialogs(
                                data: store.playerList[index], 
                                avatarData: avatarData, 
                                controller: pageController,
                                onSave: ()=> store.updatePicture(store.playerList[index].playerID, pageController.svg));
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

        Expanded(
          child: Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 60),
          child: DragTarget<int>(
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
                        size: pageController.size,),
                      ),
                    );
                  }
                );
              },
              onAccept: (int playerID)  {                       
                pageController.updateSize();
                store.deletePlayer(playerID);
              },
            ),
          ),
        )
      ],
    ),
    );
  }
}

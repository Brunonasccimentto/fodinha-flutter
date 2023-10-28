import 'package:flutter/material.dart';
import 'package:fodinha_flutter/components/atoms/avatar_player_circle.dart';
import 'package:fodinha_flutter/components/molecules/player.dart';
import 'package:fodinha_flutter/shared/constants/avatar.dart';
import 'package:fodinha_flutter/view_model/player_view_model/player_view_model.dart';
import 'package:fodinha_flutter/views/playerscreen/components/player_avatar_dialog.dart';
import 'package:fodinha_flutter/views/playerscreen/controller/playerscreen_controller.dart';

class DraggableGridPlayerItem extends StatelessWidget {
  final PlayerScreenController pageController;
  final PlayerViewModel store;

  const DraggableGridPlayerItem({super.key, required this.pageController, required this.store});

  @override
  Widget build(BuildContext context) {
    const avatarData = avatar;

    return Expanded(
      child: GridView.builder(
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
                  pageController.setPicture(store.playerList[index].picture);
                }   
                
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PlayerAvatarDialog(
                      data: store.playerList[index], 
                      avatarData: avatarData, 
                      controller: pageController,
                      onSave: ()=> store.updatePicture(store.playerList[index].playerID, pageController.svg));
                    },
                );
              }, 
              showCounter: false,
              child: AvatarPlayerCircle(data: store.playerList[index]))
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3),
      ),
    );
  }
}
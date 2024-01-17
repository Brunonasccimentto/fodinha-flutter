import 'package:flutter/material.dart';
import 'package:fodinha_flutter/model/player/player.dart';
import 'package:fodinha_flutter/widgets/atoms/app_screen.dart';
import 'package:fodinha_flutter/widgets/atoms/avatar_player_circle.dart';

class PlayerHistory extends StatelessWidget {

  const PlayerHistory({ super.key });

   @override
   Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as PlayerModel;

      return AppScreen(
        widgets: [
          Hero(
            tag: args.playerID, 
            child: AvatarPlayerCircle(
              data: args,
              height: 180,
              width: 180,)),

          //Adicionar conteudo da página histórico
        ]);
  }
}
import 'package:flutter/material.dart';
import 'package:fodinha_flutter/components/atoms/app_screen.dart';
import 'package:fodinha_flutter/view_model/player_view_model/player_view_model.dart';
import 'package:fodinha_flutter/model/player/player.dart';
import 'package:fodinha_flutter/views/playerscreen/controller/playerscreen_controller.dart';
import 'package:fodinha_flutter/views/playerscreen/components/main_list.dart';
import 'package:provider/provider.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final pageController = PlayerScreenController();

  @override
  Widget build(BuildContext context) {
    Future <List<PlayerModel>> players = Provider.of<PlayerViewModel>(context).getPlayerList();

    return AppScreen(
      widgets: [
         FutureBuilder(
          future: players,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {        
            if(snapshot.hasData){
             return MainList(
              controller: pageController,
             );
            }
            if(snapshot.hasError){
              return Container();
            }
            
            return const Center(
              child: CircularProgressIndicator());
          },
        ),
      ]);
  }
}

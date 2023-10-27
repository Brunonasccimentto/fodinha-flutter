import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fodinha_flutter/components/atoms/app_screen.dart';
import 'package:fodinha_flutter/view_model/gamescreen_view_model/gamescreen_view_model.dart';
import 'package:fodinha_flutter/view_model/player_view_model/player_view_model.dart';
import 'package:fodinha_flutter/views/gamescreen/components/header.dart';
import 'package:fodinha_flutter/views/gamescreen/components/player_card.dart';
import 'package:fodinha_flutter/views/gamescreen/components/start_button.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  @override
  void didChangeDependencies() {
    Provider.of<GamescreenViewModel>(context).updateScoreBoard(1);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PlayerViewModel>(context);
    final gameScreenStore = Provider.of<GamescreenViewModel>(context);

    return AppScreen(
      widgets: [
        Observer(
          builder: (BuildContext context) {
            return Header(
              round: gameScreenStore.scoreboard.round, 
              cards: gameScreenStore.scoreboard.cards
            );
          },
        ),
                             
        Expanded(
          child: Observer(
            builder: (BuildContext context) {
              return Stack(
                children: [
                  GridView.builder(                
                  itemCount: store.playerList.length,           
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1), 
                  itemBuilder: (context, index) {
                    return PlayerCard(
                      store: store, 
                      index: index,
                    );
                  }),
    
                  StartRoundButton(
                    sum: gameScreenStore.sumAllPlayerCountValues(store.playerList), 
                    cards: gameScreenStore.scoreboard.cards
                  )                  
                ],
              );
            },
          )
        ),   
      ]
    ); 
  }
}
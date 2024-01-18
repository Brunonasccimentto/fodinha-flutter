import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fodinha_flutter/widgets/atoms/app_screen.dart';
import 'package:fodinha_flutter/view_model/gamescreen_view_model/gamescreen_view_model.dart';
import 'package:fodinha_flutter/view_model/player_view_model/player_view_model.dart';
import 'package:fodinha_flutter/views/gamescreen/widgets/header.dart';
import 'package:fodinha_flutter/views/gamescreen/widgets/player_card.dart';
import 'package:fodinha_flutter/views/gamescreen/widgets/start_button.dart';
import 'package:fodinha_flutter/widgets/atoms/elevated_text_buttom.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  void initState() {
    super.initState();
    checkFirstTime();
  }

  bool isFirstTime = true;

  Future<void> checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context, 
        builder: (BuildContext context) {
          return Dialog(
            
            child: Container(
              padding: const EdgeInsets.all(12),
              height: MediaQuery.of(context).size.height / 5,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Text('Pressione a imagem de um jogador para ver o histórico de cartas jogadas!',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary
                  )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ElevatedTextButtonDefault(
                      onPressed: () => Navigator.pop(context),
                      size: const Size(120, 40),
                      text: 'Continuar'),
                  )
                ]),
            )
          );
        });
    
      prefs.setBool('isFirstTime', false);
    }
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
                    onPressed: () async { 
                      if (gameScreenStore.sumAllPlayerCountValues(store.playerList) == gameScreenStore.scoreboard.cards) {
                        HapticFeedback.vibrate();
                        MotionToast.error(
                          title: const Text("Erro"),
                          height: 100,
                          description: const Text("O número de rounds que cada jogador irá fazer somado, não pode ser igual ao número de cartas"),
                          position: MotionToastPosition.top,
                        ).show(context);
                        return;
                      }

                      await store.saveRoundPlayerHistoryCount(store.playerList);
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacementNamed(context, "/GameScreenEndRound");
                    },
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
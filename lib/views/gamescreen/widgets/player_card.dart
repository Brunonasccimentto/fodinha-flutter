import 'package:flutter/material.dart';
import 'package:fodinha_flutter/views/gamescreen/widgets/eliminated_stamp.dart';
import 'package:fodinha_flutter/widgets/atoms/avatar_player_circle.dart';
import 'package:fodinha_flutter/widgets/atoms/custom_icon_button.dart';
import 'package:fodinha_flutter/widgets/molecules/player.dart';
import 'package:fodinha_flutter/view_model/gamescreen_view_model/gamescreen_view_model.dart';
import 'package:fodinha_flutter/view_model/player_view_model/player_view_model.dart';
import 'package:provider/provider.dart';

class PlayerCard extends StatelessWidget {
  final PlayerViewModel store;
  final int index;

  const PlayerCard({super.key, required this.store, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: store.playerList.length >= 8 ? store.playerList.length - 2 <= index ? 70 : 0 : 0,
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Player(
                data: store.playerList[index],
                showCounter: true,
                child: AvatarPlayerCircle(data: store.playerList[index]),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${store.playerList[index].count}",
                    style: TextStyle(
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  OverflowBar(
                    children: [
                      CustomIconButton(
                        icon: Icons.remove_circle,
                        onPressed: () {
                          if (store.playerList[index].count > 0) {
                            store.countHowManyRoundsPlayerDo(store.playerList[index].count - 1, store.playerList[index].playerID);
                            return;
                          }
                        },
                      ),
                      CustomIconButton(
                        icon: Icons.add_circle,
                        onPressed: () {                         
                          if (store.playerList[index].count < Provider.of<GamescreenViewModel>(context, listen: false).scoreboard.cards) {
                            store.countHowManyRoundsPlayerDo(store.playerList[index].count + 1, store.playerList[index].playerID);
                            return;
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          EliminatedStamp(
            points: store.playerList[index].points,
          ),
        ],
      ),
    );
  }
}
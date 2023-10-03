import 'package:flutter/material.dart';
import 'package:fodinha_flutter/components/atoms/avatar_player_circle.dart';
import 'package:fodinha_flutter/model/player.dart';

class Player extends StatelessWidget {
  final PlayerModel data;
  final VoidCallback? onLongPress;
  final VoidCallback? onTap;

  const Player({required this.data, this.onLongPress, this.onTap, Key? key} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          data.dealer ? 
            Image.asset(
              "assets/crown.png",
              width: 80,
              height: 34,
              scale: 0.2,
            )
          : const SizedBox(height: 34),
          GestureDetector(
            onLongPress: onLongPress,
            onTap: onTap,
            child: AvatarPlayerCircle(data: data)
            ),

          Text(data.name,
            style: const TextStyle(
              color: Colors.white
            ),)
        ],
      ),
    );
  }
}

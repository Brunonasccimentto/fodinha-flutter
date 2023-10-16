import 'package:flutter/material.dart';
import 'package:fodinha_flutter/model/player/player.dart';

// ignore: must_be_immutable
class Player extends StatelessWidget {
  final PlayerModel data;
  final VoidCallback? onLongPress;
  final VoidCallback? onTap;
  bool showCounter = false;
  final Color? onSelectedColor;
  final Widget child;

  Player({required this.data, this.onLongPress, this.onTap, required this.showCounter, this.onSelectedColor, required this.child, Key? key} ) : super(key: key);

  convertPointsToRespectiveIcon<Widget> (int? points){
    switch (points) {   
      case 1:
        return const Icon(Icons.looks_one_outlined);   
      case 2:
        return const Icon(Icons.looks_two_outlined);  
      case 3:
        return const Icon(Icons.looks_3_outlined);  
      case 4:
        return const Icon(Icons.looks_4_outlined);  
      case 5:
        return const Icon(Icons.looks_5_outlined);  
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
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
                child: child,
                ),
            
              Text(data.name,
                style: const TextStyle(
                  color: Colors.white70
                ),),
                        
            ],
          ),
        ),
        showCounter ? Positioned(
          top: 30,
          right: 0,
          child: convertPointsToRespectiveIcon(data.points)) : Container()

      ],
    );
  }
}

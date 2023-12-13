import 'package:flutter/material.dart';
import 'package:fodinha_flutter/model/player/player.dart';

class CircleColor extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final double? labelSize; 
  final PlayerModel data;

  const CircleColor({this.width, this.height, required this.data, this.radius, this.labelSize, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 50),
        child: Container(
        width: width ?? 80,
        height: height ?? 80,
        color: Color(data.color),
        alignment: Alignment.center,
          child: Text(
            data.name.substring(0, 2).toUpperCase(),
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Theme.of(context).colorScheme.secondary, 
              fontSize: labelSize ?? 22
            ),
          ),
        ),
      );
  }
}
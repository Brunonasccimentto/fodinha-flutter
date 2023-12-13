import 'package:flutter/material.dart';
import 'package:fodinha_flutter/core/app_assets.dart';
import 'package:fodinha_flutter/model/player/player.dart';

// ignore: must_be_immutable
class Player extends StatelessWidget {
  final PlayerModel data;
  final VoidCallback? onLongPress;
  final VoidCallback? onTap;
  bool showCounter = false;
  final Color? onSelectedColor;
  final Widget child;

  Player(
      {required this.data,
      this.onLongPress,
      this.onTap,
      required this.showCounter,
      this.onSelectedColor,
      required this.child,
      Key? key})
      : super(key: key);

  convertPointsToRespectiveIcon<Widget>(int? points, BuildContext context) {
    switch (points) {
      case 1:
        return Icon(
          Icons.looks_one_outlined,
          color: Theme.of(context).colorScheme.error,
        );
      case 2:
        return Icon(
          Icons.looks_two_outlined,
          color: Theme.of(context).colorScheme.error,
        );
      case 3:
        return Icon(
          Icons.looks_3_outlined,
          color: Theme.of(context).colorScheme.error,
        );
      case 4:
        return Icon(
          Icons.looks_4_outlined,
          color: Theme.of(context).colorScheme.error,
        );
      case 5:
        return Icon(
          Icons.looks_5_outlined,
          color: Theme.of(context).colorScheme.error,
        );
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
              data.dealer ? AppAssets().crown : const SizedBox(height: 30),
              GestureDetector(
                onLongPress: onLongPress,
                onTap: onTap,
                child: child,
              ),
              Text(
                data.name,
                style: TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
        ),
        showCounter
            ? Positioned(
                top: 30,
                right: 0,
                child: convertPointsToRespectiveIcon(data.points, context))
            : Container()
      ],
    );
  }
}

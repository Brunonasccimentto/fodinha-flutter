import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EliminatedStamp extends StatelessWidget {
  final int points;

  const EliminatedStamp({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: points == 5
            ? SvgPicture.asset(
                "assets/selo-eliminado.svg",
                // ignore: deprecated_member_use
                color: Theme.of(context).colorScheme.error,
                width: 100,
                height: 100,
              )
            : Container(),
      ),
    );
  }
}
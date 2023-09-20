import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final _key = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(child: Center(
          child: const Text("data"),
        )),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(
          overlayStyle: ExpandableFabOverlayStyle(blur: 2),
          type: ExpandableFabType.up,
          distance: 80,
          openButtonBuilder: RotateFloatingActionButtonBuilder(
            child: const Icon(Icons.add, size: 24,),
            fabSize: ExpandableFabSize.regular,
            shape: const CircleBorder()),
          closeButtonBuilder: RotateFloatingActionButtonBuilder(
            child: const Icon(Icons.close, size: 24,),
            fabSize: ExpandableFabSize.regular,
            shape: const CircleBorder()),
          children: [
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.person_add, size: 24,),
            ),
             FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.videogame_asset_rounded, size: 24,),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fodinha_flutter/components/custom_field.dart';
import 'package:fodinha_flutter/components/main_list.dart';
import 'package:fodinha_flutter/controller/player_controller.dart';
import 'package:fodinha_flutter/model/player.dart';
import 'package:mobx/mobx.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final _key = GlobalKey<ExpandableFabState>();
  final controller = PlayerController();
  final inputController = TextEditingController();
  final reactionDisposer = <ReactionDisposer>[];
  List<PlayerModel> players = [];

  @override
  void initState() {
    controller.getPlayerList();
    super.initState();

    final reactionsDisposer = autorun((_) {
      setState(() {
        players = controller.playerList;
      });
      
    });

    reactionDisposer.add(reactionsDisposer);
  }

  @override
  void dispose() {
    super.dispose();
    for (var element in reactionDisposer) {
      element();
    }

    inputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: FutureBuilder(
          future: controller.getPlayerList(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {         
            return  MainList(data: players);
          },
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(
          overlayStyle: ExpandableFabOverlayStyle(blur: 2),
          type: ExpandableFabType.up,
          distance: 80,
          openButtonBuilder: RotateFloatingActionButtonBuilder(
              child: const Icon(Icons.add, size: 24),
              fabSize: ExpandableFabSize.regular,
              shape: const CircleBorder()),
          closeButtonBuilder: RotateFloatingActionButtonBuilder(
              child: const Icon(
                Icons.close,
                size: 24,
              ),
              fabSize: ExpandableFabSize.regular,
              shape: const CircleBorder()),
          children: [
            FloatingActionButton(
              tooltip: "Novo jogador",
              onPressed: () {
                inputController.text = "";
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          content: CustomField(
                              labelText: "Nome",
                              controller: inputController,
                              onChanged: () {},
                              validator: (String? value) {
                                if (value == null || value == "") {
                                  return "Campo não preenchido";
                                }
                                return null;
                              }),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  inputController.text = "";
                                },
                                child: const Text("Cancelar")),
                            TextButton(
                                onPressed: () {
                                  controller.createPlayer(
                                      PlayerModel(name: inputController.text));
                                  inputController.text = "";
                                  Navigator.pop(context, 3);
                                },
                                child: const Text("Criar"))
                          ],
                        ));
              },
              child: const Icon(
                Icons.person_add,
                size: 24,
                semanticLabel: "Novo jogador",
              ),
            ),
            FloatingActionButton(
              onPressed: () {},
              tooltip: "Começar",
              child: const Icon(
                Icons.videogame_asset_rounded,
                size: 24,
                semanticLabel: "Começar",
                textDirection: TextDirection.ltr,
              ),
            )
          ],
        ));
  }
}

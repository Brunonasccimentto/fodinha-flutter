import 'package:flutter/material.dart';
import 'package:fodinha_flutter/components/templates/main_list.dart';
import 'package:fodinha_flutter/view_model/player_view_model.dart';
import 'package:fodinha_flutter/model/player.dart';
import 'package:fodinha_flutter/views/playerscreen/controller/playerscreen_controller.dart';
import 'package:provider/provider.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final inputController = TextEditingController();
  var pageController = PlayerScreenController();
 
  @override
  Widget build(BuildContext context) {
    Future <List<PlayerModel>> players = Provider.of<PlayerViewModel>(context).getPlayerList();
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 125, 139, 218),
        body: FutureBuilder(
          future: players,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {        
            if(snapshot.hasData){
             return MainList(
              controller: pageController,
             );
            }
            if(snapshot.hasError){
              return Container();
            }
            
            return const CircularProgressIndicator();
          },
        ),
      
        // floatingActionButtonLocation: ExpandableFab.location,
        // floatingActionButton: ExpandableFab(
        //   overlayStyle: ExpandableFabOverlayStyle(blur: 2),
        //   type: ExpandableFabType.up,
        //   distance: 80,
        //   openButtonBuilder: RotateFloatingActionButtonBuilder(
        //       child: const Icon(Icons.add, size: 24),
        //       heroTag: "add",
        //       fabSize: ExpandableFabSize.regular,
        //       shape: const CircleBorder()),
        //   closeButtonBuilder: RotateFloatingActionButtonBuilder(
        //       child: const Icon(Icons.close, size: 24),
        //       heroTag: "close",
        //       fabSize: ExpandableFabSize.regular,
        //       shape: const CircleBorder()),
        //   children: [
        //     FloatingActionButton(             
        //       tooltip: "Novo jogador",
        //       onPressed: () {
        //         inputController.text = "";
        //         showDialog(
        //           context: context,
        //           builder: (BuildContext context) => AlertDialog(
        //                 content: CustomField(
        //                     labelText: "Nome",
        //                     controller: inputController,
        //                     onChanged: () {},
        //                     validator: (String? value) {
        //                       if (value == null || value == "") {
        //                         return "Campo não preenchido";
        //                       }
        //                       return null;
        //                     }),
        //                 actions: [
        //                   TextButton(
        //                       onPressed: () {
        //                         Navigator.pop(context);
        //                         inputController.text = "";
        //                       },
        //                       child: const Text("Cancelar")),
        //                   TextButton(
        //                       onPressed: () {
        //                         Provider.of<PlayerViewModel>(context, listen: false).createPlayer(PlayerModel(name: inputController.text));
        //                         inputController.text = "";
        //                         Navigator.pop(context, 3);
        //                       },
        //                       child: const Text("Criar"))
        //                 ],
        //               )
        //           );
        //       },
        //       child: const Icon(
        //         Icons.person_add,
        //         size: 24,
        //         semanticLabel: "Novo jogador",
        //       ),
        //     ),
        //     FloatingActionButton(
        //       onPressed: () {               
        //         players.then((value) => value.length >= 2 ? Navigator.pop(context) : "alerta");
        //       },
        //       tooltip: "Começar",
        //       child: const Icon(Icons.videogame_asset_rounded,
        //         size: 24,
        //         semanticLabel: "Começar",
        //         textDirection: TextDirection.ltr,
        //       ),
        //     )
        //   ],  
    );
  }
}
import 'package:flutter/material.dart';
import 'package:fodinha_flutter/model/player/player.dart';
import 'package:fodinha_flutter/view_model/player_view_model/player_view_model.dart';
import 'package:fodinha_flutter/widgets/atoms/app_screen.dart';
import 'package:fodinha_flutter/widgets/atoms/avatar_player_circle.dart';
import 'package:provider/provider.dart';

class PlayerHistory extends StatefulWidget {

  const PlayerHistory({ super.key });

  @override
  State<PlayerHistory> createState() => _PlayerHistoryState();
}

class _PlayerHistoryState extends State<PlayerHistory> {

   @override
   Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as PlayerModel;
    Future<PlayerModel> player = Provider.of<PlayerViewModel>(context).getPlayerHistory(args.playerID);

      return AppScreen(
        appbar: AppBar(
          titleTextStyle: const TextStyle(
            fontFamily: 'Rubik',
            fontSize: 18
          ),
          iconTheme: IconThemeData(color: Theme.of(context).colorScheme.secondary),
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text('Histórico', 
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),)),
        widgets: [
          const SizedBox(
            height: 20,
          ),
          Hero(
            tag: args.playerID, 
            child: AvatarPlayerCircle(
              data: args,
              height: 180,
              width: 180)
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: player,
            builder: (BuildContext context, AsyncSnapshot<PlayerModel> snapshot) {    
              if(snapshot.hasData){
       
                return Table(
                   border: const TableBorder(
                    horizontalInside: BorderSide(
                      color: Colors.indigo,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    verticalInside: BorderSide(
                      color: Colors.indigo,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                  ),
                  children: snapshot.data!.historyCount.isEmpty ? 
                  [_newRow('Rodada, Jogador faz')] :
                  _formatListToTable(snapshot.data!.historyCount),
                );         
              }
              if(snapshot.hasError){
                return Container();
              } 
              return const Center(
                child: CircularProgressIndicator());
            },
          ),
        ]);
  }
}

TableRow _newRow(String listaNomes) {
  return TableRow(
    children: listaNomes.split(',').map((name) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white
          ),
        ),
      );
    }).toList(),
  );
}

List<TableRow> _formatListToTable(List<int> historyCount) {
  int indexColumn = 0;

  final List<TableRow> table = historyCount.map((element) {
    indexColumn++;
    return _newRow('$indexColumn, $element');
  }).toList();

  final titleTable = _newRow('Rodada, Jogador faz');
  final List<TableRow> listTable = [titleTable, ...table];
  return listTable;
}
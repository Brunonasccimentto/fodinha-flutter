import 'package:flutter/material.dart';
import 'package:fodinha_flutter/view_model/gamescreen_view_model/gamescreen_view_model.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  // possivel update - AllgamesSaved
 
  @override
  Widget build(BuildContext context) {
    final GamescreenViewModel store = Provider.of<GamescreenViewModel>(context);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 125, 139, 218),
        body: Container() 
        // FutureBuilder(
        //   future: store.listAllSavedGames(),
        //   builder: (BuildContext context, AsyncSnapshot<List<ScoreboardModel>> snapshot) {        
        //     if(snapshot.hasData){
        //      return ListView.builder(
        //       itemCount: snapshot.data!.length,
        //       itemBuilder: (BuildContext context, int index) {            
        //         return ListTile(
        //           title: Text("Jogo ${snapshot.data![index].scoreboardID}"),
        //           onTap: () {
        //             store.updateScoreBoard(snapshot.data![index].scoreboardID);
        //             Navigator.pushReplacementNamed(context, "/GameScreen");
        //           } ,
        //           // leading: AvatarPlayerCircle(
        //           //   data: data[index],
        //           //   width: 20,
        //           //   height: 20,
        //           //   margin: EdgeInsets.zero,)
                  
        //         );
        //       });
        //     }
        //     if(snapshot.hasError){
        //       return Container();
        //     }
            
        //     return const Center(
        //       child: CircularProgressIndicator());
        //   },
        // ),
    );
  }
}

import 'package:fodinha_flutter/model/player/player.dart';
import 'package:fodinha_flutter/model/scoreboard/scoreboard.dart';
import 'package:fodinha_flutter/services/database.dart';
import 'package:fodinha_flutter/views/gamescreen/entities/cards.dart';
import 'package:isar/isar.dart';

class ScoreBoardRepository {
  final databaseInstance = DatabaseService().openDB();

   Future<ScoreboardModel> newGame(ScoreboardModel scoreboard, List<PlayerModel> players) async {
    final isarDB = await databaseInstance;

    await isarDB.writeTxn(() async { 
      await isarDB.scoreboardModels.clear();           // medida provisória para não ocupar memoria / possivel update - AllgamesSaved //
      await isarDB.scoreboardModels.put(scoreboard);  
    });

    return scoreboard;
  }

  Future<ScoreboardModel> updateScoreBoard(int id) async {
    final isarDB = await databaseInstance;
    final update = await isarDB.scoreboardModels.get(id);

    await isarDB.writeTxn(() async {
      await isarDB.scoreboardModels.put(update!);
    });

    return update!;
  }
 
  Future<void> updateRound(ScoreboardModel scoreboard, int id, Cards cards) async {
    final isarDB = await databaseInstance;
    final update = await isarDB.scoreboardModels.get(id);
    
    update!.round++;
    update.cards = cards.value; 
    
    await isarDB.writeTxn(() async {
      await isarDB.scoreboardModels.put(update);  
    });

    await updateScoreBoard(scoreboard.scoreboardID);
  }

  Future<ScoreboardModel> resetStats() async {
    final isarDB = await databaseInstance;
    final update = await isarDB.scoreboardModels.where().findFirst();
    
    update!.cards = 1;
    update.round = 1;

    await isarDB.writeTxn(() async {      
      await isarDB.scoreboardModels.put(update);  
    });

    return await updateScoreBoard(update.scoreboardID);
  }
}
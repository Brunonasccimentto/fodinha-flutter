// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

import 'package:fodinha_flutter/model/player/player.dart';
import 'package:fodinha_flutter/services/database.dart';

class PlayerRepository {
  final DatabaseService database;

  PlayerRepository({required this.database});

  Future<void> clearPlayers() async{
    final isarDB = await database.openDB();

    await isarDB.writeTxn(() async {
      await isarDB.playerModels.clear(); 
    }); 
  }

  Future<void> resetPlayerStats(List<PlayerModel> playerList) async{
    final isarDB = await database.openDB();
    
    for (PlayerModel item in playerList) {
      item.count = 0;
      item.points = 0;

      await isarDB.writeTxn(() async {
        await isarDB.playerModels.put(item);  
      });
    } 
  }

  Future<void> createPlayer(PlayerModel player) async{
    final isarDB = await database.openDB();

    await isarDB.writeTxn(() async {
      await isarDB.playerModels.put(player);  
    });
  }

  Future<void> deletePlayer(int playerID) async{
    final isarDB = await database.openDB();
   
    await isarDB.writeTxn(() async {   
      await isarDB.playerModels.delete(playerID);
    });
  }

  Future<List<PlayerModel>> fetchPlayerList(List<PlayerModel> playerList) async{
    final isarDB = await database.openDB();
    final players = await isarDB.playerModels.filter().dealerEqualTo(true).findAll();
    final newDealer = await isarDB.playerModels.filter().dealerEqualTo(false).findFirst();
    
    // print(players.isEmpty);
    // print(newDealer != null);
    // print(playerList.isNotEmpty);

    await isarDB.writeTxn(() async {
      if(players.isEmpty && playerList.isNotEmpty && newDealer != null){
        newDealer.dealer = true;
        await isarDB.playerModels.put(newDealer);

      }
      playerList = await isarDB.playerModels.where().findAll();
    });

    return playerList;
  }

  Future<void> updatePicture(int playerID, String asset) async{
    final isarDB = await database.openDB();

    PlayerModel? updatedPlayer = await isarDB.playerModels.get(playerID);
    updatedPlayer!.picture = asset;

    await isarDB.writeTxn(() async {
      await isarDB.playerModels.put(updatedPlayer);
    });
  }

  //GameScreen actions
  Future<void> setDealer(int playerID) async{
    final isarDB = await database.openDB();

    PlayerModel? oldDealer = await isarDB.playerModels.filter().dealerEqualTo(true).findFirst();
    PlayerModel? newDealer = await isarDB.playerModels.get(playerID);

    oldDealer!.dealer = false;
    newDealer!.dealer = true;

    await isarDB.writeTxn(() async {
      await isarDB.playerModels.putAll(<PlayerModel>[oldDealer, newDealer]);
    });
  }

  Future<void> countHowManyRoundsPlayerDo(int payload, int playerID) async{
    final isarDB = await database.openDB();

    PlayerModel? updatePlayerCount = await isarDB.playerModels.get(playerID);
    updatePlayerCount!.count = payload;

    await isarDB.writeTxn(() async {
      await isarDB.playerModels.put(updatePlayerCount);
    });
  }

  Future<void> roundDealer(List<PlayerModel> playerList) async {
    final isarDB = await database.openDB();
  
    await isarDB.writeTxn(() async {
      await isarDB.playerModels.putAll(playerList);
    });
  }

  //GameScreenEndActions
  Future<void> updatePlayersLostRound(List<int> players) async{
    final isarDB = await database.openDB();

    List<PlayerModel?> playersToUpdate = await isarDB.playerModels.getAll(players);

    for (PlayerModel? item in playersToUpdate) {
      item!.points = item.points + 1;

      await isarDB.writeTxn(() async {
        await isarDB.playerModels.put(item);
    });
    }
  }

  //PlayerHistory
  Future<PlayerModel> getPlayerHistory(int playerID) async{
    final isarDB = await database.openDB();

    final playerHistory = await isarDB.playerModels.where().playerIDEqualTo(playerID).findFirst();

    return playerHistory!;
  }

  Future<void> savePlayerHistoryCount(List<PlayerModel> playerList) async {
  final isarDB = await database.openDB();

  await Future.wait(playerList.map((PlayerModel item) async {
    item.historyCount = [...item.historyCount, item.count];

    await isarDB.writeTxn(() async {
      await isarDB.playerModels.put(item);
    });
  }));
}
}

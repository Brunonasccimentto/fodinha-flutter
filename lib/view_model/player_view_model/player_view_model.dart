
import 'package:fodinha_flutter/model/player/player.dart';
import 'package:fodinha_flutter/services/app_repository.dart';
import 'dart:math';
import 'package:fodinha_flutter/shared/constants/colors.dart';
import 'package:isar/isar.dart';
import 'package:mobx/mobx.dart';

part "player_view_model.g.dart";

// ignore: library_private_types_in_public_api
class PlayerViewModel = _PlayerViewModelBase with _$PlayerViewModel;
  
abstract class _PlayerViewModelBase with Store {
  
  @observable
  List<PlayerModel> _playerList = [];

  @computed
  List<PlayerModel> get playerList => _playerList;

  _randomColor(){
    int randomColorIndex = Random().nextInt(colors.length);
    int randomColor = colors[randomColorIndex];

    return randomColor;
  }

  //startScreen actions
  @action
  Future<void> newGame() async{
    final isarDB = await AppRepository().openDB();

    await isarDB.writeTxn(() async {
      await isarDB.playerModels.clear(); 
    });
    
    await getPlayerList();
  }

  @action
  Future<void> resetStats() async{
    final isarDB = await AppRepository().openDB();
    
    for (var item in _playerList) {

      item.count = 0;
      item.points = 0;

      await isarDB.writeTxn(() async {
        await isarDB.playerModels.put(item);  
      });
    } 

    await getPlayerList();
  }

  //PlayerScreen actions
  @action
  Future<void> createPlayer(PlayerModel player) async{

    if(playerList.length < 10){
      final isarDB = await AppRepository().openDB();
      playerList.isEmpty ? player.dealer = true : player.dealer = false;
      player.color = _randomColor();

      await isarDB.writeTxn(() async {
        await isarDB.playerModels.put(player);  
      });
      
      await getPlayerList();
    } 
  }

  @action
  Future<void> deletePlayer(int playerID) async{
    final isarDB = await AppRepository().openDB();
   

    await isarDB.writeTxn(() async {   
      await isarDB.playerModels.delete(playerID);
    });

    await getPlayerList();
  }

  @action
  Future<List<PlayerModel>> getPlayerList() async{
    final isarDB = await AppRepository().openDB();
    final players = await isarDB.playerModels.filter().dealerEqualTo(true).findAll();
    final newDealer = await isarDB.playerModels.filter().dealerEqualTo(false).findFirst();

    await isarDB.writeTxn(() async {
      if(players.isEmpty && _playerList.isNotEmpty && newDealer != null){
        newDealer.dealer = true;
        await isarDB.playerModels.put(newDealer);

      }
       _playerList = await isarDB.playerModels.where().findAll();
    });

    return _playerList;
  }

  @action
  Future<void> updatePicture(int playerID, String asset) async{
    final isarDB = await AppRepository().openDB();

    var updatedPlayer = await isarDB.playerModels.get(playerID);
    updatedPlayer!.picture = asset;

    await isarDB.writeTxn(() async {
      await isarDB.playerModels.put(updatedPlayer);
    });

    await getPlayerList();
  }

  //GameScreen actions
  @action
  Future<void> setDealer(int playerID) async{
    final isarDB = await AppRepository().openDB();

    var oldDealer = await isarDB.playerModels.filter().dealerEqualTo(true).findFirst();
    var newDealer = await isarDB.playerModels.get(playerID);

    oldDealer!.dealer = false;
    newDealer!.dealer = true;

    await isarDB.writeTxn(() async {
      await isarDB.playerModels.putAll(<PlayerModel>[oldDealer, newDealer]);
    });

    await getPlayerList();
  }

  @action
  Future<void> countHowManyRoundsPlayerDo(int payload, int playerID) async{
    final isarDB = await AppRepository().openDB();

    var updatePlayerCount = await isarDB.playerModels.get(playerID);
    updatePlayerCount!.count = payload;

    await isarDB.writeTxn(() async {
      await isarDB.playerModels.put(updatePlayerCount);
    });

    await getPlayerList();
  }

  @action
  Future<void> roundDealer() async {
    final isarDB = await AppRepository().openDB();
    var dealer = _playerList.where((item) => item.points < 5).toList();
    var dealerFiltedArray = dealer.map((item) => item.dealer).toList();
    var lastDealerIndex = dealerFiltedArray.indexWhere((element) => element == true );

    for (var item in _playerList) {
      item.dealer = false;
    }

    if (lastDealerIndex + 1 < dealer.length) {
        var newDealerIndex = _playerList.indexWhere((element) => dealer[lastDealerIndex + 1].playerID == element.playerID);       
        _playerList[newDealerIndex].dealer = true;

    } else {
        dealer[0].dealer = true;
        var newDealerIndex = _playerList.indexWhere((element) => element.playerID == dealer[0].playerID);
        _playerList[newDealerIndex].dealer = true;

    }

     await isarDB.writeTxn(() async {
      await isarDB.playerModels.putAll(_playerList);
    });

    await getPlayerList();
  }

  //GameScreenEndActions
  @action
  Future<void> updatePlayersLostRound(List<int> players) async{
    final isarDB = await AppRepository().openDB();

    var playersToUpdate = await isarDB.playerModels.getAll(players);

    for (var item in playersToUpdate) {
      item!.points = item.points + 1;

      await isarDB.writeTxn(() async {
        await isarDB.playerModels.put(item);
    });
    }
    
    await getPlayerList();
  }

}

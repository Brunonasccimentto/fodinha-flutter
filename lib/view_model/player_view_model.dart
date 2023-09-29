
import 'package:fodinha_flutter/model/player.dart';
import 'dart:math';
import 'package:fodinha_flutter/constants/colors.dart';
import 'package:fodinha_flutter/model/player_repository.dart';
import 'package:isar/isar.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:mobx/mobx.dart';

part "player_view_model.g.dart";

class PlayerViewModel = _PlayerViewModelBase with _$PlayerViewModel;
  
abstract class _PlayerViewModelBase with Store {
  
  @observable
  List<PlayerModel> _playerList = [];

  @computed
  List<PlayerModel> get playerList => _playerList;

  @observable
  String _svg = "";

  @computed
  String get svg => _svg;

  @action
  void setSvg(String svg) {
    _svg = svg;
    
  }

  @action
  createRandomNewAvatar(){
    _svg = RandomAvatarString(
    DateTime.now().toIso8601String(),
    trBackground: false,);
  }

  _randomColor(){
    int randomColorIndex = Random().nextInt(colors.length);
    int randomColor = colors[randomColorIndex];

    return randomColor;
  }

  @action
  Future<void> createPlayer(PlayerModel player) async{

    if(playerList.length < 10){
      final isarDB = await PlayerRepository().openDB();
      playerList.isEmpty ? player.dealer = true : player.dealer = false;
      player.color = _randomColor();

      await isarDB.writeTxn(() async {
        await isarDB.playerModels.put(player);  
      });
      
      await getPlayerList();
    } 
  }

  @action
  Future<List<PlayerModel>> getPlayerList() async{
    final isarDB = await PlayerRepository().openDB();

    await isarDB.writeTxn(() async {
      _playerList = await isarDB.playerModels.where().findAll();
      
    });

    return playerList;
  }

  @action
  Future<void> updatePhoto(int playerID, String asset) async{
    final isarDB = await PlayerRepository().openDB();

    var updatedPlayer = await isarDB.playerModels.get(playerID);
    updatedPlayer!.photo = asset;

    await isarDB.writeTxn(() async {
      await isarDB.playerModels.put(updatedPlayer);
    });

    _svg = "";
    await getPlayerList();
  }

  @action
  Future<void> setDealer(int playerID) async{
    final isarDB = await PlayerRepository().openDB();

    var oldDealer = await isarDB.playerModels.filter().dealerEqualTo(true).findFirst();
    var newDealer = await isarDB.playerModels.get(playerID);

    oldDealer!.dealer = false;
    newDealer!.dealer = true;

    await isarDB.writeTxn(() async {
      await isarDB.playerModels.putAll(<PlayerModel>[oldDealer, newDealer]);
    });

    await getPlayerList();
  }

}

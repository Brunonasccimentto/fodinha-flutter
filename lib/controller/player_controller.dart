
import 'package:fodinha_flutter/model/player.dart';
import 'package:fodinha_flutter/services/database.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fodinha_flutter/constants/colors.dart';
import 'package:isar/isar.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:mobx/mobx.dart';

part "player_controller.g.dart";

class PlayerController = _PlayerControllerBase with _$PlayerController;
  
abstract class _PlayerControllerBase with Store {
  
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
      final isarDB = await DatabaseService().openDB();
      playerList.isEmpty ? player.dealer = true : player.dealer = false;
      player.color = _randomColor();

      await isarDB.writeTxn(() async {
        await isarDB.playerModels.put(player);  
      });

      await getPlayerList();
    } 
  }

  @action
  Future<void> getPlayerList() async{
    final isarDB = await DatabaseService().openDB();

      await isarDB.writeTxn(() async {
        _playerList = await isarDB.playerModels.where().findAll();
        
      });
  }

  @action
  Future<void> updatePhoto(PlayerModel player,String asset) async{
    final isarDB = await DatabaseService().openDB();

      var updatedPlayer = await isarDB.playerModels.get(player.playerID);
      updatedPlayer!.photo = asset;

      await isarDB.writeTxn(() async {
        await isarDB.playerModels.put(updatedPlayer);
      });

      _svg = "";
      await getPlayerList();
  }

}

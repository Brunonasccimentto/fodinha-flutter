
import 'package:fodinha_flutter/model/player.dart';
import 'package:fodinha_flutter/services/database.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:isar/isar.dart';

class PlayerController extends ChangeNotifier {
  
  // String _name = "";

  // void setName(String value) => _name = value;
  // String get name => _name;
  // void serColor(String value) => _color = value;
  // void setCount(int value) => _count = value;
  // void setPoints(int value) => _points = value;
  // void setHistoryCount(List value) => _historyCount = value;
  // void setDealer(bool value) => _dealer = value;
  // void setPhoto(String? value) => _photo = value;

  List<PlayerModel> _playerList = [];
  List<PlayerModel> get playerList => _playerList;
  final List<String> colors = ["amber", "black", "blue", "brown", "cyan", "deepOrange", "deepPurple", "green", "indigo", "pink", "red", "teal"];

  _randomColor(){
    int randomColorIndex = Random().nextInt(colors.length);
    String randomColor = colors[randomColorIndex];

    return randomColor;
  }

  Future<void> createPlayer(PlayerModel player) async{

    if(playerList.length < 10){
      final isarDB = await DatabaseService().openDB();
      player.color = _randomColor();

      await isarDB.writeTxn(() async {
        await isarDB.playerModels.put(player);
      });

    } 
  }

  Future<void> getPlayerList() async{
    final isarDB = await DatabaseService().openDB();

      await isarDB.writeTxn(() async {
        _playerList = await isarDB.playerModels.where().findAll();
      });

      notifyListeners();
  }
}
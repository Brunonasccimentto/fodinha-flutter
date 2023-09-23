
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
  final List<int> colors = [0xFFFFC107, 0xFF000000, 0xFF2196F3, 0xFF795548, 0xFF00BCD4, 0xFFFF5722, 0xFF673AB7, 0xFF4CAF50, 0xFF3F51B5, 0xFFE91E63, 0xFFF44336, 0xFF009688];

  _randomColor(){
    int randomColorIndex = Random().nextInt(colors.length);
    int randomColor = colors[randomColorIndex];

    return randomColor;
  }

  Future<void> createPlayer(PlayerModel player) async{

    if(playerList.length < 10){
      final isarDB = await DatabaseService().openDB();
      playerList.isEmpty ? player.dealer = true : player.dealer = false;
      player.color = _randomColor();

      await isarDB.writeTxn(() async {
        await isarDB.playerModels.put(player);  
      });

      getPlayerList();
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
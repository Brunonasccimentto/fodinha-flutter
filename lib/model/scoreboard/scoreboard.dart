import 'package:fodinha_flutter/model/player/player.dart';
import 'package:isar/isar.dart';

part "scoreboard.g.dart";

@Collection()
class ScoreboardModel {
  Id scoreboardID = Isar.autoIncrement;
  int round = 0;
  int cards = 0;
  final players = IsarLinks<PlayerModel>();
  

  ScoreboardModel();

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
   
  //   return data;
  // }
}

import 'package:fodinha_flutter/model/player.dart';

class PlayerlistModel {
  List<PlayerModel>? players;

  PlayerlistModel({this.players});

  PlayerlistModel.fromJson(Map<String, dynamic> json) {
    players = json['players'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['players'] = this.players;
    return data;
  }
}
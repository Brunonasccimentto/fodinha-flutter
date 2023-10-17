import 'package:isar/isar.dart';
part "player.g.dart";

@Collection()
class PlayerModel {
  Id playerID = Isar.autoIncrement;
  String name;
  late int color;
  int count = 0;
  int points = 0;
  bool dealer = false;
  String picture = "";

  PlayerModel({required this.name});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['color'] = this.color;
    data['count'] = this.count;
    data['points'] = this.points;
    data['dealer'] = this.dealer;
    data['photo'] = this.picture;
    return data;
  }
}

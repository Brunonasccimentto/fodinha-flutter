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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['color'] = color;
    data['count'] = count;
    data['points'] = points;
    data['dealer'] = dealer;
    data['photo'] = picture;
    return data;
  }
}

import 'package:fodinha_flutter/model/player/player.dart';
import 'package:fodinha_flutter/model/scoreboard/scoreboard.dart';
import 'package:fodinha_flutter/services/database.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class AppRepository implements DatabaseService {
  
  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [PlayerModelSchema, ScoreboardModelSchema],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
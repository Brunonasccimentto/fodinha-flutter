

import 'package:fodinha_flutter/model/player.dart';
import 'package:fodinha_flutter/model/services/database.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class PlayerRepository implements DatabaseService {
  
  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [PlayerModelSchema],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
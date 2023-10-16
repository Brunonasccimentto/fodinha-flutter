import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fodinha_flutter/model/player/player.dart';
import 'package:fodinha_flutter/view_model/player_view_model.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('Player view model test', () {
    test('deve retornar uma lista de jogadores', () {
      final playerRepository = PlayerViewModel();
      final result = playerRepository.getPlayerList();

      expect(result, isA<Future<List<PlayerModel>>>());
    });

    

  });
}
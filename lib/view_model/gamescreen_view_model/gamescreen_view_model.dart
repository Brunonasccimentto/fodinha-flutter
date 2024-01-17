import 'package:fodinha_flutter/model/player/player.dart';
import 'package:fodinha_flutter/model/scoreboard/scoreboard.dart';
import 'package:fodinha_flutter/model/scoreboard/scoreboard_repository.dart';
import 'package:fodinha_flutter/shared/enums/count.dart';
import 'package:fodinha_flutter/views/gamescreen/entities/cards.dart';
import 'package:mobx/mobx.dart';
part 'gamescreen_view_model.g.dart';

class GamescreenViewModel = GamescreenViewModelBase with _$GamescreenViewModel;

abstract class GamescreenViewModelBase with Store {
  final ScoreBoardRepository repository;

  GamescreenViewModelBase({required this.repository});

  Cards cards = Cards();

  @observable
  ScoreboardModel _scoreboard = ScoreboardModel();

  @computed
  ScoreboardModel get scoreboard => _scoreboard;

  @observable
  String winner = '';

  @observable
  List<int> _playersLostRound = [];

  @computed
  List<int> get playersLostRound => _playersLostRound;

  set playersLostRound(value){
    _playersLostRound = [..._playersLostRound, value];
  }

  int sumAllPlayerCountValues(List<PlayerModel> players) {
    int sum = players.fold(0, (counter, obj) {
      counter += obj.count;
      return counter;
    });

    return sum;
  }

  void _resetPlayersLostRound(){
    _playersLostRound = [];
  }

  @action
  void gameWinner(List<PlayerModel> players) {
    List<int> playerPoints = players.map((item) => item.points).toList();
    int howManyHaveFive = 0;

    for (int i = 0; i < playerPoints.length; i++) {
      if (playerPoints[i] == 5) howManyHaveFive++;
    }

    if (players.length - 1 == howManyHaveFive) {
      int winnerIndex = playerPoints.indexWhere((element) => element != 5);
      String winnerName = players[winnerIndex].name;

      winner = 'Parabéns $winnerName você ganhou o jogo';
    }
  }  

  @action
  Future<void> newGame(ScoreboardModel scoreboard, List<PlayerModel> players) async {
    await repository.newGame(scoreboard, players);
  }

  @action
  Future<void> updateRound(int id) async {
    cards.increment == Count.increment ? cards.value++ : cards.value--;

    if (cards.value == cards.maxValue) {
        cards.increment = Count.decrement;
    }
    if (cards.value == cards.minValue) {
        cards.increment = Count.increment;
    } 

    _resetPlayersLostRound();
    await repository.updateRound(scoreboard, id, cards);
  }

  @action
  Future<void> resetStats() async {
    _playersLostRound = [];
    winner = '';
    cards = Cards();
    _scoreboard = await repository.resetStats();
  }

  @action
  Future<void> updateScoreBoard(int id) async {
    _scoreboard = await repository.updateScoreBoard(id);
  }
}
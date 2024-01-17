
import 'package:fodinha_flutter/model/player/player.dart';
import 'package:fodinha_flutter/model/player/player_repository.dart';
import 'dart:math';
import 'package:fodinha_flutter/shared/constants/colors.dart';
import 'package:mobx/mobx.dart';

part "player_view_model.g.dart";

// ignore: library_private_types_in_public_api
class PlayerViewModel = PlayerViewModelBase with _$PlayerViewModel;
  
abstract class PlayerViewModelBase with Store {
  final PlayerRepository repository;

  PlayerViewModelBase({required this.repository});
  
  @observable
  List<PlayerModel> _playerList = [];

  @computed
  List<PlayerModel> get playerList => _playerList;

  _randomColor(){
    int randomColorIndex = Random().nextInt(colors.length);
    int randomColor = colors[randomColorIndex];

    return randomColor;
  }

  //startScreen actions
  @action
  Future<void> newGame() async{
    await repository.clearPlayers();
    await getPlayerList();
  }

  @action
  Future<void> resetStats() async{
    await repository.resetPlayerStats(_playerList);
    await getPlayerList();
  }

  //PlayerScreen actions
  @action
  Future<void> createPlayer(PlayerModel player) async{

    if(playerList.length < 10){
      playerList.isEmpty ? player.dealer = true : player.dealer = false;
      player.color = _randomColor();

      await repository.createPlayer(player);
    
      await getPlayerList();
    } 
  }

  @action
  Future<void> deletePlayer(int playerID) async{
    await repository.deletePlayer(playerID);
    await getPlayerList();
  }

  @action
  Future<List<PlayerModel>> getPlayerList() async{
    _playerList = await repository.fetchPlayerList(_playerList);
    return _playerList;
  }

  @action
  Future<void> updatePicture(int playerID, String asset) async{
    await repository.updatePicture(playerID, asset);
    await getPlayerList();
  }

  //GameScreen actions
  @action
  Future<void> setDealer(int playerID) async{
    await repository.setDealer(playerID);
    await getPlayerList();
  }

  @action
  Future<void> countHowManyRoundsPlayerDo(int payload, int playerID) async{
    await repository.countHowManyRoundsPlayerDo(payload, playerID);
    await getPlayerList();
  }

  @action
  Future<void> roundDealer() async {
    List<PlayerModel> dealer = _playerList.where((item) => item.points < 5).toList();
    List<bool> dealerFiltedArray = dealer.map((item) => item.dealer).toList();
    int lastDealerIndex = dealerFiltedArray.indexWhere((element) => element == true);
    int nextDealer = lastDealerIndex + 1;

    for (PlayerModel item in _playerList) {
      item.dealer = false;
    }

    if (nextDealer < dealer.length) {
      int newDealerIndex = _playerList.indexWhere((element) => dealer[nextDealer].playerID == element.playerID);       
      _playerList[newDealerIndex].dealer = true;
    } 

    if (nextDealer > dealer.length) {
      dealer[0].dealer = true;
      int newDealerIndex = _playerList.indexWhere((element) => element.playerID == dealer[0].playerID);
      _playerList[newDealerIndex].dealer = true;
    }

    await repository.roundDealer(_playerList);
    await getPlayerList();
  }

  //GameScreenEndActions
  @action
  Future<void> updatePlayersLostRound(List<int> players) async{
    await repository.updatePlayersLostRound(players);
    await getPlayerList();
  }

}

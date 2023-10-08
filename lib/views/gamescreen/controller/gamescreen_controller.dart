


import 'package:fodinha_flutter/model/player.dart';
import 'package:fodinha_flutter/views/gamescreen/entities/cards.dart';
import 'package:mobx/mobx.dart';
import 'package:fodinha_flutter/shared/enums/count.dart';
part "gamescreen_controller.g.dart";

class GameScreenController = _GameScreenControllerBase with _$GameScreenController;


abstract class _GameScreenControllerBase with Store  {
  @observable
  int cardsCounter = 1;

  @observable
  int round = 1;

  @observable
  Cards cards = Cards();


  @action
  int sumAllPlayerCountValues(List<PlayerModel> players) {
    int sum = players.fold(0, (counter, obj) {
      counter += obj.count;
      return counter;
    });
    return sum;

  }

  @action
  void howManyCards() {
    round++; 
    cards.increment == Count.increment ? cards.value++ : cards.value--;

    if (cards.value == cards.maxValue) {
        cards.increment = Count.decrement;
    }
    if (cards.value == cards.minValue) {
        cards.increment = Count.increment;
    } 

  }

  @action
  List<PlayerModel> roundDealer(List<PlayerModel> players){
    var dealer = players.where((item) => item.points < 5).toList();
    var dealerFiltedArray = dealer.map((item) => item.dealer).toList();
    var lastDealerIndex = dealerFiltedArray.indexWhere((element) => element == true );

    for (var item in players) {
      item.dealer = false;
    }

    if (lastDealerIndex + 1 < dealer.length) {
        var newDealerIndex = players.indexWhere((element) => dealer[lastDealerIndex + 1].playerID == element.playerID);       
        players[newDealerIndex].dealer = true;

    } else {
        dealer[0].dealer = true;
        var newDealerIndex = players.indexWhere((element) => element.playerID == dealer[0].playerID);
        players[newDealerIndex].dealer = true;

    }

    return players;
  }

}
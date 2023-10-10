// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamescreen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameScreenController on _GameScreenControllerBase, Store {
  Computed<List<int>>? _$playersLostRoundComputed;

  @override
  List<int> get playersLostRound => (_$playersLostRoundComputed ??=
          Computed<List<int>>(() => super.playersLostRound,
              name: '_GameScreenControllerBase.playersLostRound'))
      .value;

  late final _$cardsCounterAtom =
      Atom(name: '_GameScreenControllerBase.cardsCounter', context: context);

  @override
  int get cardsCounter {
    _$cardsCounterAtom.reportRead();
    return super.cardsCounter;
  }

  @override
  set cardsCounter(int value) {
    _$cardsCounterAtom.reportWrite(value, super.cardsCounter, () {
      super.cardsCounter = value;
    });
  }

  late final _$roundAtom =
      Atom(name: '_GameScreenControllerBase.round', context: context);

  @override
  int get round {
    _$roundAtom.reportRead();
    return super.round;
  }

  @override
  set round(int value) {
    _$roundAtom.reportWrite(value, super.round, () {
      super.round = value;
    });
  }

  late final _$cardsAtom =
      Atom(name: '_GameScreenControllerBase.cards', context: context);

  @override
  Cards get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(Cards value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  late final _$_playersLostRoundAtom = Atom(
      name: '_GameScreenControllerBase._playersLostRound', context: context);

  @override
  List<int> get _playersLostRound {
    _$_playersLostRoundAtom.reportRead();
    return super._playersLostRound;
  }

  @override
  set _playersLostRound(List<int> value) {
    _$_playersLostRoundAtom.reportWrite(value, super._playersLostRound, () {
      super._playersLostRound = value;
    });
  }

  late final _$_GameScreenControllerBaseActionController =
      ActionController(name: '_GameScreenControllerBase', context: context);

  @override
  int sumAllPlayerCountValues(List<PlayerModel> players) {
    final _$actionInfo = _$_GameScreenControllerBaseActionController
        .startAction(name: '_GameScreenControllerBase.sumAllPlayerCountValues');
    try {
      return super.sumAllPlayerCountValues(players);
    } finally {
      _$_GameScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void howManyCards() {
    final _$actionInfo = _$_GameScreenControllerBaseActionController
        .startAction(name: '_GameScreenControllerBase.howManyCards');
    try {
      return super.howManyCards();
    } finally {
      _$_GameScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cardsCounter: ${cardsCounter},
round: ${round},
cards: ${cards},
playersLostRound: ${playersLostRound}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamescreen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GamescreenViewModel on GamescreenViewModelBase, Store {
  Computed<ScoreboardModel>? _$scoreboardComputed;

  @override
  ScoreboardModel get scoreboard => (_$scoreboardComputed ??=
          Computed<ScoreboardModel>(() => super.scoreboard,
              name: 'GamescreenViewModelBase.scoreboard'))
      .value;
  Computed<List<int>>? _$playersLostRoundComputed;

  @override
  List<int> get playersLostRound => (_$playersLostRoundComputed ??=
          Computed<List<int>>(() => super.playersLostRound,
              name: 'GamescreenViewModelBase.playersLostRound'))
      .value;

  late final _$_scoreboardAtom =
      Atom(name: 'GamescreenViewModelBase._scoreboard', context: context);

  @override
  ScoreboardModel get _scoreboard {
    _$_scoreboardAtom.reportRead();
    return super._scoreboard;
  }

  @override
  set _scoreboard(ScoreboardModel value) {
    _$_scoreboardAtom.reportWrite(value, super._scoreboard, () {
      super._scoreboard = value;
    });
  }

  late final _$winnerAtom =
      Atom(name: 'GamescreenViewModelBase.winner', context: context);

  @override
  String get winner {
    _$winnerAtom.reportRead();
    return super.winner;
  }

  @override
  set winner(String value) {
    _$winnerAtom.reportWrite(value, super.winner, () {
      super.winner = value;
    });
  }

  late final _$_playersLostRoundAtom =
      Atom(name: 'GamescreenViewModelBase._playersLostRound', context: context);

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

  late final _$saveLinkedPlayersAsyncAction = AsyncAction(
      'GamescreenViewModelBase.saveLinkedPlayers',
      context: context);

  @override
  Future<void> saveLinkedPlayers(
      ScoreboardModel scoreboard, List<PlayerModel> players) {
    return _$saveLinkedPlayersAsyncAction
        .run(() => super.saveLinkedPlayers(scoreboard, players));
  }

  late final _$updateScoreBoardAsyncAction =
      AsyncAction('GamescreenViewModelBase.updateScoreBoard', context: context);

  @override
  Future<void> updateScoreBoard(int id) {
    return _$updateScoreBoardAsyncAction.run(() => super.updateScoreBoard(id));
  }

  late final _$updateRoundAsyncAction =
      AsyncAction('GamescreenViewModelBase.updateRound', context: context);

  @override
  Future<void> updateRound(int id) {
    return _$updateRoundAsyncAction.run(() => super.updateRound(id));
  }

  late final _$newGameAsyncAction =
      AsyncAction('GamescreenViewModelBase.newGame', context: context);

  @override
  Future<void> newGame(ScoreboardModel scoreboard, List<PlayerModel> players) {
    return _$newGameAsyncAction.run(() => super.newGame(scoreboard, players));
  }

  late final _$resetStatsAsyncAction =
      AsyncAction('GamescreenViewModelBase.resetStats', context: context);

  @override
  Future<void> resetStats() {
    return _$resetStatsAsyncAction.run(() => super.resetStats());
  }

  late final _$GamescreenViewModelBaseActionController =
      ActionController(name: 'GamescreenViewModelBase', context: context);

  @override
  void gameWinner(List<PlayerModel> players) {
    final _$actionInfo = _$GamescreenViewModelBaseActionController.startAction(
        name: 'GamescreenViewModelBase.gameWinner');
    try {
      return super.gameWinner(players);
    } finally {
      _$GamescreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
winner: ${winner},
scoreboard: ${scoreboard},
playersLostRound: ${playersLostRound}
    ''';
  }
}

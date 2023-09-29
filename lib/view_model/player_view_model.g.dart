// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerViewModel on _PlayerViewModelBase, Store {
  Computed<List<PlayerModel>>? _$playerListComputed;

  @override
  List<PlayerModel> get playerList => (_$playerListComputed ??=
          Computed<List<PlayerModel>>(() => super.playerList,
              name: '_PlayerViewModelBase.playerList'))
      .value;
  Computed<String>? _$svgComputed;

  @override
  String get svg => (_$svgComputed ??=
          Computed<String>(() => super.svg, name: '_PlayerViewModelBase.svg'))
      .value;

  late final _$_playerListAtom =
      Atom(name: '_PlayerViewModelBase._playerList', context: context);

  @override
  List<PlayerModel> get _playerList {
    _$_playerListAtom.reportRead();
    return super._playerList;
  }

  @override
  set _playerList(List<PlayerModel> value) {
    _$_playerListAtom.reportWrite(value, super._playerList, () {
      super._playerList = value;
    });
  }

  late final _$_svgAtom =
      Atom(name: '_PlayerViewModelBase._svg', context: context);

  @override
  String get _svg {
    _$_svgAtom.reportRead();
    return super._svg;
  }

  @override
  set _svg(String value) {
    _$_svgAtom.reportWrite(value, super._svg, () {
      super._svg = value;
    });
  }

  late final _$createPlayerAsyncAction =
      AsyncAction('_PlayerViewModelBase.createPlayer', context: context);

  @override
  Future<void> createPlayer(PlayerModel player) {
    return _$createPlayerAsyncAction.run(() => super.createPlayer(player));
  }

  late final _$getPlayerListAsyncAction =
      AsyncAction('_PlayerViewModelBase.getPlayerList', context: context);

  @override
  Future<List<PlayerModel>> getPlayerList() {
    return _$getPlayerListAsyncAction.run(() => super.getPlayerList());
  }

  late final _$updatePhotoAsyncAction =
      AsyncAction('_PlayerViewModelBase.updatePhoto', context: context);

  @override
  Future<void> updatePhoto(int playerID, String asset) {
    return _$updatePhotoAsyncAction
        .run(() => super.updatePhoto(playerID, asset));
  }

  late final _$setDealerAsyncAction =
      AsyncAction('_PlayerViewModelBase.setDealer', context: context);

  @override
  Future<void> setDealer(int playerID) {
    return _$setDealerAsyncAction.run(() => super.setDealer(playerID));
  }

  late final _$_PlayerViewModelBaseActionController =
      ActionController(name: '_PlayerViewModelBase', context: context);

  @override
  void setSvg(String svg) {
    final _$actionInfo = _$_PlayerViewModelBaseActionController.startAction(
        name: '_PlayerViewModelBase.setSvg');
    try {
      return super.setSvg(svg);
    } finally {
      _$_PlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic createRandomNewAvatar() {
    final _$actionInfo = _$_PlayerViewModelBaseActionController.startAction(
        name: '_PlayerViewModelBase.createRandomNewAvatar');
    try {
      return super.createRandomNewAvatar();
    } finally {
      _$_PlayerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
playerList: ${playerList},
svg: ${svg}
    ''';
  }
}

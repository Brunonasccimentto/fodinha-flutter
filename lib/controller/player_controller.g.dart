// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerController on _PlayerControllerBase, Store {
  Computed<List<PlayerModel>>? _$playerListComputed;

  @override
  List<PlayerModel> get playerList => (_$playerListComputed ??=
          Computed<List<PlayerModel>>(() => super.playerList,
              name: '_PlayerControllerBase.playerList'))
      .value;
  Computed<String>? _$svgComputed;

  @override
  String get svg => (_$svgComputed ??=
          Computed<String>(() => super.svg, name: '_PlayerControllerBase.svg'))
      .value;

  late final _$_playerListAtom =
      Atom(name: '_PlayerControllerBase._playerList', context: context);

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
      Atom(name: '_PlayerControllerBase._svg', context: context);

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
      AsyncAction('_PlayerControllerBase.createPlayer', context: context);

  @override
  Future<void> createPlayer(PlayerModel player) {
    return _$createPlayerAsyncAction.run(() => super.createPlayer(player));
  }

  late final _$getPlayerListAsyncAction =
      AsyncAction('_PlayerControllerBase.getPlayerList', context: context);

  @override
  Future<void> getPlayerList() {
    return _$getPlayerListAsyncAction.run(() => super.getPlayerList());
  }

  late final _$updatePhotoAsyncAction =
      AsyncAction('_PlayerControllerBase.updatePhoto', context: context);

  @override
  Future<void> updatePhoto(PlayerModel player, String asset) {
    return _$updatePhotoAsyncAction.run(() => super.updatePhoto(player, asset));
  }

  late final _$_PlayerControllerBaseActionController =
      ActionController(name: '_PlayerControllerBase', context: context);

  @override
  void setSvg(String svg) {
    final _$actionInfo = _$_PlayerControllerBaseActionController.startAction(
        name: '_PlayerControllerBase.setSvg');
    try {
      return super.setSvg(svg);
    } finally {
      _$_PlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic createRandomNewAvatar() {
    final _$actionInfo = _$_PlayerControllerBaseActionController.startAction(
        name: '_PlayerControllerBase.createRandomNewAvatar');
    try {
      return super.createRandomNewAvatar();
    } finally {
      _$_PlayerControllerBaseActionController.endAction(_$actionInfo);
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

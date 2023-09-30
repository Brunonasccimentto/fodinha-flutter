// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playerscreen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerScreenController on _PlayerScreenControllerBase, Store {
  Computed<double>? _$sizeComputed;

  @override
  double get size => (_$sizeComputed ??= Computed<double>(() => super.size,
          name: '_PlayerScreenControllerBase.size'))
      .value;
  Computed<bool>? _$largeComputed;

  @override
  bool get large => (_$largeComputed ??= Computed<bool>(() => super.large,
          name: '_PlayerScreenControllerBase.large'))
      .value;
  Computed<String>? _$svgComputed;

  @override
  String get svg => (_$svgComputed ??= Computed<String>(() => super.svg,
          name: '_PlayerScreenControllerBase.svg'))
      .value;

  late final _$_sizeAtom =
      Atom(name: '_PlayerScreenControllerBase._size', context: context);

  @override
  double get _size {
    _$_sizeAtom.reportRead();
    return super._size;
  }

  @override
  set _size(double value) {
    _$_sizeAtom.reportWrite(value, super._size, () {
      super._size = value;
    });
  }

  late final _$_largeAtom =
      Atom(name: '_PlayerScreenControllerBase._large', context: context);

  @override
  bool get _large {
    _$_largeAtom.reportRead();
    return super._large;
  }

  @override
  set _large(bool value) {
    _$_largeAtom.reportWrite(value, super._large, () {
      super._large = value;
    });
  }

  late final _$_svgAtom =
      Atom(name: '_PlayerScreenControllerBase._svg', context: context);

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

  late final _$_PlayerScreenControllerBaseActionController =
      ActionController(name: '_PlayerScreenControllerBase', context: context);

  @override
  void setSvg(String svg) {
    final _$actionInfo = _$_PlayerScreenControllerBaseActionController
        .startAction(name: '_PlayerScreenControllerBase.setSvg');
    try {
      return super.setSvg(svg);
    } finally {
      _$_PlayerScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic createRandomNewAvatar() {
    final _$actionInfo = _$_PlayerScreenControllerBaseActionController
        .startAction(name: '_PlayerScreenControllerBase.createRandomNewAvatar');
    try {
      return super.createRandomNewAvatar();
    } finally {
      _$_PlayerScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSize() {
    final _$actionInfo = _$_PlayerScreenControllerBaseActionController
        .startAction(name: '_PlayerScreenControllerBase.updateSize');
    try {
      return super.updateSize();
    } finally {
      _$_PlayerScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
size: ${size},
large: ${large},
svg: ${svg}
    ''';
  }
}

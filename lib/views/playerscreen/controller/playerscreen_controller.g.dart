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
  Computed<XFile?>? _$selectedImageComputed;

  @override
  XFile? get selectedImage =>
      (_$selectedImageComputed ??= Computed<XFile?>(() => super.selectedImage,
              name: '_PlayerScreenControllerBase.selectedImage'))
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

  late final _$pictureAtom =
      Atom(name: '_PlayerScreenControllerBase.picture', context: context);

  @override
  String get picture {
    _$pictureAtom.reportRead();
    return super.picture;
  }

  @override
  set picture(String value) {
    _$pictureAtom.reportWrite(value, super.picture, () {
      super.picture = value;
    });
  }

  late final _$_selectedImageAtom = Atom(
      name: '_PlayerScreenControllerBase._selectedImage', context: context);

  @override
  XFile? get _selectedImage {
    _$_selectedImageAtom.reportRead();
    return super._selectedImage;
  }

  @override
  set _selectedImage(XFile? value) {
    _$_selectedImageAtom.reportWrite(value, super._selectedImage, () {
      super._selectedImage = value;
    });
  }

  late final _$takePhotoAsyncAction =
      AsyncAction('_PlayerScreenControllerBase.takePhoto', context: context);

  @override
  Future<void> takePhoto() {
    return _$takePhotoAsyncAction.run(() => super.takePhoto());
  }

  late final _$getImageFromGalleryAsyncAction = AsyncAction(
      '_PlayerScreenControllerBase.getImageFromGallery',
      context: context);

  @override
  Future<void> getImageFromGallery() {
    return _$getImageFromGalleryAsyncAction
        .run(() => super.getImageFromGallery());
  }

  late final _$_PlayerScreenControllerBaseActionController =
      ActionController(name: '_PlayerScreenControllerBase', context: context);

  @override
  void setPicture(String svg) {
    final _$actionInfo = _$_PlayerScreenControllerBaseActionController
        .startAction(name: '_PlayerScreenControllerBase.setPicture');
    try {
      return super.setPicture(svg);
    } finally {
      _$_PlayerScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createRandomNewAvatar() {
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
picture: ${picture},
size: ${size},
large: ${large},
svg: ${svg},
selectedImage: ${selectedImage}
    ''';
  }
}

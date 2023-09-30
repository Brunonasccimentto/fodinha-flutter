import 'package:mobx/mobx.dart';
import 'package:random_avatar/random_avatar.dart';

part "playerscreen_controller.g.dart";

class PlayerScreenController = _PlayerScreenControllerBase with _$PlayerScreenController;
  
abstract class _PlayerScreenControllerBase with Store {

  @observable
  double _size = 0;

  @observable
  bool _large = false;

  @observable
  String _svg = "";

  @computed
  double get size => _size;

  @computed
  bool get large => _large;

  @computed
  String get svg => _svg;

  @action
  void setSvg(String svg) {
    _svg = svg;
  }

  @action
  createRandomNewAvatar(){
    _svg = RandomAvatarString(
    DateTime.now().toIso8601String(),
    trBackground: false,);
  }

  @action
  void updateSize(){ 
     _large = !large;
    _size = large ? 60 : 0;
  }

}
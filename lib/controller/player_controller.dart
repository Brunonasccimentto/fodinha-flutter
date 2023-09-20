
class PlayerController {
  String _name = "";
  String _color = "";
  int _count = 0;
  int _points = 0;
  List _historyCount = [];
  bool _dealer = false;
  String? _photo;

  void setName(String value) => _name = value;
  void serColor(String value) => _color = value;
  void setCount(int value) => _count = value;
  void setPoints(int value) => _points = value;
  void setHistoryCount(List value) => _historyCount = value;
  void setDealer(bool value) => _dealer = value;
  void setPhoto(String? value) => _photo = value;

  void CreatePlayer(){
    
  }
}
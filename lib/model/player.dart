class PlayerModel {
  late String name;
  late String color;
  int count = 0;
  int points = 0;
  List historyCount = [];
  bool dealer = false;
  String? photo;

  PlayerModel(
      {required this.name,
      required this.color,
      required this.dealer,
      this.photo});

  PlayerModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    color = json['color'];
    count = json['count'];
    points = json['points'];
    historyCount = json['historyCount'];
    dealer = json['dealer'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['color'] = this.color;
    data['count'] = this.count;
    data['points'] = this.points;
    data['historyCount'] = this.historyCount;
    data['dealer'] = this.dealer;
    data['photo'] = this.photo;
    return data;
  }
}

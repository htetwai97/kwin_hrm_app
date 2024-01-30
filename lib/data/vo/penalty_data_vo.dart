class PenaltyVO {
  int? pPercent;
  int? pAmount;
  String? pTime;

  PenaltyVO({this.pPercent, this.pAmount, this.pTime});

  PenaltyVO.fromJson(Map<String, dynamic> json) {
    pPercent = json['pPercent'];
    pAmount = json['pAmount'];
    pTime = json['pTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pPercent'] = this.pPercent;
    data['pAmount'] = this.pAmount;
    data['pTime'] = this.pTime;
    return data;
  }
}
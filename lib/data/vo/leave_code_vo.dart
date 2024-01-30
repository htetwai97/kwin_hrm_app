class LeaveCodeVO {
  String? code;
  int? seq;

  LeaveCodeVO({this.code, this.seq});

  LeaveCodeVO.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    seq = json['seq'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['seq'] = this.seq;
    return data;
  }
}


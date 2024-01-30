import 'package:hr_management_application/data/vo/penalty_data_vo.dart';

class LocationDataVO {
  PenaltyVO? fstPenalty;
  PenaltyVO? secPenalty;
  PenaltyVO? thdPenalty;
  PenaltyVO? fnlPenalty;
  String? sId;
  double? referenceLat;
  double? referenceLon;
  String? refAddress;
  int? iV;
  String? deal;

  LocationDataVO(
      {this.fstPenalty,
      this.secPenalty,
      this.thdPenalty,
      this.fnlPenalty,
      this.sId,
      this.referenceLat,
      this.referenceLon,
      this.refAddress,
      this.iV,
      this.deal});

  LocationDataVO.fromJson(Map<String, dynamic> json) {
    fstPenalty = json['fstpenalty'] != null
        ? new PenaltyVO.fromJson(json['fstpenalty'])
        : null;
    secPenalty = json['secpenalty'] != null
        ? new PenaltyVO.fromJson(json['secpenalty'])
        : null;
    thdPenalty = json['thdpenalty'] != null
        ? new PenaltyVO.fromJson(json['thdpenalty'])
        : null;
    fnlPenalty = json['fnlpenalty'] != null
        ? new PenaltyVO.fromJson(json['fnlpenalty'])
        : null;
    sId = json['_id'];
    referenceLat = json['referenceLat'];
    referenceLon = json['referenceLon'];
    refAddress = json['refAddress'];
    iV = json['__v'];
    deal = json['deal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fstPenalty != null) {
      data['fstpenalty'] = this.fstPenalty!.toJson();
    }
    if (this.secPenalty != null) {
      data['secpenalty'] = this.secPenalty!.toJson();
    }
    if (this.thdPenalty != null) {
      data['thdpenalty'] = this.thdPenalty!.toJson();
    }
    if (this.fnlPenalty != null) {
      data['fnlpenalty'] = this.fnlPenalty!.toJson();
    }
    data['_id'] = this.sId;
    data['referenceLat'] = this.referenceLat;
    data['referenceLon'] = this.referenceLon;
    data['refAddress'] = this.refAddress;
    data['__v'] = this.iV;
    data['deal'] = this.deal;
    return data;
  }
}

class ProfilePicVO {
  String? id;
  String? imgUrl;
  String? fileName;

  ProfilePicVO({
    this.id,
    this.imgUrl,
    this.fileName,
  });

  ProfilePicVO.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    imgUrl = json['imgUrl'];
    fileName = json['fileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['imgUrl'] = this.imgUrl;
    data['fileName'] = this.fileName;
    return data;
  }
}

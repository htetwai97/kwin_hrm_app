class PDFDocumentVO {
  String? sId;
  String? imgUrl;
  String? fileName;
  String? type;
  String? relatedEmployee;
  String? createdDate;
  int? iV;

  PDFDocumentVO(
      {this.sId,
        this.imgUrl,
        this.fileName,
        this.type,
        this.relatedEmployee,
        this.createdDate,
        this.iV});

  PDFDocumentVO.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    imgUrl = json['imgUrl'];
    fileName = json['fileName'];
    type = json['image'];
    relatedEmployee = json['relatedEmployee'];
    createdDate = json['createdDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['imgUrl'] = this.imgUrl;
    data['fileName'] = this.fileName;
    data['image'] = this.type;
    data['relatedEmployee'] = this.relatedEmployee;
    data['createdDate'] = this.createdDate;
    data['__v'] = this.iV;
    return data;
  }
}
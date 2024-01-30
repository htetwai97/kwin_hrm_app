class LoginUserVO {
  String? name;
  String? email;
  String? phone;
  String? gender;

  LoginUserVO({
    this.name,
    this.email,
    this.phone,
    this.gender,
  });

  LoginUserVO.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    return data;
  }
}

import 'package:hr_management_application/data/vo/login_user_vo.dart';

class PostLoginResponse {
  String? id;
  bool? isAdmin;
  bool? isUser;
  bool? isDoctor;
  String? token;
  LoginUserVO? user;

  PostLoginResponse(
      {this.id,
      this.isAdmin,
      this.isUser,
      this.isDoctor,
      this.token,
      this.user});

  PostLoginResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isAdmin = json['isAdmin'];
    isUser = json['isUser'];
    isDoctor = json['isDoctor'];
    token = json['token'];
    user = json['user'] != null ? new LoginUserVO.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isAdmin'] = this.isAdmin;
    data['isUser'] = this.isUser;
    data['isDoctor'] = this.isDoctor;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class LogInModel {
  String? message;
  Data? data;
  String? token;

  LogInModel({this.message, this.data, this.token});

  LogInModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  String? sId;
  String? email;
  String? password;
  String? username;
  String? phonenumber;
  int? iV;

  Data(
      {this.sId,
        this.email,
        this.password,
        this.username,
        this.phonenumber,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    username = json['username'];
    phonenumber = json['phonenumber'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['username'] = this.username;
    data['phonenumber'] = this.phonenumber;
    data['__v'] = this.iV;
    return data;
  }
}
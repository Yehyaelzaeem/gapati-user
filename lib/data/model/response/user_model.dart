
import '../../../domain/entities/user_entity.dart';
class UserModel {
  LoginModelData? data;

  UserModel({this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  LoginModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginModelData {
  int? id;
  String? name;
  String? email;
  String? mobileNumber;
  String? token;
  String? image;

  LoginModelData(
      {this.id,
        this.name,
        this.email,
        this.mobileNumber,
        this.token,
        this.image});

  LoginModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    token = json['token'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile_number'] = mobileNumber;
    data['token'] =token;
    data['image'] =image;
    return data;
  }
}



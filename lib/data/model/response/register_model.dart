class RegisterModel {
  RegisterModelData? data;

  RegisterModel({this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new RegisterModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class RegisterModelData {
  String? mobileNumber;
  String? otp;

  RegisterModelData({this.mobileNumber, this.otp});

  RegisterModelData.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobile_number'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_number'] = this.mobileNumber;
    data['otp'] = this.otp;
    return data;
  }
}

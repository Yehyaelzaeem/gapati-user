class OtpModel {
  int? code;
  String? message;
  AuthModel? item;

  OtpModel({this.code, this.message, this.item});

  OtpModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    item = json['item'] != null ?  AuthModel.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (item != null) {
      data['item'] = item!.toJson();
    }
    return data;
  }
}

class AuthModel {
  String? otp;
  String? mobileNumber;

  AuthModel({this.otp, this.mobileNumber});

  AuthModel.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    mobileNumber = json['mobile_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otp'] =otp;
    data['mobile_number'] = mobileNumber;
    return data;
  }
}

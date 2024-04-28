class LastAddressModel {
  Data? data;

  LastAddressModel({this.data});

  LastAddressModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? toLat;
  String? toLng;
  String? phone;
  String? toAddress;

  Data({this.toLat, this.toLng, this.phone, this.toAddress});

  Data.fromJson(Map<String, dynamic> json) {
    toLat = json['to_lat'];
    toLng = json['to_lng'];
    phone = json['phone'];
    toAddress = json['to_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to_lat'] = this.toLat;
    data['to_lng'] = this.toLng;
    data['phone'] = this.phone;
    data['to_address'] = this.toAddress;
    return data;
  }
}

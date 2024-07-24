class CheckOutModelRes {
  CheckOutModelResData? data;

  CheckOutModelRes({this.data});

  CheckOutModelRes.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new CheckOutModelResData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CheckOutModelResData {
  int? id;
  String? name;
  int? price;
  String? date;
  String? paymentMethod;
  String? toLat;
  String? toLng;
  String? phone;
  String? toAddress;
  int? addressId;
  String? addressNot;
  String? image;

  CheckOutModelResData(
      {this.id,
        this.name,
        this.price,
        this.date,
        this.paymentMethod,
        this.toLat,
        this.toLng,
        this.phone,
        this.toAddress,
        this.addressId,
        this.addressNot,
        this.image});

  CheckOutModelResData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    date = json['date'];
    paymentMethod = json['payment_method'];
    toLat = json['to_lat'];
    toLng = json['to_lng'];
    phone = json['phone'];
    toAddress = json['to_address'];
    addressId = json['address_id'];
    addressNot = json['address_not'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['date'] = this.date;
    data['payment_method'] = this.paymentMethod;
    data['to_lat'] = this.toLat;
    data['to_lng'] = this.toLng;
    data['phone'] = this.phone;
    data['to_address'] = this.toAddress;
    data['address_id'] = this.addressId;
    data['address_not'] = this.addressNot;
    data['image'] = this.image;
    return data;
  }
}

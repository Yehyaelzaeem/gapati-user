class AddressModel {
  List<AddressModelData>? data;

  AddressModel({this.data});

  AddressModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AddressModelData>[];
      json['data'].forEach((v) {
        data!.add(new AddressModelData.fromJson(v));
      });
    }
  }
}

class AddressModelData {
  int? id;
  String? lat;
  String? lng;
  String? address;
  String? phone;
  String? addressToNote;

  AddressModelData({this.id,this.lat, this.lng, this.address, this.phone, this.addressToNote});

  factory AddressModelData.fromJson(Map<String, dynamic> json) {
    return AddressModelData(
      id: json["id"],
      lat: json["lat"],
      lng: json["lng"],
      address: json["address"],
      phone: json["phone"],
      addressToNote: json["address_note"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'lat': this.lat,
      'lng': this.lng,
      'address': this.address,
      'phone': this.phone,
      'addressToNote': this.addressToNote,
    };
  }


}

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddressModelData {
  int? id;
  String? latTo;
  String? lngTo;
  String? addressTo;
  String? image;
  bool? isMain;
  int? addressType;
  String? addressToNote;

  AddressModelData(
      {this.id,
        this.latTo,
        this.lngTo,
        this.addressTo,
        this.image,
        this.isMain,
        this.addressType,
        this.addressToNote});

  AddressModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latTo = json['lat_to'];
    lngTo = json['lng_to'];
    addressTo = json['address_to'];
    image = json['image'];
    isMain = json['is_main'];
    addressType = json['address_type'];
    addressToNote = json['address_to_note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lat_to'] = this.latTo;
    data['lng_to'] = this.lngTo;
    data['address_to'] = this.addressTo;
    data['image'] = this.image;
    data['is_main'] = this.isMain;
    data['address_type'] = this.addressType;
    data['address_to_note'] = this.addressToNote;
    return data;
  }
}

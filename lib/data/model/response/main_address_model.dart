class MainAddressModel {
  List<MainAddressModelData>? data;

  MainAddressModel({this.data});

  MainAddressModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MainAddressModelData>[];
      json['data'].forEach((v) {
        data!.add( MainAddressModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainAddressModelData {
  int? id;
  String? latTo;
  String? lngTo;
  String? addressTo;
  String? image;
  bool? isMain;
  int? addressType;
  String? addressToNote;

  MainAddressModelData(
      {this.id,
        this.latTo,
        this.lngTo,
        this.addressTo,
        this.image,
        this.isMain,
        this.addressType,
        this.addressToNote});

  MainAddressModelData.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['lat_to'] = latTo;
    data['lng_to'] = lngTo;
    data['address_to'] = addressTo;
    data['image'] = image;
    data['is_main'] = isMain;
    data['address_type'] = addressType;
    data['address_to_note'] = addressToNote;
    return data;
  }
}

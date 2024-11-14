class NearestBranchModel {
  List<NearestBranchModelData>? data;

  NearestBranchModel({this.data});

  NearestBranchModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <NearestBranchModelData>[];
      json['data'].forEach((v) {
        data!.add(new NearestBranchModelData.fromJson(v));
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

class NearestBranchModelData {
  int? id;
  String? name;
  String? address;
  String? phone;
  String? email;
  String? lat;
  String? lng;
  String? distance;
  Region? region;

  NearestBranchModelData(
      {this.id,
        this.name,
        this.address,
        this.phone,
        this.email,
        this.lat,
        this.lng,
        this.distance,
        this.region});

  NearestBranchModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    lat = json['lat'];
    lng = json['lng'];
    distance = json['distance'];
    region =
    json['region'] != null ? new Region.fromJson(json['region']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['distance'] = this.distance;
    if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
    return data;
  }
}

class Region {
  int? id;
  String? name;

  Region({this.id, this.name});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

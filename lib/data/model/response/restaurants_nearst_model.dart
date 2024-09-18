class RestaurantsNearestModel {
  List<RestaurantsNearestModelData>? data;

  RestaurantsNearestModel({this.data});

  RestaurantsNearestModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RestaurantsNearestModelData>[];
      json['data'].forEach((v) {
        data!.add(new RestaurantsNearestModelData.fromJson(v));
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

class RestaurantsNearestModelData {
  int? id;
  Branch? branch;
  String? name;
  String? category;
  String? image;
  String? banner;
  int? rate;
  Discount? discount;
  String? distance;
  bool? opening;
  bool? inFav;

  RestaurantsNearestModelData(
      {this.id,
        this.branch,
        this.name,
        this.category,
        this.image,
        this.banner,
        this.rate,
        this.discount,
        this.distance,
        this.opening,
        this.inFav});

  RestaurantsNearestModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branch =
    json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    name = json['name'];
    category = json['category'];
    image = json['image'];
    banner = json['banner'];
    rate = json['rate'];
    discount = json['discount'] != null
        ? new Discount.fromJson(json['discount'])
        : null;
    distance = json['distance'];
    opening = json['opening'];
    inFav = json['inFav'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    data['name'] = this.name;
    data['category'] = this.category;
    data['image'] = this.image;
    data['banner'] = this.banner;
    data['rate'] = this.rate;
    if (this.discount != null) {
      data['discount'] = this.discount!.toJson();
    }
    data['distance'] = this.distance;
    data['opening'] = this.opening;
    data['inFav'] = this.inFav;
    return data;
  }
}

class Branch {
  int? id;
  String? name;
  String? address;
  String? phone;
  String? email;
  String? lat;
  String? lng;
  Region? region;

  Branch(
      {this.id,
        this.name,
        this.address,
        this.phone,
        this.email,
        this.lat,
        this.lng,
        this.region});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    lat = json['lat'];
    lng = json['lng'];
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

class Discount {
  String? name;
  String? offerType;
  String? startDate;
  String? endDate;
  String? percentage;

  Discount(
      {this.name,
        this.offerType,
        this.startDate,
        this.endDate,
        this.percentage});

  Discount.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    offerType = json['offer_type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['offer_type'] = this.offerType;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['percentage'] = this.percentage;
    return data;
  }
}

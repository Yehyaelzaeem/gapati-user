class StoresModel {
  List<StoresModelData>? data;

  StoresModel({this.data});

  StoresModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <StoresModelData>[];
      json['data'].forEach((v) {
        data!.add(new StoresModelData.fromJson(v));
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
class CategoriesData {
  int? id;
  String? name;

  CategoriesData({this.id, this.name});

  CategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }


}
class StoresModelData {
  int? id;
  Branch? branch;

  String? name;
  CategoriesData? category;
  String? image;
  String? banner;
  dynamic deliveryTime;
  dynamic deliveryFees;
  dynamic orderTime;
  String? distance;
  dynamic rate;
  Discount? discount;
  bool? opening;
  bool? inFav;
  String? status;

  StoresModelData(
      {this.id,
        this.branch,
        this.name,
        this.category,
        this.image,
        this.banner,
        this.deliveryTime,
        this.deliveryFees,
        this.orderTime,
        this.distance,
        this.rate,
        this.discount,
        this.opening,
        this.inFav,
        this.status});

  StoresModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branch =
    json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    name = json['name'];
    category = CategoriesData.fromJson(json['store_type']);
    image = json['image'];
    banner = json['banner'];
    deliveryTime = json['delivery_time'];
    deliveryFees = json['delivery_fees'];
    orderTime = json['order_time'];
    distance = json['distance'];
    rate = json['rate'];
    discount = json['discount'] != null
        ? new Discount.fromJson(json['discount'])
        : null;
    opening = json['opening'];
    inFav = json['inFav'];
    status = json['status'];
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
    data['delivery_time'] = this.deliveryTime;
    data['delivery_fees'] = this.deliveryFees;
    data['order_time'] = this.orderTime;
    data['distance'] = this.distance;
    data['rate'] = this.rate;
    if (this.discount != null) {
      data['discount'] = this.discount!.toJson();
    }
    data['opening'] = this.opening;
    data['inFav'] = this.inFav;
    data['status'] = this.status;
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
  String? distance;
  // Region? region;

  Branch(
      {this.id,
        this.name,
        this.address,
        this.phone,
        this.email,
        this.lat,
        this.lng,
        this.distance,
        // this.region,
      });

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    lat = json['lat'];
    lng = json['lng'];
    distance = json['distance'];
    // region =
    // json['region'] != null ? new Region.fromJson(json['region']) : null;
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
    // if (this.region != null) {
    //   data['region'] = this.region!.toJson();
    // }
    return data;
  }
}

// class Region {
//   int? id;
//   String? name;
//
//   Region({this.id, this.name});
//
//   Region.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

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

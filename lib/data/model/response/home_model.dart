import 'package:delivego/data/model/response/stores_model.dart';

import 'categories_model.dart';

class HomeModel {
  CategoriesModel? category;
  DataModel? data;
  OfferModel? offerData;

  HomeModel({this.category, this.data, this.offerData});

  HomeModel.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new CategoriesModel.fromJson(json['category'])
        : null;
    data = json['data'] != null ? new DataModel.fromJson(json['data']) : null;
    offerData = json['offer_data'] != null
        ? new OfferModel.fromJson(json['offer_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.offerData != null) {
      data['offer_data'] = this.offerData!.toJson();
    }
    return data;
  }
}



class DataModel{
  List<DataModelData>? data;

  DataModel({this.data});

  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataModelData>[];
      json['data'].forEach((v) {
        data!.add(new DataModelData.fromJson(v));
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
class DataModelData {
  int? id;
  String? name;
  CategoriesData? category;
  String? image;
  String? banner;
  List<Branch>? branch;
  int? rate;
  String? deliveryTime;
  dynamic deliveryFees;
  String? orderTime;
  Discount? discount;
  bool? opening;
  bool? inFav;
  String? status;

  DataModelData(
      {this.id,
        this.name,
        this.category,
        this.image,
        this.banner,
        this.branch,
        this.rate,
        this.deliveryTime,
        this.deliveryFees,
        this.orderTime,
        this.discount,
        this.opening,
        this.inFav,
        this.status});

  DataModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = CategoriesData.fromJson(json['store_type']);
    image = json['image'];
    banner = json['banner'];
    if (json['branch'] != null) {
      branch = <Branch>[];
      json['branch'].forEach((v) {
        branch!.add(new Branch.fromJson(v));
      });
    }
    rate = json['rate'];
    deliveryTime = json['delivery_time'];
    deliveryFees = json['delivery_fees'];
    orderTime = json['order_time'];
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
    data['name'] = this.name;
    data['category'] = this.category;
    data['image'] = this.image;
    data['banner'] = this.banner;
    if (this.branch != null) {
      data['branch'] = this.branch!.map((v) => v.toJson()).toList();
    }
    data['rate'] = this.rate;
    data['delivery_time'] = this.deliveryTime;
    data['delivery_fees'] = this.deliveryFees;
    data['order_time'] = this.orderTime;
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
  // String? region;

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
    // region = json['region'];
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




class OfferModel{
  List<OfferModelData>? data;

  OfferModel({this.data});

  OfferModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OfferModelData>[];
      json['data'].forEach((v) {
        data!.add(new OfferModelData.fromJson(v));
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
class OfferModelData {
  int? id;
  String? name;
  String? description;
  String? startDate;
  int? branchId;
  String? endDate;
  String? offerType;
  Resturant? resturant;
  Item? item;


  OfferModelData(
      {this.id,
        this.name,
        this.description,
        this.startDate,
        this.endDate,
        this.branchId,
        this.offerType,
        this.resturant,
        this.item});

  OfferModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];

    offerType = json['offer_type'];
    resturant = json['resturant'] != null
        ? new Resturant.fromJson(json['resturant'])
        : null;
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['offer_type'] = this.offerType;
    if (this.resturant != null) {
      data['resturant'] = this.resturant!.toJson();
    }
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    return data;
  }
}

class Resturant {
  int? id;
  String? name;
  String? category;
  String? image;
  int? rate;
  String? distance;
  bool? opening;
  List<Branch>? branch;


  Resturant(
      {this.id,
        this.name,
        this.category,
        this.image,
        this.branch,
        this.rate,
        this.distance,
        this.opening});

  Resturant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    image = json['image'];
    rate = json['rate'];
    distance = json['distance'];
    if (json['branch'] != null) {
      branch = <Branch>[];
      json['branch'].forEach((v) {
        branch!.add(new Branch.fromJson(v));
      });
    }
    opening = json['opening'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['image'] = this.image;
    data['rate'] = this.rate;
    data['distance'] = this.distance;
    data['opening'] = this.opening;
    return data;
  }
}

class Item {
  int? id;
  String? name;
  int? categoryId;
  String? categoryName;
  String? price;
  String? priceDiscount;
  int? priceAfterDiscount;
  String? image;
  bool? incart;
  bool? inFav;
  ExtraModel? itemsExtrat;

  Item(
      {this.id,
        this.name,
        this.categoryId,
        this.categoryName,
        this.price,
        this.priceDiscount,
        this.priceAfterDiscount,
        this.image,
        this.incart,
        this.inFav,
        this.itemsExtrat});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    price = json['price'];
    priceDiscount = json['price_discount'];
    priceAfterDiscount = json['price_after_discount'];
    image = json['image'];
    incart = json['incart'];
    inFav = json['inFav'];
    itemsExtrat = json['items_extrat'] != null
        ? new ExtraModel.fromJson(json['items_extrat'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['price'] = this.price;
    data['price_discount'] = this.priceDiscount;
    data['price_after_discount'] = this.priceAfterDiscount;
    data['image'] = this.image;
    data['incart'] = this.incart;
    data['inFav'] = this.inFav;
    if (this.itemsExtrat != null) {
      data['items_extrat'] = this.itemsExtrat!.toJson();
    }
    return data;
  }
}
class ExtraModel{
  List<ExtraData>? data;

  ExtraModel({this.data});

  ExtraModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ExtraData>[];
      json['data'].forEach((v) {
        data!.add(new ExtraData.fromJson(v));
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

class ExtraData {
  int? id;
  String? name;
  String? price;

  ExtraData({this.id, this.name, this.price});

  ExtraData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

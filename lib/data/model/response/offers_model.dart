class OffersModel {
  List<OffersModelData>? data;

  OffersModel({this.data});

  OffersModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OffersModelData>[];
      json['data'].forEach((v) {
        data!.add( OffersModelData.fromJson(v));
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

class OffersModelData {
  int? id;
  String? name;
  String? description;
  String? startDate;
  String? endDate;
  String? offerType;
  Restaurant? restaurant;
  Item? item;

  OffersModelData(
      {this.id,
        this.name,
        this.description,
        this.startDate,
        this.endDate,
        this.offerType,
        this.restaurant,
        this.item});

  OffersModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    offerType = json['offer_type'];
    restaurant = json['resturant'] != null
        ?  Restaurant.fromJson(json['resturant'])
        : null;
    item = json['item'] != null ?  Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['offer_type'] = offerType;
    if (restaurant != null) {
      data['resturant'] = restaurant!.toJson();
    }
    if (item != null) {
      data['item'] = item!.toJson();
    }
    return data;
  }
}

class Restaurant {
  int? id;
  String? name;
  String? category;
  String? image;
  int? rate;
  String? distance;
  bool? opening;

  Restaurant(
      {this.id,
        this.name,
        this.category,
        this.image,
        this.rate,
        this.distance,
        this.opening});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    image = json['image'];
    rate = json['rate'];
    distance = json['distance'];
    opening = json['opening'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['image'] = image;
    data['rate'] = rate;
    data['distance'] = distance;
    data['opening'] = opening;
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
  bool? inCart;
  bool? inFav;

  Item(
      {this.id,
        this.name,
        this.categoryId,
        this.categoryName,
        this.price,
        this.priceDiscount,
        this.priceAfterDiscount,
        this.image,
        this.inCart,
        this.inFav,

      });

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    price = json['price'];
    priceDiscount = json['price_discount'];
    priceAfterDiscount = json['price_after_discount'];
    priceAfterDiscount = json['price_after_discount'];
    image = json['image'];
    inCart = json['incart'];
    inFav = json['inFav'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['price'] = price;
    data['price_discount'] = priceDiscount;
    data['price_after_discount'] = priceAfterDiscount;
    data['image'] = image;
    return data;
  }
}

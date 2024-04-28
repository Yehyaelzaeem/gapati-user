class FavoriteModel {
  List<FavoriteModelData>? data;

  FavoriteModel({this.data});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FavoriteModelData>[];
      json['data'].forEach((v) {
        data!.add(new FavoriteModelData.fromJson(v));
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

class FavoriteModelData {
  int? id;
  String? name;
  String? description;
  int? categoryId;
  String? categoryName;
  String? price;
  String? priceDiscount;
  int? priceAfterDiscount;
  int? storeId;
  String? image;
  bool? incart;
  bool? inFav;

  FavoriteModelData(
      {this.id,
        this.name,
        this.description,
        this.categoryId,
        this.categoryName,
        this.price,
        this.priceDiscount,
        this.priceAfterDiscount,
        this.storeId,
        this.image,
        this.incart,
        this.inFav});

  FavoriteModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    price = json['price'];
    priceDiscount = json['price_discount'];
    priceAfterDiscount = json['price_after_discount'];
    storeId = json['store_id'];
    image = json['image'];
    incart = json['incart'];
    inFav = json['inFav'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['price'] = this.price;
    data['price_discount'] = this.priceDiscount;
    data['price_after_discount'] = this.priceAfterDiscount;
    data['store_id'] = this.storeId;
    data['image'] = this.image;
    data['incart'] = this.incart;
    data['inFav'] = this.inFav;
    return data;
  }
}

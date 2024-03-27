class CategoriesAllItemsModel {
  List<CategoriesAllItemsModelData>? data;

  CategoriesAllItemsModel({this.data});

  CategoriesAllItemsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CategoriesAllItemsModelData>[];
      json['data'].forEach((v) {
        data!.add(CategoriesAllItemsModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoriesAllItemsModelData {
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

  CategoriesAllItemsModelData(
      {this.id,
        this.name,
        this.description,
        this.categoryId,
        this.categoryName,
        this.price,
        this.priceDiscount,
        this.priceAfterDiscount,
        this.storeId,
        this.image});

  CategoriesAllItemsModelData.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['price'] = price;
    data['price_discount'] = priceDiscount;
    data['price_after_discount'] = priceAfterDiscount;
    data['store_id'] = storeId;
    data['image'] = image;
    return data;
  }
}

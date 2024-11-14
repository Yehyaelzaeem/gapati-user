import 'item_extra_model.dart';

class CategoryItemModel {
  CategoryItemModelData? data;

  CategoryItemModel({this.data});

  CategoryItemModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? CategoryItemModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CategoryItemModelData {
  int? id;
  String? name;
  String? icon;
  CategoryItems? categoryItems;

  CategoryItemModelData({this.id, this.name, this.icon, this.categoryItems});

  CategoryItemModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    categoryItems = json['category_items'] != null
        ?  CategoryItems.fromJson(json['category_items'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    if (categoryItems != null) {
      data['category_items'] = categoryItems!.toJson();
    }
    return data;
  }
}

class CategoryItems {
  List<CategoryItemsData>? data;

  CategoryItems({this.data});

  CategoryItems.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CategoryItemsData>[];
      json['data'].forEach((v) {
        data!.add( CategoryItemsData.fromJson(v));
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

class CategoryItemsData {
  int? id;
  String? name;
  String? description;
  int? categoryId;
  String? categoryName;
  dynamic price;
  dynamic priceDiscount;
  dynamic priceAfterDiscount;
  int? storeId;
  String? image;
  bool? inCart;
  bool? inFav;
  int? count;
  int? branchId;
  List<ItemExtraModelData>? itemExtraModelDataSelected;
  List<ItemExtraModelData>? itemExtraModelMain2;
  ProductSize? productSize;
  ProductSize? productSizeSelected;
  CategoryItemsData(
      {this.id,
        this.name,
        this.description,
        this.categoryId,
        this.categoryName,
        this.price,
        this.priceDiscount,
        this.priceAfterDiscount,
        this.storeId=1,
        this.image,
        this.inCart,
        this.inFav,
        this.count=0,
        this.branchId,
        this.productSize,
        this.productSizeSelected,
        this.itemExtraModelDataSelected,
      });

  CategoryItemsData.fromJson(Map<String, dynamic> json) {
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
    inCart = json['incart'];
    inFav = json['inFav'];
    productSize = json['items_size'] != null
        ?  ProductSize.fromJson(json['items_size'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['incart'] = inCart;
    data['inFav'] = inFav;
    data['count'] = count;
    data['prise'] = productSizeSelected;
    return data;
  }
}
class ProductSize {
  List<ProductSizeData>? data;

  ProductSize({this.data});

  ProductSize.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProductSizeData>[];
      json['data'].forEach((v) {
        data!.add( ProductSizeData.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toMap()).toList();
    }
    return data;
  }
}
class ProductSizeData {
  int? id;
  String? name;
  String? nameEn;
  String? nameAr;
  dynamic price;
  dynamic priceAfterDiscount;

  ProductSizeData(
      {this.id,
      this.name,
      this.nameEn,
      this.nameAr,
      this.price,
      this.priceAfterDiscount});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'name_en': this.nameEn,
      'name_ar': this.nameAr,
      'price': this.price,
      'price_after_discount': this.priceAfterDiscount,
    };
  }

  factory ProductSizeData.fromMap(Map<String, dynamic> map) {
    return ProductSizeData(
      id: map['id'] as int,
      name: map['name'] as String,
      nameEn: map['name_en'] as String,
      nameAr: map['name_ar'] as String,
      price: map['price'] as dynamic,
      priceAfterDiscount: map['price_after_discount'] as dynamic,
    );
  }
}
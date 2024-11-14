import 'category_item_model.dart';
import 'order_details_model.dart';

class BestDishModel {
  List<BestDishModelData>? data;
  Meta? meta;

  BestDishModel({this.data, this.meta});

  BestDishModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BestDishModelData>[];
      json['data'].forEach((v) { data!.add(new BestDishModelData.fromJson(v)); });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
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

class BestDishModelData {
  int? id;
  String? name;
  String? description;
  String? nameEn;
  String? descriptionEn;
  String? nameAr;
  String? descriptionAr;
  int? categoryId;
  String? categoryName;
  dynamic price;
  dynamic priceDiscount;
  dynamic priceAfterDiscount;
  int? storeId;
  String? image;
  bool? incart;
  int? bestDishes;
  bool? inFav;
  ExtraModel? itemsExtrat;
  ProductSize? size;
  bool? published;

  BestDishModelData({this.id, this.name, this.description, this.nameEn, this.descriptionEn, this.nameAr,
    this.size,
    this.descriptionAr, this.categoryId, this.categoryName, this.price, this.priceDiscount, this.priceAfterDiscount, this.storeId, this.image, this.incart, this.bestDishes,
    this.inFav,
    this.itemsExtrat,
    this.published});

  BestDishModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    nameEn = json['name_en'];
    descriptionEn = json['description_en'];
    nameAr = json['name_ar'];
    descriptionAr = json['description_ar'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    price = json['price'];
    priceDiscount = json['price_discount'];
    priceAfterDiscount = json['price_after_discount'];
    storeId = json['store_id'];
    image = json['image'];
    incart = json['incart'];
    bestDishes = json['best_dishes'];
    inFav = json['inFav'];
    size = json['items_size'] != null
        ? (json['items_size'] is Map<String, dynamic>
        ? ProductSize.fromJson(json['items_size'])
        : null)
        : null;
    itemsExtrat = json['items_extrat'] != null
        ? (json['items_extrat'] is Map<String, dynamic>
        ? ExtraModel.fromJson(json['items_extrat'])
        : null):null;
    published = json['published'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['name_en'] = this.nameEn;
    data['description_en'] = this.descriptionEn;
    data['name_ar'] = this.nameAr;
    data['description_ar'] = this.descriptionAr;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['price'] = this.price;
    data['price_discount'] = this.priceDiscount;
    data['price_after_discount'] = this.priceAfterDiscount;
    data['store_id'] = this.storeId;
    data['image'] = this.image;
    data['incart'] = this.incart;
    data['best_dishes'] = this.bestDishes;
    data['inFav'] = this.inFav;

    data['published'] = this.published;
    return data;
  }
}

class ItemsSize {
  List<String>? data;

  ItemsSize({this.data});

  ItemsSize.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <String>[];
      // json['data'].forEach((v) { data!.add(new String.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      // data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  Pagination? pagination;

  Meta({this.pagination});

  Meta.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null ? new Pagination.fromJson(json['pagination']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Pagination {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  Pagination({this.total, this.count, this.perPage, this.currentPage, this.totalPages, });

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;

    return data;
  }
}


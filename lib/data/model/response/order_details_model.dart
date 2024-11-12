import 'category_item_model.dart';

class OrderDetailsModel {
  OrderDetailsModelData? data;

  OrderDetailsModel({this.data});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new OrderDetailsModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class OrderDetailsModelData {
  int? id;
  String? status;
  String? name;
  String? price;
  String? note;
  String? date;
  String? paymentMethod;
  String? toLat;
  String? toLng;
  String? phone;
  String? toAddress;
  int? addressId;
  String? addressNot;
  String? image;
  List<OrderDetails>? orderDetails;

  OrderDetailsModelData(
      {this.id,
        this.status,
        this.name,
        this.price,
        this.note,
        this.date,
        this.paymentMethod,
        this.toLat,
        this.toLng,
        this.phone,
        this.toAddress,
        this.addressId,
        this.addressNot,
        this.image,
        this.orderDetails});

  OrderDetailsModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    name = json['name'];
    price = json['price'];
    note = json['note'];
    date = json['date'];
    paymentMethod = json['payment_method'];
    toLat = json['to_lat'];
    toLng = json['to_lng'];
    phone = json['phone'];
    toAddress = json['to_address'];
    addressId = json['address_id'];
    addressNot = json['address_not'];
    image = json['image'];
    if (json['order_details'] != null) {
      orderDetails = <OrderDetails>[];
      json['order_details'].forEach((v) {
        orderDetails!.add(new OrderDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['name'] = this.name;
    data['price'] = this.price;
    data['note'] = this.note;
    data['date'] = this.date;
    data['payment_method'] = this.paymentMethod;
    data['to_lat'] = this.toLat;
    data['to_lng'] = this.toLng;
    data['phone'] = this.phone;
    data['to_address'] = this.toAddress;
    data['address_id'] = this.addressId;
    data['address_not'] = this.addressNot;
    data['image'] = this.image;

    if (this.orderDetails != null) {
      data['order_details'] =
          this.orderDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SizeModel{
  int? id;
  String? name;
  String? nameEn;
  String? nameAr;
  dynamic price;
  dynamic priceAfterDiscount;

  SizeModel(
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

  factory SizeModel.fromMap(Map<String, dynamic> map) {

    return SizeModel(
      id: map['id'] as int,
      name: map['name'] as String,
      nameEn: map['name_en'] as String,
      nameAr: map['name_ar'] as String,
      price: map['price'] as dynamic,
      priceAfterDiscount: map['price_after_discount'] as dynamic,
    );
  }
}

class OrderDetails {
  int? id;
  int? tax;
  String? price;
  String? subTotal;
  String? date;
  int? qty;
  Items? items;
  ItemsExtrat? extra;
  SizeModel? size;
  OrderDetails(
      {this.id,
        this.tax,
        this.price,
        this.subTotal,
        this.date,
        this.qty,
        this.items,
        this.size,

        this.extra});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tax = json['tax'];
    price = json['price'];
    subTotal = json['sub_total'];
    date = json['date'];
    size = json['size'] != null
        ? (json['size'] is Map<String, dynamic>
        ? SizeModel.fromMap(json['size'])
        : null)
        : null;
    qty = json['qty'];
    items = json['items'] != null ? new Items.fromJson(json['items']) : null;
    extra =
    json['extra'] != null ? new ItemsExtrat.fromJson(json['extra']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tax'] = this.tax;
    data['price'] = this.price;
    data['sub_total'] = this.subTotal;
    data['date'] = this.date;
    data['qty'] = this.qty;
    if (this.items != null) {
      data['items'] = this.items!.toJson();
    }
    if (this.extra != null) {
      data['extra'] = this.extra!.toJson();
    }
    return data;
  }
}

class Items {
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
  bool? incart;
  bool? inFav;
  List<ItemsExtratData>? itemsExtrat;
  ProductSize? productSize;

  Items(
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
        this.productSize,
        this.inFav,
        this.itemsExtrat});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    productSize = json['items_size'] != null
        ?  ProductSize.fromJson(json['items_size'])
        : null;
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    price = json['price'];
    priceDiscount = json['price_discount'];
    priceAfterDiscount = json['price_after_discount'];
    storeId = json['store_id'];
    image = json['image'];
    incart = json['incart'];
    inFav = json['inFav'];
    if (json['items_extrat'] != null) {
      itemsExtrat = <ItemsExtratData>[];
      json['items_extrat'].forEach((v) {
        itemsExtrat!.add(new ItemsExtratData.fromJson(v));
      });
    }

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
    if (this.itemsExtrat != null) {
        data['items_extrat'] = this.itemsExtrat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemsExtrat {
  List<ItemsExtratData>? data;

  ItemsExtrat({this.data});

  ItemsExtrat.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ItemsExtratData>[];
      json['data'].forEach((v) {
        data!.add(new ItemsExtratData.fromJson(v));
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

class ItemsExtratData {
  int? id;
  String? name;
  String? price;

  ItemsExtratData({this.id, this.name, this.price});

  ItemsExtratData.fromJson(Map<String, dynamic> json) {
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

class Data {
  int? id;
  int? itemId;
  String? name;
  String? price;

  Data({this.id, this.itemId, this.name, this.price});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_id'] = this.itemId;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

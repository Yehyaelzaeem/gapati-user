class OrderDetailsModel {
  List<OrderDetailsModelData>? data;

  OrderDetailsModel({this.data});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OrderDetailsModelData>[];
      json['data'].forEach((v) {
        data!.add(new OrderDetailsModelData.fromJson(v));
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

class OrderDetailsModelData {
  int? id;
  int? tax;
  String? price;
  String? subTotal;
  String? date;
  String? paymentMethod;
  int? qty;
  Items? items;
  Extra? extra;
  OrderDetailsModelData(
      {this.id,
        this.tax,
        this.price,
        this.subTotal,
        this.date,
        this.paymentMethod,
        this.qty,
        this.extra,
        this.items});

  OrderDetailsModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tax = json['tax'];
    price = json['price'];
    subTotal = json['sub_total'];
    date = json['date'];
    paymentMethod = json['payment_method'];
    qty = json['qty'];
    extra = json['extra'] != null ? new Extra.fromJson(json['extra']) : null;
    items = json['items'] != null ? new Items.fromJson(json['items']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tax'] = this.tax;
    data['price'] = this.price;
    data['sub_total'] = this.subTotal;
    data['date'] = this.date;
    data['payment_method'] = this.paymentMethod;
    data['qty'] = this.qty;
    if (this.extra != null) {
      data['extra'] = this.extra!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.toJson();
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
        this.image});

  Items.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}



class Extra {
  List<ExtraData>? data;

  Extra({this.data});

  Extra.fromJson(Map<String, dynamic> json) {
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
